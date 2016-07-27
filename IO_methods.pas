//--------------------------------------------------------------------------------------------------------------------\\
//-----| Desktop App UI  >  Windows and Messages  >  Configuration  |-------------------------------------------------||
//--------------------------------------------------------------------------------------------------------------------//
//int WINAPI GetSystemMetrics(_In_ int nIndex);
function LibUser32.GetSystemMetrics(nIndex:Int32): Int32; static; external 'GetSystemMetrics@user32.dll stdcall';


//--------------------------------------------------------------------------------------------------------------------\\
//-----| Cursors  >  Cursor Reference  >  Cursor Functions  |---------------------------------------------------------||
//--------------------------------------------------------------------------------------------------------------------//


// BOOL WINAPI ClipCursor( _In_opt_const RECT *lpRect);
//function LibUser32.ClipCursor(): BOOL; static; external 'ClipCursor@user32.dll stdcall';

// HCURSOR WINAPI CopyCursor( _In_HCURSOR pcur);
function LibUser32.CopyCursor(pcur: HCURSOR): HCURSOR; static; external 'CopyIcon@user32.dll stdcall';

// HCURSOR WINAPI CreateCursor( _In_opt_HINSTANCE hInst, _In_int xHotSpot, _In_int yHotSpot, _In_int nWidth, _In_int nHeight, _In_const VOID *pvANDPlane, _In_const VOID *pvXORPlane);
//function LibUser32.CreateCursor(hInst: HINSTANCE; xHotSpot, yHotSpot: Int32; nWidth, nHeight: Int32; _In_ const VOID *pvANDPlane, _In_ const VOID *pvXORPlane): HCURSOR; static; external 'CreateCursor@user32.dll  stdcall';

// BOOL WINAPI DestroyCursor( _In_HCURSOR hCursor);
function LibUser32.DestroyCursor(hCursor: HCURSOR): BOOL; static; external 'DestroyCursor@user32.dll stdcall';

// BOOL WINAPI GetClipCursor( _Out_LPRECT lpRect);
function LibUser32.GetClipCursor(Rect: ^TRect): BOOL; static; external 'GetClipCursor@user32.dll stdcall';

// HCURSOR WINAPI GetCursor(void);
function LibUser32.GetCursor(): HCURSOR; static; external 'GetCursor@user32.dll stdcall';

// BOOL WINAPI GetCursorInfo( _Inout_PCURSORINFO pci);
function LibUser32.GetCursorInfo(pci: ^CURSORINFO): BOOL; static; external 'GetCursorInfo@user32.dll stdcall';

// BOOL WINAPI GetCursorPos( _Out_LPPOINT lpPoint);
function LibUser32.GetCursorPos(): TPoint; static;
  function _GetCursorPos(Point: ^TPoint): BOOL; external 'GetCursorPos@user32.dll stdcall';
begin
  if not _GetCursorPos(@Result) then
    Result := [-1,-1];
end;

// BOOL WINAPI GetPhysicalCursorPos( _Out_LPPOINT lpPoint);
function LibUser32.GetPhysicalCursorPos(): TPoint; static;
  function _GetPhysicalCursorPos(Point: ^TPoint): BOOL; external 'GetPhysicalCursorPos@user32.dll stdcall';
begin
  if not _GetPhysicalCursorPos(@Result) then
    Result := [-1,-1];
end;

// HCURSOR WINAPI LoadCursor( _In_opt_HINSTANCE hInstance, _In_LPCTSTR lpCursorName);
function LibUser32.LoadCursor(hInstance: HINST; CursorName: WideString): HCURSOR; static;
  function _LoadCursor(hInstance: HINST; lpCursorName: LPCWSTR): HCURSOR;  external 'LoadCursorW@user32.dll stdcall';
begin
  Result := _LoadCursor(hInstance, PWideChar(CursorName));
end;

// HCURSOR WINAPI LoadCursorFromFile( _In_LPCTSTR lpFileName);
function LibUser32.LoadCursorFromFile(FileName: WideString): HCURSOR; static;
  function _LoadCursorFromFile(lpFileName: LPCWSTR): HCURSOR; external 'LoadCursorFromFileW@user32.dll stdcall';
begin
  Result := _LoadCursorFromFile(PWideChar(FileName));
end;

// HCURSOR WINAPI SetCursor( _In_opt_HCURSOR hCursor);
function LibUser32.SetCursor(Cursor: HCURSOR): HCURSOR; static; external 'SetCursor@user32.dll stdcall';

// BOOL WINAPI SetCursorPos( _In_ int X, _In_ int Y);
function LibUser32.SetCursorPos(X,Y: Int32): BOOL; static; external 'SetCursorPos@user32.dll stdcall';

// BOOL WINAPI SetPhysicalCursorPos( _In_ int X, _In_ int Y);
function LibUser32.SetPhysicalCursorPos(X,Y: Int32): BOOL; static; external 'SetPhysicalCursorPos@user32.dll stdcall';

// BOOL WINAPI SetSystemCursor( _In_HCURSOR hcur, _In_DWORD id);
function LibUser32.SetSystemCursor(hcur: HCURSOR; id: UInt32): BOOL; static; external 'SetSystemCursor@user32.dll stdcall';

// int WINAPI ShowCursor( _In_BOOL bShow);
function LibUser32.ShowCursor(bShow: BOOL): Int32; static; external 'ShowCursor@user32.dll stdcall';




//--------------------------------------------------------------------------------------------------------------------\\
//-----| Mouse Input  >  Mouse Input Reference  >  Mouse Input Functions  |-------------------------------------------||
//--------------------------------------------------------------------------------------------------------------------//

// BOOL WINAPI DragDetect( _In_HWND hwnd, _In_POINT pt);
function LibUser32.DragDetect(wnd: HWND; pt: TPoint): BOOL; static; external 'DragDetect@user32.dll stdcall';

// HWND WINAPI GetCapture(void);
function LibUser32.GetCapture(): HWND; static; external 'GetCapture@user32.dll stdcall';

// UINT WINAPI GetDoubleClickTime(void);
function LibUser32.GetDoubleClickTime(): UInt32; static; external 'GetDoubleClickTime@user32.dll stdcall';

// int WINAPI GetMouseMovePointsEx( _In_UINT cbSize, _In_LPMOUSEMOVEPOINT lppt, _Out_LPMOUSEMOVEPOINT lpptBuf, _In_int nBufPoints, _In_DWORD resolution);
function LibUser32.GetMouseMovePointsEx(cbSize: UInt32; var pt: TMouseMovePoint; var ptBuf: TMouseMovePoint; nBufPoints: Int32; resolution: UInt32): Int32; static; external 'GetMouseMovePointsEx@user32.dll stdcall';

// VOID WINAPI mouse_event(_In_ DWORD dwFlags, _In_ DWORD dx, _In_ DWORD dy, _In_ DWORD dwData, _In_ ULONG_PTR dwExtraInfo);
procedure LibUser32.mouse_event(dwFlags: UInt32; dx,dy: DWord; dwData: DWORD; dwExtraInfo: PtrUInt); static; external 'mouse_event@user32.dll stdcall';

// BOOL WINAPI ReleaseCapture(void);
function LibUser32.ReleaseCapture(): BOOL; static; external 'ReleaseCapture@user32.dll stdcall';

// HWND WINAPI SetCapture(_In_ HWND hWnd);
function LibUser32.SetCapture(Wnd: HWND): HWND; static; external 'SetCapture@user32.dll stdcall';

// BOOL WINAPI SetDoubleClickTime(_In_ UINT uInterval);
function LibUser32.SetDoubleClickTime(uInterval: UInt32): BOOL; static; external 'SetDoubleClickTime@user32.dll stdcall';

// BOOL WINAPI SwapMouseButton(_In_ BOOL fSwap);
function LibUser32.SwapMouseButton(fSwap: BOOL): BOOL; static; external 'SwapMouseButton@user32.dll stdcall';

// BOOL WINAPI TrackMouseEvent(_Inout_ LPTRACKMOUSEEVENT lpEventTrack);
function LibUser32.TrackMouseEvent(var EventTrack: TTrackMouseEvent): BOOL; static; external 'TrackMouseEvent@user32.dll stdcall';




//--------------------------------------------------------------------------------------------------------------------\\
//-----| Keyboard Input  >  Keyboard Input Reference  >  Keyboard Input Functions  |----------------------------------||
//--------------------------------------------------------------------------------------------------------------------//


// HKL WINAPI ActivateKeyboardLayout(_In_ HKL hkl, _In_UINT Flags);
function LibUser32.ActivateKeyboardLayout(kl: HKL; Flags: UInt32): HKL; static; external 'ActivateKeyboardLayout@user32.dll stdcall';

// BOOL WINAPI BlockInput( _In_BOOL fBlockIt);
function LibUser32.BlockInput(fBlockIt: BOOL): BOOL; static; external 'BlockInput@user32.dll stdcall';

// BOOL WINAPI EnableWindow( _In_HWND hWnd, _In_BOOL bEnable);
function LibUser32.EnableWindow(Wnd: HWND; bEnable: BOOL): BOOL; static; external 'EnableWindow@user32.dll stdcall';

// HWND WINAPI GetActiveWindow(void);
function LibUser32.GetActiveWindow(): HWND; static; external 'GetActiveWindow@user32.dll stdcall';

// SHORT WINAPI GetAsyncKeyState( _In_int vKey);
function LibUser32.GetAsyncKeyState(vKey: Int32): Int16; static; external 'GetAsyncKeyState@user32.dll stdcall';

// HWND WINAPI GetFocus(void);
function LibUser32.GetFocus(): HWND; static; external 'GetFocus@user32.dll stdcall';

// UINT WINAPI GetKBCodePage(void);
function LibUser32.GetKBCodePage(): UInt32; static; external 'GetKBCodePage@user32.dll stdcall';

// HKL WINAPI GetKeyboardLayout( _In_DWORD idThread);
function LibUser32.GetKeyboardLayout(idThread: DWord): HKL; static; external 'GetKeyboardLayout@user32.dll stdcall';

// int WINAPI GetKeyboardLayoutList( _In_int nBuff, _Out_HKL *lpList);
function LibUser32.GetKeyboardLayoutList(nBuff: Int32; lpList: ^HKL): Int32; static; external 'GetKeyboardLayoutList@user32.dll stdcall';

// BOOL WINAPI GetKeyboardLayoutName( _Out_LPTSTR pwszKLID);
function LibUser32.GetKeyboardLayoutName(pwszKLID: LPTSTR): BOOL; static; external 'GetKeyboardLayoutNameA@user32.dll stdcall';

// BOOL WINAPI GetKeyboardState( _Out_PBYTE lpKeyState);
function LibUser32.GetKeyboardState(lpKeyState: ^Byte): BOOL; static; external 'GetKeyboardState@user32.dll stdcall';

// int WINAPI GetKeyboardType( _In_int nTypeFlag);
function LibUser32.GetKeyboardType(nTypeFlag: Int32): Int32; static; external 'GetKeyboardType@user32.dll stdcall';

// int WINAPI GetKeyNameText( _In_LONG lParam, _Out_LPTSTR lpString, _In_int cchSize);
function LibUser32.GetKeyNameText(lParam: Int32; lpString: LPTSTR; cchSize: Int32): Int32; static; external 'GetKeyNameTextA@user32.dll stdcall';

// SHORT WINAPI GetKeyState( _In_int nVirtKey);
function LibUser32.GetKeyState(nVirtKey: Int32): Int16; static; external 'GetKeyState@user32.dll stdcall';

// BOOL WINAPI GetLastInputInfo(_Out_ PLASTINPUTINFO plii);
//function LibUser32.GetLastInputInfo(plii: ^LASTINPUTINFO): BOOL; static; external 'GetLastInputInfo@user32.dll stdcall';

// BOOL WINAPI IsWindowEnabled( _In_HWND hWnd);
function LibUser32.IsWindowEnabled(Wnd: HWND): BOOL; static; external 'IsWindowEnabled@user32.dll stdcall';

// VOID WINAPI keybd_event( _In_BYTE bVk, _In_BYTE bScan, _In_DWORD dwFlags, _In_ULONG_PTR dwExtraInfo);
procedure LibUser32.keybd_event(bVk: Byte; bScan: Byte; dwFlags: DWord; dwExtraInfo: PtrUInt); static; external 'keybd_event@user32.dll stdcall';

// HKL WINAPI LoadKeyboardLayout( _In_LPCTSTR pwszKLID, _In_UINT Flags);
function LibUser32.LoadKeyboardLayout(pwszKLID: LPCTSTR; Flags: UInt32): HKL; static; external 'LoadKeyboardLayoutA@user32.dll stdcall';

// UINT WINAPI MapVirtualKey( _In_UINT uCode, _In_UINT uMapType);
function LibUser32.MapVirtualKey(uCode: UInt32; uMapType: UInt32): UInt32; static; external 'MapVirtualKeyW@user32.dll stdcall';

// UINT WINAPI MapVirtualKeyEx( _In_UINT uCode, _In_UINT uMapType, _Inout_opt_HKL dwhkl);
function LibUser32.MapVirtualKeyEx(uCode: UInt32; uMapType: UInt32; dwhkl: HKL): UInt32; static; external 'MapVirtualKeyExW@user32.dll stdcall';

// DWORD WINAPI OemKeyScan( _In_WORD wOemChar);
function LibUser32.OemKeyScan(wOemChar: WORD): DWord; static; external 'OemKeyScan@user32.dll stdcall';

// BOOL WINAPI RegisterHotKey( _In_opt_HWND hWnd, _In_int id, _In_UINT fsModifiers, _In_UINT vk);
function LibUser32.RegisterHotKey(Wnd: HWND; id: Int32; fsModifiers: UInt32; vk: UInt32): BOOL; static; external 'RegisterHotKey@user32.dll stdcall';

// UINT WINAPI SendInput( _In_UINT nInputs, _In_LPINPUT pInputs, _In_int cbSize);
function LibUser32.SendInputRaw(nInputs: UInt32; pInputs: Pointer; cbSize: Int32): UInt32; static; external 'SendInput@user32.dll stdcall';


function MouseInput(dx,dy:Int32; mouseData, dwFlags:UInt32; time:UInt32=0; dwExtraInfo:PtrUInt=0): TMouseInput;
begin
  Result.Itype := 0;
  Result.dx := dx * Round(65536 / User32.GetSystemMetrics(SM_CXSCREEN));
  Result.dy := dy * Round(65536 / User32.GetSystemMetrics(SM_CYSCREEN));
  Result.MouseData := mouseData;
  Result.dwFlags := dwFlags;
  Result.time := time;
  Result.dwExtraInfo := dwExtraInfo;
end;

function KeybdInput(wVk, wScan: UInt16; dwFlags:UInt32; time: UInt32=0; dwExtraInfo: PtrUInt=0): TKeybdInput;
begin
  Result.Itype := 1;
  Result.wVk := wVk;
  Result.wScan := wScan;
  Result.dwFlags := dwFlags;
  Result.time := time;
  Result.dwExtraInfo := dwExtraInfo;
end;

function HardwareInput(uMsg:UInt32; wParamL, wParamH:UInt16): THardwareInput;
begin
  Result.Itype := 2;
  Result.uMsg := uMsg;
  Result.wParamL := wParamL;
  Result.wParamH := wParamH;
end;


//mouse input
function LibUser32.SendInput(InputEvents: array of TMouseInput): UInt32; static; overload;
begin
  Result := SendInputRaw(Length(InputEvents), @InputEvents[0], SizeOf(TMouseInput));
end;

//keyboard input
function LibUser32.SendInput(InputEvents: array of TKeybdInput): UInt32; static; overload;
begin
  Result := SendInputRaw(Length(InputEvents), @InputEvents[0], SizeOf(TKeybdInput));
end;

//hw input
function LibUser32.SendInput(InputEvents: array of THardwareInput): UInt32; static; overload;
begin
  Result := SendInputRaw(Length(InputEvents), @InputEvents[0], SizeOf(THardwareInput));
end;


// HWND WINAPI SetActiveWindow( _In_HWND hWnd);
function LibUser32.SetActiveWindow(wnd: HWND): HWND; static; external 'SetActiveWindow@user32.dll stdcall';

// HWND WINAPI SetFocus( _In_opt_HWND hWnd);
function LibUser32.SetFocus(wnd: HWND): HWND; static; external 'SetFocus@user32.dll stdcall';

// BOOL WINAPI SetKeyboardState( _In_LPBYTE lpKeyState);
function LibUser32.SetKeyboardState(lpKeyState: ^Byte): BOOL; static; external 'SetKeyboardState@user32.dll stdcall';

(*
// int WINAPI ToAscii( _In_UINT uVirtKey, _In_ UINT uScanCode, _In_opt_ const BYTE *lpKeyState, _Out_ LPWORD lpChar, _In_UINT uFlags);
function LibUser32.ToAscii(uVirtKey: UInt32; uScanCode: UInt32; ): Int32; static; external 'ToAscii@user32.dll stdcall';

// int WINAPI ToAsciiEx( _In_UINT uVirtKey, _In_ UINT uScanCode, _In_opt_ const BYTE *lpKeyState, _Out_ LPWORD lpChar, _In_UINT uFlags, _In_opt_HKL dwhkl);
function LibUser32.ToAsciiEx(uVirtKey: UInt32; uScanCode: UInt32; ): Int32; static; external 'ToAsciiEx@user32.dll stdcall';

// int WINAPI ToUnicode( _In_UINT wVirtKey, _In_ UINT wScanCode, _In_opt_ const BYTE *lpKeyState, _Out_ LPWSTR pwszBuff, _In_int cchBuff, _In_UINT wFlags);
function LibUser32.ToUnicode(wVirtKey: UInt32; wScanCode: UInt32; ): Int32; static; external 'ToUnicode@user32.dll stdcall';

// int WINAPI ToUnicodeEx( _In_UINT wVirtKey, _In_ UINT wScanCode, _In_ const BYTE *lpKeyState, _Out_ LPWSTR pwszBuff, _In_int cchBuff, _In_UINT wFlags, _In_opt_HKL dwhkl);
function LibUser32.ToUnicodeEx(wVirtKey: UInt32; wScanCode: UInt32; ): Int32; static; external 'ToUnicodeEx@user32.dll stdcall';
*)

// BOOL WINAPI UnloadKeyboardLayout( _In_HKL hkl);
function LibUser32.UnloadKeyboardLayout(hkl: HKL): BOOL; static; external 'UnloadKeyboardLayout@user32.dll stdcall';

// BOOL WINAPI UnregisterHotKey( _In_opt_HWND hWnd, _In_int id);
function LibUser32.UnregisterHotKey(Wnd: HWND; id: Int32): BOOL; static; external 'UnregisterHotKey@user32.dll stdcall';

// SHORT WINAPI VkKeyScan( _In_TCHAR ch);
function LibUser32.VkKeyScan(ch: Char): Int16; static; external 'VkKeyScanA@user32.dll stdcall';

// SHORT WINAPI VkKeyScanEx( _In_TCHAR ch, _In_HKL dwhkl);
function LibUser32.VkKeyScanEx(ch: Char; dwhkl: HKL): Int16; static; external 'VkKeyScanExA@user32.dll stdcall';

