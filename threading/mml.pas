// ------------------------------------------------------------------------------
// Finders uses a shared buffer when building a result TPA, so several threads should
// never use any such method at the same time, so we have to go into a critical lockdown
// while it's being used so, so it can not be executed by more than one thread at a time.
type TMMLFinderLock = type Boolean;
var MML_FINDER_LOCK: TMMLFinderLock;

procedure TMMLFinderLock.WaitForUnlockAndLock();
begin
  while (Self = True) do Sleep(1);
  Self := True;
end;

procedure TMMLFinderLock.Unlock();
begin
  Self := False;
end;



//------------------------------------------------------------------------------
// MML misc
var __SCRIPT_START_TIME: UInt64 := GetTickCount();
function GetTimeRunning(): LongWord; override;
begin
  Result := GetTickCount() - __SCRIPT_START_TIME;
end;

procedure SetTarget(Proc: TSysProc); override;
begin
  Client.GetIOManager().SetTargetEx(Proc);
end;


//------------------------------------------------------------------------------
// MML Color
function GetColor(x,y: Integer) : TColor; override;
begin;
  Result := Client.GetIOManager().GetColor(x,y);
end;

function GetColors(const Coords : TPointArray) : TIntegerArray; override;
begin
  Result := Client.GetMFinder().GetColors(coords);
end;

function FindColor(var x, y: Integer; color, x1, y1, x2, y2: Integer): Boolean; override;
begin
  Result := Client.GetMFinder().FindColor(x, y, color, x1, y1, x2, y2);
end;

function FindColorTolerance(var x, y: Integer; color, x1, y1, x2, y2, tol: Integer): Boolean; override;
begin
  Result := Client.GetMFinder().FindColorTolerance(x, y, color, x1, y1, x2, y2, tol);
end;

function FindColors(var TPA: TPointArray; Color, x1, y1, x2, y2: Integer): Boolean; override;
begin
  MML_FINDER_LOCK.WaitForUnlockAndLock();
  Result := Client.GetMFinder().FindColors(TPA, color, x1, y1, x2, y2);
  MML_FINDER_LOCK.Unlock();
end;

procedure SetColorToleranceSpeed(cts: Integer); override;
begin
  Client.GetMFinder().SetToleranceSpeed(cts);
end;

function GetToleranceSpeed: Integer; override;
begin
  Result := Client.GetMFinder().GetToleranceSpeed;
end;

procedure SetToleranceSpeed2Modifiers(nHue, nSat: Extended); override;
begin
  Client.GetMFinder().SetToleranceSpeed2Modifiers(nHue, nSat);
end;

procedure GetToleranceSpeed2Modifiers(var hMod, sMod: Extended); override;
begin
  Client.GetMFinder().GetToleranceSpeed2Modifiers(hMod, sMod);
end;

procedure SetToleranceSpeed3Modifier(Modifier: Extended); override;
begin
  Client.GetMFinder().SetToleranceSpeed3Modifier(Modifier);
end;

function GetToleranceSpeed3Modifier: extended; override;
begin
  Result := Client.GetMFinder().GetToleranceSpeed3Modifier();
end;

function SimilarColors(Col1,Col2,Tol : Integer) : Boolean; override;
begin;
  Result := Client.GetMFinder().SimilarColors(Col1,Col2,Tol);
end;

function CountColor(Color, xs, ys, xe, ye: Integer): Integer; override;
begin;
  Result := Client.GetMFinder().CountColor(color,xs,ys,xe,ye);
end;
function CountColorTolerance(Color, xs, ys, xe, ye, Tolerance: Integer): Integer; override;
begin;
  Result := Client.GetMFinder().CountColorTolerance(color,xs,ys,xe,ye,tolerance);
end;

function FindColorsTolerance(var Points: TPointArray; Color, xs, ys, xe, ye, Tolerance: Integer): Boolean; override;
begin;
  MML_FINDER_LOCK.WaitForUnlockAndLock();
  Result := Client.GetMFinder().FindColorsTolerance(points,color,xs,ys,xe,ye,tolerance);
  MML_FINDER_LOCK.Unlock();
end;

function FindColorSpiral(var x, y: Integer; color, xs, ys, xe, ye: Integer): Boolean; override;
begin;
  Result := Client.GetMFinder().FindColorSpiral(x,y,color,xs,ys,xe,ye);
end;

function FindColorSpiralTolerance(var x, y: Integer; color, xs, ys, xe, ye,Tol: Integer): Boolean; override;
begin
  Result := Client.GetMFinder().FindColorSpiralTolerance(x,y,color,xs,ys,xe,ye,tol);
end;

function FindColorsSpiralTolerance(x, y: Integer; var Points: TPointArray; color, xs, ys, xe, ye: Integer; Tolerance: Integer) : Boolean; override;
begin
  MML_FINDER_LOCK.WaitForUnlockAndLock();
  Result := Client.GetMFinder().FindColorsSpiralTolerance(x,y,Points,color,xs,ys,xe,ye,tolerance);
  MML_FINDER_LOCK.Unlock();
end;

function FindColoredArea(var x, y: Integer; color, xs, ys, xe, ye: Integer; MinArea: Integer): Boolean; override;
begin
  Result := Client.GetMFinder().FindColoredArea(x,y,color,xs,ys,xe,ye,minarea);
end;

function FindColoredAreaTolerance(var x, y: Integer; Color, xs, ys, xe, ye, MinArea, tol: Integer): Boolean;  override;
begin
  Result := Client.GetMFinder().FindColoredAreaTolerance(x,y,color,xs,ys,xe,ye,minarea,tol);
end;


//------------------------------------------------------------------------------
// MML Bitmap
function CreateBitmapString(bmp : Integer) : string; override;
begin;
  Result := Client.GetMBitmaps().GetBMP(bmp).ToString;
end;

function GetMufasaBitmap(bmp : Integer): TMufasaBitmap; override;
begin;
  Result := Client.GetMBitmaps().GetBMP(bmp);
end;

function CreateBitmap(w,h : Integer):Integer; override;
begin
  Result := Client.GetMBitmaps().CreateBMP(w,h);
end;

procedure FreeBitmap(Number : Integer); override;
begin
  Client.GetMBitmaps().GetBMP(Number).Free();
end;

procedure SaveBitmap(Bmp : Integer; path : string); override;
begin;
  Client.GetMBitmaps().GetBMP(Bmp).SaveToFile(Path);
end;

procedure SetPersistentMemoryBitmap(bmp: Integer; mem: PtrUInt; awidth, aheight: Integer); override;
begin
  Client.GetMBitmaps().GetBMP(bmp).SetPersistentMemory(mem, awidth, aheight);
end;

procedure ResetPersistentMemoryBitmap(bmp: Integer); override;
begin
  Client.GetMBitmaps().GetBMP(bmp).ResetPersistentMemory;
end;

function BitmapFromString(Width,height : Integer; Data : string) : Integer; override;
begin;
  Result := Client.GetMBitmaps().CreateBMPFromString(Width,Height,Data);
end;

function LoadBitmap(Path : String) : Integer; override;
begin;
  Result := Client.GetMBitmaps().CreateBMPFromFile(Path);
end;

procedure SetBitmapSize(Bmp,NewW,NewH : Integer); override;
begin;
  if (NewW>=0) and (NewH >=0) then
    Client.GetMBitmaps().GetBMP(Bmp).SetSize(NewW,NewH)
  else
    raise Format('Wrong Width or Height in SetBitmapSize: (%d,%d)',[NewW,NewH]);
end;

procedure StretchBitmapResize(Bmp,NewW,NewH : Integer); override;
begin;
  if (NewW>=0) and (NewH >=0) then
    Client.GetMBitmaps().GetBMP(Bmp).StretchResize(NewW,NewH)
  else
    raise Format('Wrong Width or Height in ScretchResize: (%d,%d)',[NewW,NewH]);
end;

procedure GetBitmapSize(Bmp : Integer; var BmpW,BmpH : Integer); override;
begin;
  BmpW := Client.GetMBitmaps().GetBMP(bmp).GetWidth();
  BmpH := Client.GetMBitmaps().GetBMP(bmp).GetWidth();
end;

procedure SetBitmapName(Bmp : Integer; name : string); override;
begin;
  Client.GetMBitmaps().GetBMP(Bmp).SetName(name);
end;

function CreateMirroredBitmap(Bmp : Integer) : Integer; override;
begin;
  Result := Client.GetMBitmaps().CreateMirroredBitmap(Bmp, MirrorWidth);
end;

function CreateMirroredBitmapEx(Bmp : Integer; MirrorStyle : TBmpMirrorStyle) : Integer; override;
begin;
  Result := Client.GetMBitmaps().CreateMirroredBitmap(Bmp,MirrorStyle);
end;

function FastGetPixel(bmp,x,y : Integer) : LongWord; override;
begin;
  Result := Client.GetMBitmaps().GetBMP(Bmp).GetPixel(x,y);
end;

function FastGetPixels(bmp : Integer; TPA : TPointArray) : TIntegerArray; override;
begin;
  Result := Client.GetMBitmaps().GetBMP(Bmp).GetPixels(TPA);
end;

function GetBitmapAreaColors(bmp,xs, ys, xe, ye: Integer): T2DIntArray;override;
begin
  Result := Client.GetMBitmaps().GetBMP(bmp).GetAreaColors(xs,ys,xe,ye);
end;

procedure FastSetPixel(Bmp,x,y : Integer; Color : TColor); override;
begin
  Client.GetMBitmaps().GetBMP(bmp).SetPixel(x,y,color);
end;

procedure FastSetPixels(Bmp : Integer; TPA : TPointArray; Colors : TIntegerArray); override;
begin;
  Client.GetMBitmaps().GetBMP(Bmp).SetPixels(TPA,Colors);
end;

procedure DrawTPABitmap(bitmap : Integer; TPA : TPointArray; Color : Integer); override;
begin
  Client.GetMBitmaps().GetBMP(Bitmap).DrawTPA(TPA,Color);
end;

procedure DrawATPABitmap(bitmap : Integer; ATPA : T2DPointArray); override;
begin
  Client.GetMBitmaps().GetBMP(bitmap).DrawATPA(ATPA);
end;

procedure DrawATPABitmapEx(bitmap : Integer; ATPA : T2DPointArray; Colors : TIntegerArray); override;
begin
  Client.GetMBitmaps().GetBMP(bitmap).DrawATPA(ATPA,Colors);
end;

procedure LineToBitmap(bitmap : Integer; Src,Dest: TPoint; Color : Integer);
begin
  Client.GetMBitmaps().GetBMP(Bitmap).LineTo(Src,Dest,Color);
end;

procedure FastDrawClear(bmp : Integer; Color : TColor); override;
begin;
  Client.GetMBitmaps().GetBMP(bmp).DrawClear(Color);
end;

procedure DrawBitmap(Bmp: Integer; Dest: TCanvas; x, y: Integer);override;
begin
  Client.GetMBitmaps().GetBMP(bmp).DrawToCanvas(x,y,dest);
end;

procedure FastDrawTransparent(x, y: Integer; SourceBitmap, TargetBitmap: Integer); override;
begin;
  Client.GetMBitmaps().GetBMP(SourceBitmap).DrawTransparent(x,y,Client.GetMBitmaps().GetBMP(TargetBitmap));
end;

procedure SetTransparentColor(Bmp : Integer; Color : TColor); override;
begin
  Client.GetMBitmaps().GetBMP(Bmp).SetTransparentColor(Color);
end;

function GetTransparentColor(Bmp : Integer) : TColor; override;
begin;
  Result := Client.GetMBitmaps().GetBMP(bmp).GetTransparentColor;
end;

procedure FastReplaceColor(bmp: Integer; OldColor, NewColor: TColor); override;
begin
  Client.GetMBitmaps().GetBMP(Bmp).ReplaceColor(OldColor,NewColor);
end;

procedure CopyClientToBitmap(bmp, xs, ys, xe, ye: Integer); override;
begin
  Client.GetMBitmaps().GetBMP(bmp).CopyClientToBitmap(Client.GetIOManager(), True, xs, ys, xe, ye);
end;

function BitmapFromClient(const xs, ys, xe, ye: Integer): Integer; override;
begin;
  result := Client.GetMBitmaps().CreateBMP(0,0);
  Client.GetMBitmaps().GetBMP(result).CopyClientToBitmap(Client.GetIOManager(),True,xs,ys,xe,ye);
end;

function FindBitmap(Bitmap: Integer; var x, y: Integer): Boolean; override;
begin
  Result := Client.GetMFinder().FindBitmap(Client.GetMBitmaps().GetBMP(bitmap),x,y);
end;

function FindBitmapIn(bitmap: Integer; var x, y: Integer;  xs, ys, xe, ye: Integer): Boolean; override;
begin
  Result := Client.GetMFinder().FindBitmapIn(Client.GetMBitmaps().GetBMP(bitmap),x,y,xs,ys,xe,ye);
end;

function FindBitmapToleranceIn(bitmap: Integer; var x, y: Integer; xs, ys, xe, ye: Integer; tolerance: Integer): Boolean; override;
begin
  Result := Client.GetMFinder().FindBitmapToleranceIn(Client.GetMBitmaps().GetBMP(bitmap),x,y,xs,ys,xe,ye,tolerance);
end;


function FindBitmapSpiral(bitmap: Integer; var x, y: Integer; xs, ys, xe, ye: Integer): Boolean; override;
begin
  Result := Client.GetMFinder().FindBitmapSpiral(Client.GetMBitmaps().GetBMP(bitmap),x,y,xs,ys,xe,ye);
end;

function FindBitmapsSpiralTolerance(bitmap: Integer; x, y: Integer; var Points : TPointArray; xs, ys, xe, ye,tolerance: Integer): Boolean; override;
begin
  MML_FINDER_LOCK.WaitForUnlockAndLock();
  Result := Client.GetMFinder().FindBitmapsSpiralTolerance(Client.GetMBitmaps().GetBMP(bitmap),x,y,points,xs,ys,xe,ye,tolerance);
  MML_FINDER_LOCK.Unlock();
end;

function FindBitmapSpiralTolerance(bitmap: Integer; var x, y: Integer; xs, ys, xe, ye,tolerance : Integer): Boolean; override;
begin;
  Result := Client.GetMFinder().FindBitmapSpiralTolerance(Client.GetMBitmaps().GetBMP(bitmap),x,y,xs,ys,xe,ye,tolerance);
end;

function RotateBitmap(bitmap: Integer; angle: Extended): Integer; override;
begin 
  with Client.GetMBitmaps() do
  begin
    Result := CreateBMP(0,0);
    GetBmp(Bitmap).RotateBitmap(angle, GetBmp(Result));
  end;
end;

function Desaturate(Bitmap : Integer) : Integer; override;
begin;
  with Client.GetMBitmaps() do
  begin;
    result := CreateBMP(0,0);
    GetBmp(Bitmap).Desaturate(GetBmp(Result));
  end;
end;

procedure InvertBitmap(Bitmap : Integer); override;
begin;
  Client.GetMBitmaps().GetBMP(Bitmap).Invert;
end;

function CopyBitmap(Bitmap : Integer) : Integer; override;
begin;
  result := Client.GetMBitmaps().CopyBMP(bitmap);
end;

function GreyScaleBitmap(Bitmap : Integer) : Integer; override;
begin;
  with Client.GetMBitmaps() do
  begin;
    Result := CreateBMP(0,0);
    GetBmp(Bitmap).GreyScale(GetBmp(result));
  end;
end;

function BrightnessBitmap(Bitmap,br : Integer) : Integer; override;
begin;
  with Client.GetMBitmaps() do
  begin;
    Result := CreateBMP(0,0);
    GetBmp(Bitmap).Brightness(GetBmp(result),br);
  end;
end;
function ContrastBitmap(bitmap : Integer; co : Extended) : Integer; override;
begin;
  with Client.GetMBitmaps() do
  begin;
    result := CreateBMP(0,0);
    GetBmp(Bitmap).Contrast(GetBmp(result),co);
  end;
end;

function PosterizeBitmap(Bitmap : Integer; po : Integer) : Integer; override;
begin;
  with Client.GetMBitmaps() do
  begin
    Result := CreateBMP(0,0);
    GetBmp(bitmap).Posterize(GetBmp(result),po);
  end;
end;

function CreateMaskFromBitmap(Bitmap : Integer) : TMask; override;
begin;
  Result := Client.GetMBitmaps().GetBMP(Bitmap).CreateTMask;
end;

function FindMaskTolerance(const mask: TMask; var x, y: Integer; xs,ys, xe, ye: Integer; Tolerance, ContourTolerance: Integer): Boolean; override;
begin;
  Result := Client.GetMFinder().FindMaskTolerance(Mask,x,y,xs,ys,xe,ye,tolerance,contourtolerance);
end;

function FindBitmapMaskTolerance(mask: Integer; var x, y: Integer; xs, ys, xe, ye: Integer; Tolerance, ContourTolerance: Integer): Boolean; override;
begin;
  Result := Client.GetMFinder().FindMaskTolerance(Client.GetMBitmaps().GetBMP(mask).CreateTMask,x,y,xs,ys,xe,ye,tolerance,contourtolerance);
end;

function FindDeformedBitmapToleranceIn(bitmap: Integer; var x,
  y: Integer; xs, ys, xe, ye: Integer; tolerance: Integer; Range: Integer;
  AllowPartialAccuracy: Boolean; var accuracy: Extended): Boolean; override;
begin;
  result := Client.GetMFinder().FindDeformedBitmapToleranceIn(Client.GetMBitmaps().GetBMP(Bitmap),x,y,xs,ys,xe,ye,tolerance,range,AllowPartialAccuracy,accuracy);
end;

procedure RectangleBitmap(bitmap : Integer; const box : TBox; Color : TColor); override;
begin
  Client.GetMBitmaps().GetBMP(bitmap).Rectangle(box,Color);
end;

procedure FloodFillBitmap(bitmap : Integer; const StartPoint : TPoint; const SearchCol,ReplaceCol : TColor); override;
begin
  Client.GetMBitmaps().GetBMP(bitmap).FloodFill(startPoint,searchcol,replacecol);
end;

function ConvoluteBitmap(bitmap : Integer; matrix : T2DExtendedArray) : Integer; override;
begin
  with Client.GetMBitmaps() do
  begin
    result := CreateBMP(0,0);
    GetBmp(bitmap).Convolute(GetBmp(Result),matrix);
  end;
end;

(*
function CalculatePixelShift(Bmp1,Bmp2 : Integer; CompareBox : TBox) : Integer;override;
begin
  with Client.GetMBitmaps() do
    result := CalculatePixelShift(GetBMP(bmp1),GetBMP(bmp2),comparebox);
end;

function CalculatePixelShiftTPA(Bmp1, Bmp2: Integer; CPoints: TPointArray): Integer;override;
begin
  with Client.GetMBitmaps() do
    result := CalculatePixelShiftTPA(GetBMP(bmp1),GetBMP(bmp2),CPoints);
end;

function CalculatePixelTolerance(Bmp1,Bmp2 : Integer; CompareBox : TBox; CTS : Integer) : extended;override;
begin
  with Client.GetMBitmaps() do
    result := CalculatePixelTolerance(GetBMP(bmp1),GetBMP(bmp2),comparebox,cts);
end;

function CalculatePixelToleranceTPA(Bmp1,Bmp2 : Integer; CPoints: TPointArray; CTS : Integer) : extended;override;
begin
  with Client.GetMBitmaps() do
    result := CalculatePixelToleranceTPA(GetBMP(bmp1),GetBMP(bmp2),CPoints,cts);
end;
*)

function BitmapExists(Index : Integer) : Boolean; override;
begin
  with Client.GetMBitmaps() do
    Result := ExistsBMP(Index);
end;

function FindColorsBitmap(bmp: Integer; var points: TPointArray; const color: Integer): Boolean; override;
begin;
  MML_FINDER_LOCK.WaitForUnlockAndLock();
  Result := Client.GetMBitmaps().GetBMP(bmp).FindColors(points, color);
  MML_FINDER_LOCK.Unlock();
end;

procedure CropBitmap(const bmp: Integer; const xs, ys, xe, ye: Integer); override;
begin
  Client.GetMBitmaps().GetBMP(bmp).Crop(xs, ys, xe, ye);
end;

function GetColorsBitmap(const bmp: Integer): TIntegerArray; override;
begin
  result := Client.GetMBitmaps().GetBMP(bmp).GetColors();
end;

function BitmapToMatrix(const bmp: Integer): T2DIntegerArray; override;
begin
  result := Client.GetMBitmaps().GetBMP(bmp).ToMatrix();
end;

procedure DrawMatrixBitmap(const bmp: Integer; const matrix: T2DIntegerArray); override;
begin
  Client.GetMBitmaps().GetBMP(bmp).DrawMatrix(matrix);
end;

procedure ResizeBitmapEx(const bmp: Integer; const Method: TBmpResizeMethod; const NewWidth, NewHeight: Integer); override;
begin
  Client.GetMBitmaps().GetBMP(bmp).ResizeEx(Method, NewWidth, NewHeight);
end;

procedure ThresholdAdaptiveBitmap(const bmp: Integer; Alpha, Beta: Byte; Invert: Boolean; Method: TBmpThreshMethod; C: Integer); override;
begin
  Client.GetMBitmaps().GetBMP(bmp).ThresholdAdaptive(Alpha, Beta, Invert, Method, C);
end;

procedure BlurBitmap(const bmp, block: Integer); override;
begin
  Client.GetMBitmaps().GetBMP(bmp).Blur(block);
end;

function RotateBitmapEx(Bitmap: Integer; Angle: Single; Expand: Boolean; Smooth: Boolean): Integer; override;
begin
  with Client.GetMBitmaps() do
  begin
    Result := CreateBMP(0,0);
    GetBmp(Bitmap).RotateBitmapEx(Angle, Expand, Smooth, GetBmp(Result));
  end;
end;

procedure RectangleBitmapEx(const Bitmap: Integer; const Box: TBox; const Color: Integer; const Transparency: Extended); override;
begin
  Client.GetMBitmaps().GetBmp(Bitmap).Rectangle(Box, Color, Transparency);
end;

procedure DrawTextBitmap(const Bitmap: Integer; const Text, FontName: string; const pnt: TPoint; const Shadow: Boolean; const Color: Integer); override;
begin
  Client.GetMBitmaps().GetBmp(Bitmap).DrawText(Text, FontName, Pnt, Shadow, Color);
end;

procedure DrawSystemTextBitmap(const Bitmap: Integer; const Text, FontName: string; const FontSize: Integer; const pnt: TPoint; const Shadow: Boolean; const Color: Integer); override;
begin
  Client.GetMBitmaps().GetBmp(Bitmap).DrawSystemText(Text, FontName, FontSize, Pnt, Shadow, Color);
end;


//------------------------------------------------------------------------------
// MML DTM
function FindDTM(DTM: Integer; var x, y: Integer; xs, ys, xe, ye: Integer): Boolean; override;
begin
  Result := Client.GetMFinder.FindDTM(Client.GetMDTMs().GetDTM(DTM),x,y,xs,ys,xe,ye);
end;

function FindDTMs(DTM: Integer; var p: TPointArray; xs, ys, xe, ye: Integer): Boolean; override;
begin
  MML_FINDER_LOCK.WaitForUnlockAndLock();
  Result := Client.GetMFinder().FindDTMs(Client.GetMDTMs().GetDTM(DTM), p, xs, ys, xe, ye);
  MML_FINDER_LOCK.Unlock();
end;

function FindDTMRotatedAlternating(DTM: Integer; var x, y: Integer; xs, ys, xe, ye:
                           Integer; sAngle, eAngle, aStep: Extended;
                           var aFound: Extended): Boolean; override;
begin
  Result := Client.GetMFinder().FindDTMRotated(Client.getMDTMs().GetDTM(DTM), x,y, xs, ys, xe, ye, sAngle, eAngle, aStep, aFound,true);
end;

function FindDTMRotatedSE(DTM: Integer; var x, y: Integer; xs, ys, xe, ye:
                           Integer; sAngle, eAngle, aStep: Extended;
                           var aFound: Extended): Boolean; override;
begin
  Result := Client.GetMFinder().FindDTMRotated(Client.GetMDTMs().GetDTM(DTM), x, y, xs, ys, xe, ye, sAngle, eAngle, aStep, aFound,false);
end;

function FindDTMsRotatedAlternating(DTM: Integer; var Points: TPointArray; xs, ys, xe, ye: Integer; sAngle, eAngle, aStep: Extended; var aFound: T2DExtendedArray): Boolean; override;
begin
  MML_FINDER_LOCK.WaitForUnlockAndLock();
  Result := Client.GetMFinder().FindDTMsRotated(Client.GetMDTMs().GetDTM(DTM), Points, xs, ys, xe, ye,
                                  sAngle, eAngle, aStep, aFound, True);
  MML_FINDER_LOCK.Unlock();
end;

function FindDTMsRotatedSE(DTM: Integer; var Points: TPointArray; xs, ys, xe, ye: Integer; sAngle, eAngle, aStep: Extended; var aFound: T2DExtendedArray): Boolean; override;
begin
  MML_FINDER_LOCK.WaitForUnlockAndLock();
  Result := Client.GetMFinder().FindDTMsRotated(Client.GetMDTMs().GetDTM(DTM), Points, xs, ys, xe, ye,
                                  sAngle, eAngle, aStep, aFound, False);
  MML_FINDER_LOCK.Unlock();
end;

procedure SetDTMName(DTM : Integer;const name : string); override;
begin
  Client.GetMDTMs.GetDTM(DTM).SetName(Name);
end;

function DTMFromString(const DTMString: String): Integer; override;
begin
  Result := Client.GetMDTMs().StringToDTM(DTMString);
end;

procedure FreeDTM(DTM: Integer); override;
begin
  Client.GetMDTMs().FreeDTM(DTM);
end;

function GetDTM(index: Integer) : TMDTM; override;
begin
  result := Client.GetMDTMs().GetDTM(Index);
end;

function AddSDTM(const d: TSDTM): Integer; override;
begin
  Result := Client.GetMDTMs().AddDTM(d);
end;

function AddDTM(const d: TMDTM): Integer; override;
begin
  Result := Client.GetMDTMs().AddDTM(d);
end;

function SDTMToMDTM(Const DTM: TSDTM): TMDTM; override;
begin
  result := SDTMToMDTM(DTM);
  Client.GetMDTMs().AddDTM(result);
end;

function DTMExists(index : Integer) : Boolean; override;
begin
  result := Client.GetMDTMs().ExistsDTM(index);
end;


//------------------------------------------------------------------------------
// MML Mouse
procedure MoveMouse(x, y: Integer); override;
begin
  Client.GetIOManager().MoveMouse(X, Y);
end;

procedure ScrollMouse(x,y : Integer; Clicks : Integer); override;
begin
  Client.GetIOManager().ScrollMouse(x,y,Clicks);
end;

procedure GetMousePos(var x, y: Integer); override;
begin
   Client.GetIOManager().GetMousePos(X, Y);
end;

function __ConvIntClickType(x : Integer) : TClickType;
begin;
  case x of
    0: Result := mouse_Right;
    1: Result := mouse_left;
    2: Result := mouse_Middle;
  else
    raise Format('Unknown Clicktype (%d) passed.', [x]);
  end;
end;

procedure HoldMouse(x, y: Integer; clickType: Integer); override;
begin
   Client.GetIOManager().HoldMouse(x, y, __ConvIntClickType(clickType));
end;

procedure ReleaseMouse(x, y: Integer; clickType: Integer); override;
begin
   Client.GetIOManager().ReleaseMouse(x, y, __ConvIntClickType(clickType));
end;

procedure ClickMouse(x, y: Integer; clickType: Integer); override;
begin
   Client.GetIOManager().ClickMouse(x, y, __ConvIntClickType(clickType));
end;

function IsMouseButtonDown(button : Integer) : Boolean; override;
begin
  result := Client.GetIOManager().IsMouseButtonDown(__ConvIntClickType(button));
end;


//------------------------------------------------------------------------------
// MML Keyboard
procedure KeyDown(key: Word); override;
begin
  Client.GetIOManager().KeyDown(key);
end;

procedure KeyUp(key: Word); override;
begin
  Client.GetIOManager().KeyUp(key);
end;

procedure SendKeys(const s: string; keywait, keymodwait: Integer); override;
begin
  Client.GetIOManager().SendText(s, keywait, keymodwait);
end;

procedure PressKey(key: Word); override;
begin
  Client.GetIOManager().PressKey(key);
end;

function isKeyDown(key: Word): Boolean; override;
begin
  Result := Client.GetIOManager().isKeyDown(key);
end;

function GetKeyCode(c :char) : Integer; override;
begin
  result := Client.GetIOManager().GetKeyCode(c);
end;


//------------------------------------------------------------------------------
// MML files
function CreateFile(const Path: string): Integer; override;
begin
  Result := Client.GetMFiles().CreateFile(Path);
end;

function OpenFile(const Path: string; Shared: Boolean): Integer; override;
begin
  Result := Client.GetMFiles().OpenFile(Path, Shared);
end;

function RewriteFile(const Path: string; Shared: Boolean): Integer; override;
begin
  Result := Client.GetMFiles().RewriteFile(Path, Shared);
end;

function AppendFile(const Path: string): Integer; override;
begin
  Result := Client.GetMFiles().AppendFile(Path);
end;

procedure CloseFile(FileNum: Integer); override;
begin
  Client.GetMFiles().CloseFile(FileNum);
end;

function EndOfFile(FileNum: Integer): Boolean; override;
begin
  Result := Client.GetMFiles().EndOfFile(FileNum);
end;

function FileSize(FileNum: Integer): LongInt; override;
begin
  Result := Client.GetMFiles().FileSizeMuf(FileNum);
end;

function ReadFileString(FileNum: Integer; var s: string; x: Integer): Boolean; override;
begin
  Result := Client.GetMFiles().ReadFileString(FileNum, s, x);
end;

function WriteFileString(FileNum: Integer; s: string): Boolean; override;
begin
  Result := Client.GetMFiles().WriteFileString(FileNum, s);
end;

function SetFileCharPointer(FileNum, cChars, Origin: Integer): Integer; override;
begin
  Result := Client.GetMFiles().SetFileCharPointer(Filenum, cChars, Origin);
end;

function FilePointerPos(FileNum: Integer): Integer; override;
begin
  Result := Client.GetMFiles().FilePointerPos(FileNum);
end;

function DeleteFile(const Filename: string): Boolean; override;
begin
  Result := Client.GetMFiles().DeleteFile(Filename);
end;

function RenameFile(const OldName, Newname: string): Boolean; override;
begin
  Result := Client.GetMFiles().RenameFile(OldName, NewName);
end;

procedure WriteINI(const Section, KeyName, NewString, FileName: string); override;
begin;
  Client.GetMFiles().WriteINI(Section, KeyName, NewString, FileName);
end;

function ReadINI(const Section, KeyName, FileName: string): string; override;
begin;
  result := Client.GetMFiles().ReadINI(Section, KeyName, FileName);
end;

procedure DeleteINI(const Section, KeyName, FileName: string); override;
begin;
  Client.GetMFiles().DeleteINI(Section, KeyName, FileName);
end;


//------------------------------------------------------------------------------
// MML Window
procedure SetDesktopAsClient(); override;
begin;
  Client.GetIOManager().SetDesktop;
end;

function SetTargetArray(P: Integer; w, h: Integer): Integer; override;
begin
  result:= Client.GetIOManager().SetTarget(PRGB32(P), Point(w,h));
end;

function SetTargetBitmap(bitmap: Integer): Integer; override;
begin;
  result:= Client.GetIOManager().SetTarget(Client.GetMBitmaps.GetBMP(Bitmap));
end;

function SetEIOSTarget(name, args: String): Integer; override;
begin
  result:= Client.GetIOManager().SetTarget(name, args);
end;

function MouseSetClientArea(x1, y1, x2, y2: Integer): Boolean; override;
begin
  result := Client.GetIOManager().MouseSetClientArea(x1, y1, x2, y2);
end;

procedure MouseResetClientArea(); override;
begin
  Client.GetIOManager().MouseResetClientArea();
end;

function ImageSetClientArea(x1, y1, x2, y2: Integer): boolean; override;
begin
  result := Client.GetIOManager().ImageSetClientArea(x1, y1, x2, y2);
end;

procedure ImageResetClientArea(); override;
begin
  Client.GetIOManager().ImageResetClientArea;
end;

procedure SetImageTarget(idx: Integer); override;
begin
  Client.GetIOManager().SetImageTarget(idx);
end;

procedure SetKeyMouseTarget(idx: Integer); override;
begin
  Client.GetIOManager().SetKeyMouseTarget(idx);
end;

function GetImageTarget(): Integer; override;
begin
  Result := PtrUInt(Client.GetIOManager().GetImageTarget());
end;

function GetKeyMouseTarget(): Integer; override;
begin
  Result := PtrUInt(Client.GetIOManager().GetKeyMouseTarget());
end;

function ExportImageTarget(): TTarget_Exported; override;
begin;
  Result := Client.GetIOManager().ExportImageTarget();
end;

function ExportKeyMouseTarget(): TTarget_Exported; override;
begin;
  Result := Client.GetIOManager().ExportKeyMouseTarget();
end;

procedure FreeTarget(idx: Integer); override;
begin
  Client.GetIOManager().FreeTarget(idx);
end;

procedure GetClientDimensions(var w, h: Integer); override;
begin
  Client.GetIOManager().GetDimensions(w, h);
end;

procedure GetClientPosition(var left, top: Integer); override;
begin
  Client.GetIOManager().GetPosition(left, top);
end;

function Freeze: Boolean; override;
begin
  Client.GetIOManager().SetFrozen(True);
  result := true; //dunno what the result is supposed to mean
end;

function Unfreeze: Boolean; override;
begin
  Client.GetIOManager().SetFrozen(False);
  result := True; //dunno what the result is supposed to mean
end;

procedure ActivateClient(); override;
begin
  Client.GetIOManager().ActivateClient();
end;

function IsTargetValid: Boolean; override;
begin
  result:= Client.GetIOManager().TargetValid();
end;

function GetNativeWindow: Integer; override;
begin
  result := Client.GetIOManager().GetImageTarget.GetHandle();
end;

