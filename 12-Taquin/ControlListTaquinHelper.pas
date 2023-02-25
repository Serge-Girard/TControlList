unit ControlListTaquinHelper;

interface

uses WinApi.Windows, WinApi.Messages,
  System.Types, System.Math, System.Classes, System.Generics.Collections,
  Vcl.ControlList;

type
  TControlListHelper = class helper for TCustomControlList
  public
    function _Columns : Integer;
    function _Rows : Integer;
    function _ItemAtPos(X, Y: Integer;
                        iv: TDictionary<Integer, TRect>=nil): Integer;
    function _GetItemRect(AIndex : Integer): TRect;
  end;

var VisibleItems : TDictionary<integer,TRect>;

implementation

{ TControlListHelper }


/// <summary>
/// Get the rect of the drawed item on the TControlList
/// </summary>
/// <param name="AIndex">
///   Index of the item
/// </param>
/// <returns>a TRect
/// </returns>
function TControlListHelper._GetItemRect(AIndex : Integer): TRect;
begin
  Result := TRect.Empty;
  case InternalColumnLayout of
    cltSingle:
      begin
        Result.Top := ItemHeight * AIndex;
        Result.Height := ItemHeight;
        Result.Width := IfThen(ItemWidth = 0, Width - 28, ItemWidth);
      end;
    cltMultiTopToBottom:
      begin
        var Cols : integer :=_Columns;
        Result.Left := (AIndex mod Cols) * ItemWidth;
        Result.Top := ((AIndex div Cols) * ItemHeight);
        Result.Height := ItemHeight;
        Result.Width := ItemWidth;
      end;
    cltMultiLeftToRight:
      begin
        var Rows : integer :=_Rows;
        Result.Left := (AIndex div Rows) * ItemWidth;
        Result.Top := (AIndex mod Rows) * ItemHeight;
        Result.Height := ItemHeight;
        Result.Width := ItemWidth;
      end;
  end;
end;

/// <summary>
/// Get index of the TControlList item
/// </summary>
/// <param name="X">
///  X coordinate of the mouse
/// </param>
/// <param name="Y">
///  Y coordinate of the mouse
/// </param>
/// <param name="iv">
///  Items visible on the TControlList
///  a TDictionary<Integer,TRect> to implement during OnDrawItem or AfterDrawItem event
/// </param>
/// <remarks>
///
/// </remarks>
/// <returns>Item index; -1 if invalid
/// </returns>
function TControlListHelper._ItemAtPos(X, Y: Integer;
  iv: TDictionary<Integer, TRect>=nil): Integer;
var
  I: Integer;
  ofHorz, ofVert: Integer;
  ARect: TRect;
begin
  if not Assigned(iv) then iv:=VisibleItems;
  ofHorz := GetScrollPos(Handle, SB_HORZ);
  ofVert := GetScrollPos(Handle, SB_VERT);
  Result := -1;
  for I := 0 to ItemCount - 1 do
  begin
    if iv.TryGetValue(I, ARect) then
    begin
      if ARect.Contains(TPoint.Create(X + ofHorz, Y + ofVert)) then
        exit(I);
    end;
  end;
end;

/// <summary>
/// Get number of columns of the TControlList
/// </summary>
/// <returns>Number of columns
/// </returns>
function TControlListHelper._Columns: Integer;
begin
case InternalColumnLayout of
  cltSingle : result:=1;
  cltMultiTopToBottom : result:=ClientWidth div ItemWidth;
  cltMultiLeftToRight : begin
                           var nr : integer := _Rows;
                           result:=ItemCount div nr;
                           if (ItemCount mod nr)>0 then inc(Result);
                        end;
 end;
end;

/// <summary>
/// Get number of rows of the TControlList
/// </summary>
/// <returns>Number of rows
/// </returns>
function TControlListHelper._Rows: Integer;
begin
result:=1;
case InternalColumnLayout of
  cltSingle : result:=ItemCount;
  cltMultiTopToBottom : begin
                          var nc : integer := _Columns;
                          result:=ItemCount div nc;
                          if (ItemCount mod nc)>0 then inc(result);
                        end;
  cltMultiLeftToRight : result:=ClientHeight div ItemHeight;
 end;
end;


initialization
  VisibleItems := TDictionary<integer,TRect>.Create;
finalization
  VisibleItems.Free;

end.
