{$include_once WinTypes.pas}


function LibUser32.GetSystemMetrics(nIndex:Int32): Int32; static; external 'GetSystemMetrics@user32.dll stdcall';

// ----------------------------------| WINDOW REF |---------------------------------------------------\\

// BOOL WINAPI AdjustWindowRect(_Inout_ LPRECT lpRect, _In_ DWORD dwStyle, _In_ BOOL bMenu);
function LibUser32.AdjustWindowRect(var rect: TRect; dwStyle: DWord; bMenu:Boolean): Boolean; static;
  function _AdjustWindowRect(lpRect: ^TRect; dwStyle: DWord; bMenu: BOOL): BOOL; external 'AdjustWindowRect@user32.dll stdcall';
begin
  Result := _AdjustWindowRect(@rect, dwStyle, bMenu);
end;

// BOOL WINAPI AdjustWindowRectEx(_Inout_ LPRECT lpRect, _In_ DWORD dwStyle, _In_ BOOL bMenu, _In_ DWORD dwExStyle);
function LibUser32.AdjustWindowRectEx(var rect: TRect; dwStyle: DWord; bMenu:Boolean; dwExStyle: DWord): Boolean; static; external 'AdjustWindowRectEx@user32.dll stdcall';

// BOOL WINAPI AllowSetForegroundWindow(_In_ DWORD dwProcessId);
function LibUser32.AllowSetForegroundWindow(dwProcessId: DWord): BOOL; static; external 'AllowSetForegroundWindow@user32.dll stdcall';

// BOOL WINAPI AnimateWindow(_In_ HWND hwnd, _In_ DWORD dwTime, _In_ DWORD dwFlags);
function LibUser32.AnimateWindow(wnd: HWND; dwTime: DWord; dwFlags: DWord): BOOL; static; external 'AnimateWindow@user32.dll stdcall';

// BOOL WINAPI AnyPopup(void);
function LibUser32.AnyPopup(): BOOL; static; external 'AnyPopup@user32.dll stdcall';

// UINT WINAPI ArrangeIconicWindows(_In_ HWND hWnd);
function LibUser32.ArrangeIconicWindows(wnd: HWND): UInt32; static; external 'ArrangeIconicWindows@user32.dll stdcall';

// HDWP WINAPI BeginDeferWindowPos(_In_ int nNumWindows);
function LibUser32.BeginDeferWindowPos(nNumWindows: Int32): HDWP; static; external 'BeginDeferWindowPos@user32.dll stdcall';

// BOOL WINAPI BringWindowToTop(_In_ HWND hWnd);
function LibUser32.BringWindowToTop(wnd: HWND): BOOL; static; external 'BringWindowToTop@user32.dll stdcall';

// BOOL WINAPI CalculatePopupWindowPosition( _In_ const POINT *anchorPoint, _In_ const SIZE *windowSize, _In_ UINT flags, _In_opt_  RECT *excludeRect, _Out_RECT *popupWindowPosition);
//function LibUser32.CalculatePopupWindowPosition(): BOOL; static; external 'CalculatePopupWindowPosition@user32.dll stdcall';

// WORD WINAPI CascadeWindows(_In_opt_   HWND hwndParent, _In_  UINT wHow, _In_opt_  const RECT *lpRect, _In_ UINT cKids, _In_opt_   const HWND *lpKids);
function LibUser32.CascadeWindows(hwndParent: HWND; wHow: UInt32; Rect:TRect; cKids:UInt32; Kids:HWND): Word; static;
  function _CascadeWindows(hwndParent: HWND; wHow: UInt32; Rect:^TRect; cKids:UInt32; lpKids:^HWND): Word; external 'CascadeWindows@user32.dll stdcall';
begin
  Result := _CascadeWindows(hwndParent, wHow, @rect, cKids, @kids);
end;

// BOOL WINAPI ChangeWindowMessageFilter(_In_ UINT message, _In_ DWORD dwFlag);
function LibUser32.ChangeWindowMessageFilter(message: UInt32; dwFlag: DWord): BOOL; static; external 'ChangeWindowMessageFilter@user32.dll stdcall';

// HWND WINAPI ChildWindowFromPoint(_In_ HWND hWndParent, _In_ POINT Point);
function LibUser32.ChildWindowFromPoint(hWndParent: HWND; Point: TPoint): HWND; static; external 'ChildWindowFromPoint@user32.dll stdcall';

// HWND WINAPI ChildWindowFromPointEx(_In_ HWND hwndParent, _In_ POINT pt, _In_ UINT uFlags);
function LibUser32.ChildWindowFromPointEx(hwndParent: HWND; pt: TPoint; uFlags: UInt32): HWND; static; external 'ChildWindowFromPointEx@user32.dll stdcall';

// BOOL WINAPI CloseWindow( _In_ HWND hWnd);
function LibUser32.CloseWindow(wnd: HWND): BOOL; static; external 'CloseWindow@user32.dll stdcall';

// HWND WINAPI CreateWindow( _In_opt_  LPCTSTR lpClassName, _In_opt_  LPCTSTR lpWindowName, _In_ DWORD dwStyle, _In_ int x, _In_ int y, _In_ int nWidth, _In_ int nHeight, _In_opt_  HWND hWndParent, _In_opt_  HMENU hMenu, _In_opt_  HINSTANCE hInstance, _In_opt_  LPVOID lpParam);
//function LibUser32.CreateWindow(lpClassName:LPCSTR; lpWindowName:LPCSTR; dwStyle:DWORD; X:LongInt;Y:LongInt; nWidth:LongInt; nHeight:LongInt; hWndParent:HWND; hMenu:HMENU; Instance:HINST; lpParam:LPVOID):HWND; static; external 'CreateWindowA@user32.dll stdcall';

// HWND WINAPI CreateWindowEx( _In_ DWORD dwExStyle, _In_opt_  LPCTSTR lpClassName, _In_opt_  LPCTSTR lpWindowName, _In_ DWORD dwStyle, _In_ int x, _In_ int y, _In_ int nWidth, _In_ int nHeight, _In_opt_  HWND hWndParent, _In_opt_  HMENU hMenu, _In_opt_  HINSTANCE hInstance, _In_opt_  LPVOID lpParam);
function LibUser32.CreateWindow(dwExStyle: DWord; ClassName: AnsiString; WindowName: AnsiString; dwStyle: DWord; x,y,nWidth,nHeight: Int32; hWndParent: HWND; Menu: HMENU; Instance: HINST; lpParam: LPVOID): HWND; static;
  function _CreateWindowEx(dwExStyle: DWord; lpClassName: LPCTSTR; lpWindowName: LPCTSTR; dwStyle: DWord; x,y,nWidth,nHeight: Int32; hWndParent: HWND; Menu: HMENU; Instance: HINST; lpParam: LPVOID): HWND; external 'CreateWindowExA@user32.dll stdcall';
begin
  Result := _CreateWindowEx(dwExStyle, PChar(ClassName), PChar(WindowName), dwStyle, x,y,nWidth,nHeight, hWndParent, Menu, Instance, lpParam);
end;

// HDWP WINAPI DeferWindowPos( _In_ HDWP hWinPosInfo, _In_ HWND hWnd, _In_opt_  HWND hWndInsertAfter, _In_ int x, _In_ int y, _In_ int cx, _In_ int cy, _In_ UINT uFlags);
function LibUser32.DeferWindowPos(hWinPosInfo: HDWP; wnd: HWND; hWndInsertAfter: HWND; x,y,cx,cy: Int32; uFlags: UInt32): HDWP; static; external 'DeferWindowPos@user32.dll stdcall';

// BOOL WINAPI DeregisterShellHookWindow( _In_ HWND hWnd);
function LibUser32.DeregisterShellHookWindow(wnd: HWND): BOOL; static; external 'DeregisterShellHookWindow@user32.dll stdcall';

// BOOL WINAPI DestroyWindow( _In_ HWND hWnd);
function LibUser32.DestroyWindow(wnd: HWND): BOOL; static; external 'DestroyWindow@user32.dll stdcall';

// BOOL WINAPI EndDeferWindowPos( _In_ HDWP hWinPosInfo);
function LibUser32.EndDeferWindowPos(hWinPosInfo: HDWP): BOOL; static; external 'EndDeferWindowPos@user32.dll stdcall';

// BOOL WINAPI EndTask( _In_ HWND hWnd, _In_ BOOL fShutDown, _In_ BOOL fForce);
function LibUser32.EndTask(wnd: HWND; fShutDown: BOOL; fForce: BOOL): BOOL; static; external 'EndTask@user32.dll stdcall';

// BOOL WINAPI EnumChildWindows( _In_opt_  HWND hWndParent, _In_ WNDENUMPROC lpEnumFunc, _In_ LPARAM lParam);
function LibUser32.EnumChildWindows(hWndParent: HWND; lpEnumFunc: TEnumWindowsProc; Param: LPARAM): BOOL; static; external 'EnumChildWindows@user32.dll stdcall';

// BOOL WINAPI EnumThreadWindows( _In_ DWORD dwThreadId, _In_ WNDENUMPROC lpfn, _In_ LPARAM lParam);
function LibUser32.EnumThreadWindows(dwThreadId: DWord; lpfn: TEnumWindowsProc; Param: LPARAM): BOOL; static; external 'EnumThreadWindows@user32.dll stdcall';

// BOOL WINAPI EnumWindows( _In_ WNDENUMPROC lpEnumFunc, _In_ LPARAM lParam);
function LibUser32.EnumWindows(lpEnumFunc: TEnumWindowsProc; Param: LPARAM): BOOL; static; external 'EnumWindows@user32.dll stdcall';

// HWND WINAPI FindWindow( _In_opt_  LPCTSTR lpClassName, _In_opt_  LPCTSTR lpWindowName);
function LibUser32.FindWindowA(lpClassName: LPCTSTR; lpWindowName: LPCTSTR): HWND; static; external 'FindWindowA@user32.dll stdcall';
function LibUser32.FindWindowW(lpClassName: LPCWSTR; lpWindowName: LPCWSTR): HWND; static; external 'FindWindowW@user32.dll stdcall';

function LibUser32.FindWindow(lpClassName: WideString; lpWindowName: WideString): HWND; static;
begin
  Result := FindWindowW(PWideChar(lpClassName), PWideChar(lpWindowName));
end;

// HWND WINAPI FindWindowEx( _In_opt_  HWND hwndParent, _In_opt_  HWND hwndChildAfter, _In_opt_  LPCTSTR lpszClass, _In_opt_  LPCTSTR lpszWindow);
function LibUser32.FindWindowExA(hwndParent: HWND; hwndChildAfter: HWND; lpszClass: LPCTSTR; lpszWindow: LPCTSTR): HWND; static; external 'FindWindowExA@user32.dll stdcall';
function LibUser32.FindWindowExW(hwndParent: HWND; hwndChildAfter: HWND; lpszClass: LPCWSTR; lpszWindow: LPCWSTR): HWND; static; external 'FindWindowExW@user32.dll stdcall';

function LibUser32.FindWindowEx(hwndParent: HWND; hwndChildAfter: HWND; szClass: WideString; szWindow: WideString): HWND; static;
begin
  Result := FindWindowExW(hwndParent, hwndChildAfter, PWideChar(szClass), PWideChar(szWindow));
end;

// HWND WINAPI GetAncestor( _In_ HWND hwnd, _In_ UINT gaFlags);
function LibUser32.GetAncestor(wnd: HWND; gaFlags: UInt32): HWND; static; external 'GetAncestor@user32.dll stdcall';

// BOOL WINAPI GetClientRect( _In_ HWND hWnd, _Out_LPRECT lpRect);
function LibUser32.GetClientRect(wnd: HWND; var Rect: TRect): Boolean; static; external 'GetClientRect@user32.dll stdcall';

// HWND WINAPI GetDesktopWindow(void);
function LibUser32.GetDesktopWindow(): HWND; static; external 'GetDesktopWindow@user32.dll stdcall';

// HWND WINAPI GetForegroundWindow(void);
function LibUser32.GetForegroundWindow(): HWND; static; external 'GetForegroundWindow@user32.dll stdcall';

// HWND WINAPI GetLastActivePopup( _In_ HWND hWnd);
function LibUser32.GetLastActivePopup(wnd: HWND): HWND; static; external 'GetLastActivePopup@user32.dll stdcall';

// BOOL WINAPI GetLayeredWindowAttributes( _In_ HWND hwnd, _Out_opt_ COLORREF *pcrKey, _Out_opt_ BYTE *pbAlpha, _Out_opt_ DWORD *pdwFlags);
function LibUser32.GetLayeredWindowAttributes(wnd: HWND; out crKey: COLORREF; out alpha: Byte; out dwFlags: DWord): Boolean; static; external 'GetLayeredWindowAttributes@user32.dll stdcall';

// HWND WINAPI GetNextWindow( _In_ HWND hWnd, _In_ UINT wCmd);
function LibUser32.GetNextWindow(wnd: HWND; wCmd: UInt32): HWND; static; external 'GetWindow@user32.dll stdcall';

// HWND WINAPI GetParent( _In_ HWND hWnd);
function LibUser32.GetParent(wnd: HWND): HWND; static; external 'GetParent@user32.dll stdcall';

// BOOL WINAPI GetProcessDefaultLayout( _Out_DWORD *pdwDefaultLayout);
function LibUser32.GetProcessDefaultLayout(out dwDefaultLayout: DWord): Boolean; static; external 'GetProcessDefaultLayout@user32.dll stdcall';

// HWND WINAPI GetShellWindow(void);
function LibUser32.GetShellWindow(): HWND; static; external 'GetShellWindow@user32.dll stdcall';

// DWORD WINAPI GetSysColor( _In_ int nIndex);
function LibUser32.GetSysColor(nIndex: Int32): DWord; static; external 'GetSysColor@user32.dll stdcall';

// BOOL WINAPI GetTitleBarInfo( _In_ HWND hwnd, _Inout_ PTITLEBARINFO pti);
//function LibUser32.GetTitleBarInfo(wnd: HWND; pti: PTITLEBARINFO): BOOL; static; external 'GetTitleBarInfo@user32.dll stdcall';

// HWND WINAPI GetTopWindow( _In_opt_  HWND hWnd);
function LibUser32.GetTopWindow(wnd: HWND): HWND; static; external 'GetTopWindow@user32.dll stdcall';

// HWND WINAPI GetWindow( _In_ HWND hWnd, _In_ UINT uCmd);
function LibUser32.GetWindow(wnd: HWND; uCmd: UInt32): HWND; static; external 'GetWindow@user32.dll stdcall';

// BOOL WINAPI GetWindowDisplayAffinity( _In_ HWND hWnd, _Out_DWORD *dwAffinity);
function LibUser32.GetWindowDisplayAffinity(wnd: HWND; out dwAffinity: DWord): Boolean; static;  external 'GetWindowDisplayAffinity@user32.dll stdcall';

// BOOL WINAPI GetWindowInfo( _In_ HWND hwnd, _Inout_ PWINDOWINFO pwi);
function LibUser32.GetWindowInfo(wnd: HWND; var wi: WINDOWINFO): Boolean; static;  external 'GetWindowInfo@user32.dll stdcall';

// UINT WINAPI GetWindowModuleFileName( _In_ HWND hwnd, _Out_LPTSTR lpszFileName, _In_ UINT cchFileNameMax);
function LibUser32.GetWindowModuleFileName(wnd: HWND; lpszFileName: LPTSTR; cchFileNameMax: UInt32): UInt32; static; external 'GetWindowModuleFileName@user32.dll stdcall';

// BOOL WINAPI GetWindowPlacement( _In_ HWND hWnd, _Inout_ WINDOWPLACEMENT *lpwndpl);
//function GetWindowPlacement(wnd: HWND; lpwndpl: ^WINDOWPLACEMENT): BOOL; static; external 'GetWindowPlacement@user32.dll stdcall';

// BOOL WINAPI GetWindowRect( _In_ HWND hWnd, _Out_LPRECT lpRect);
function LibUser32.GetWindowRect(wnd: HWND): TRect; static;
  function _GetWindowRect(wnd: HWND; Rect: ^TRect): BOOL; static; external 'GetWindowRect@user32.dll stdcall';
begin
  if not _GetWindowRect(wnd, @Result) then
    Result := [0,0,0,0];
end;



// int WINAPI GetWindowText( _In_ HWND hWnd, _Out_LPTSTR lpString, _In_ int nMaxCount);
function LibUser32.GetWindowTextA(wnd: HWND; lpString: LPCTSTR; nMaxCount: Int32): Int32; static; external 'GetWindowTextA@user32.dll stdcall';
function LibUser32.GetWindowTextW(wnd: HWND; lpString: LPCWSTR; nMaxCount: Int32): Int32; static; external 'GetWindowTextW@user32.dll stdcall';

function LibUser32.GetWindowText(wnd: HWND): WideString; static;
type PWideChar = ^WideChar;
begin
  SetLength(Result, 1024);
  SetLength(Result, LibUser32.GetWindowTextW(wnd, PWideChar(Result), 1024)); 
end;


// int WINAPI GetWindowTextLength( _In_ HWND hWnd);
function LibUser32.GetWindowTextLength(wnd: HWND): Int32; static; external 'GetWindowTextLengthA@user32.dll stdcall';

// DWORD WINAPI GetWindowThreadProcessId( _In_ HWND hWnd, _Out_opt_LPDWORD lpdwProcessId);
function LibUser32.GetWindowThreadProcessId(wnd: HWND; var dwProcessId: DWord): DWord; static; external 'GetWindowThreadProcessId@user32.dll stdcall';

// BOOL WINAPI IsChild( _In_ HWND hWndParent, _In_ HWND hWnd);
function LibUser32.IsChild(hWndParent: HWND; wnd: HWND): BOOL; static; external 'IsChild@user32.dll stdcall';

// BOOL WINAPI IsGUIThread( _In_ BOOL bConvert);
function LibUser32.IsGUIThread(bConvert: BOOL): BOOL; static; external 'IsGUIThread@user32.dll stdcall';

// BOOL WINAPI IsHungAppWindow( _In_ HWND hWnd);
function LibUser32.IsHungAppWindow(wnd: HWND): BOOL; static; external 'IsHungAppWindow@user32.dll stdcall';

// BOOL WINAPI IsIconic( _In_ HWND hWnd);
function LibUser32.IsIconic(wnd: HWND): BOOL; static; external 'IsIconic@user32.dll stdcall';

// BOOL WINAPI IsProcessDPIAware(void);
function LibUser32.IsProcessDPIAware(): BOOL; static; external 'IsProcessDPIAware@user32.dll stdcall';

// BOOL WINAPI IsWindow( _In_opt_  HWND hWnd);
function LibUser32.IsWindow(wnd: HWND): BOOL; static; external 'IsWindow@user32.dll stdcall';

// BOOL WINAPI IsWindowUnicode( _In_ HWND hWnd);
function LibUser32.IsWindowUnicode(wnd: HWND): BOOL; static; external 'IsWindowUnicode@user32.dll stdcall';

// BOOL WINAPI IsWindowVisible( _In_ HWND hWnd);
function LibUser32.IsWindowVisible(wnd: HWND): BOOL; static; external 'IsWindowVisible@user32.dll stdcall';

// BOOL WINAPI IsZoomed( _In_ HWND hWnd);
function LibUser32.IsZoomed(wnd: HWND): BOOL; static; external 'IsZoomed@user32.dll stdcall';

// BOOL WINAPI LockSetForegroundWindow( _In_ UINT uLockCode);
function LibUser32.LockSetForegroundWindow(uLockCode: UInt32): BOOL; static; external 'LockSetForegroundWindow@user32.dll stdcall';

// BOOL WINAPI LogicalToPhysicalPoint( _In_ HWND hWnd, _Inout_ LPPOINT lpPoint);
function LibUser32.LogicalToPhysicalPoint(wnd: HWND; Point: ^TPoint): BOOL; static; external 'LogicalToPhysicalPoint@user32.dll stdcall';

// BOOL WINAPI MoveWindow( _In_ HWND hWnd, _In_ int X, _In_ int Y, _In_ int nWidth, _In_ int nHeight, _In_ BOOL bRepaint);
function LibUser32.MoveWindow(wnd: HWND; X, Y, nWidth, nHeight: Int32; bRepaint: BOOL): BOOL; static; external 'MoveWindow@user32.dll stdcall';

// BOOL WINAPI OpenIcon( _In_ HWND hWnd);
function LibUser32.OpenIcon(wnd: HWND): BOOL; static; external 'OpenIcon@user32.dll stdcall';

// BOOL WINAPI PhysicalToLogicalPoint( _In_ HWND hWnd, _Inout_ LPPOINT lpPoint);
function LibUser32.PhysicalToLogicalPoint(wnd: HWND; Point: ^TPoint): BOOL; static; external 'PhysicalToLogicalPoint@user32.dll stdcall';

// HWND WINAPI RealChildWindowFromPoint( _In_ HWND hwndParent, _In_ POINT ptParentClientCoords);
function LibUser32.RealChildWindowFromPoint(hwndParent: HWND; ptParentClientCoords: TPoint): HWND; static; external 'RealChildWindowFromPoint@user32.dll stdcall';

// UINT WINAPI RealGetWindowClass( _In_ HWND hwnd, _Out_LPTSTR pszType, _In_ UINT cchType);
function LibUser32.RealGetWindowClass(wnd: HWND; pszType: LPTSTR; cchType: UInt32): UInt32; static; external 'RealGetWindowClass@user32.dll stdcall';

// BOOL WINAPI RegisterShellHookWindow( _In_ HWND hWnd);
function LibUser32.RegisterShellHookWindow(wnd: HWND): BOOL; static; external 'RegisterShellHookWindow@user32.dll stdcall';

// BOOL WINAPI SetForegroundWindow( _In_ HWND hWnd);
function LibUser32.SetForegroundWindow(wnd: HWND): BOOL; static; external 'SetForegroundWindow@user32.dll stdcall';

// BOOL WINAPI SetLayeredWindowAttributes( _In_ HWND hwnd, _In_ COLORREF crKey, _In_ BYTE bAlpha, _In_ DWORD dwFlags);
function LibUser32.SetLayeredWindowAttributes(wnd: HWND; crKey: COLORREF; bAlpha: BYTE; dwFlags: DWord): BOOL; static; external 'SetLayeredWindowAttributes@user32.dll stdcall';

// HWND WINAPI SetParent( _In_ HWND hWndChild, _In_opt_  HWND hWndNewParent);
function LibUser32.SetParent(hWndChild: HWND; hWndNewParent: HWND): HWND; static; external 'SetParent@user32.dll stdcall';

// BOOL WINAPI SetProcessDefaultLayout( _In_ DWORD dwDefaultLayout);
function LibUser32.SetProcessDefaultLayout(dwDefaultLayout: DWord): BOOL; static; external 'SetProcessDefaultLayout@user32.dll stdcall';

// BOOL WINAPI SetProcessDPIAware(void);
function LibUser32.SetProcessDPIAware(): BOOL; static; external 'SetProcessDPIAware@user32.dll stdcall';

// BOOL WINAPI SetSysColors( _In_ int cElements, _In_ const INT *lpaElements, _In_ const COLORREF *lpaRgbValues);
(*
function LibUser32.SetSysColors(cElements: Int32; lpaElements: ^Int32; lpaRgbValues: ^COLORREF): Boolean; static;
  function _SetSysColors(cElements: Int32; lpaElements: ^Int32; lpaRgbValues: ^COLORREF): BOOL; external 'SetSysColors@user32.dll stdcall';
begin
  Result := _SetSysColors(cElements, 
end;*)

// BOOL WINAPI SetWindowDisplayAffinity( _In_ HWND hWnd, _In_ DWORD dwAffinity);
function LibUser32.SetWindowDisplayAffinity(wnd: HWND; dwAffinity: DWord): BOOL; static; external 'SetWindowDisplayAffinity@user32.dll stdcall';

// BOOL WINAPI SetWindowFeedbackSettings( _In_ HWND hwnd, _In_ FEEDBACK_TYPE feedback, _In_ DWORD flags, _In_ UINT32 size, _In_opt_  const VOID *configuration);
//function LibUser32.SetWindowFeedbackSettings(wnd: HWND; feedback: FEEDBACK_TYPE; flags: DWORD; size: UINT32; const configuration: Pointer): BOOL; static; external 'SetWindowFeedbackSettings@user32.dll stdcall';

// BOOL WINAPI SetWindowPlacement( _In_ HWND hWnd, _In_ const WINDOWPLACEMENT *lpwndpl);
//function LibUser32.SetWindowPlacement(wnd: HWND; const lpwndpl: ^WINDOWPLACEMENT): BOOL; static; external 'SetWindowPlacement@user32.dll stdcall';

// BOOL WINAPI SetWindowPos( _In_ HWND hWnd, _In_opt_  HWND hWndInsertAfter, _In_ int X, _In_ int Y, _In_ int cx, _In_ int cy, _In_ UINT uFlags);
function LibUser32.SetWindowPos(wnd: HWND; hWndInsertAfter: HWND; X,Y,cx,cy: Int32; uFlags: UInt32): BOOL; static; external 'SetWindowPos@user32.dll stdcall';

// BOOL WINAPI SetWindowText( _In_ HWND hWnd, _In_opt_  LPCTSTR lpString);
function LibUser32.SetWindowTextA(wnd: HWND; lpString: LPCTSTR): BOOL; static; external 'SetWindowTextA@user32.dll stdcall';
function LibUser32.SetWindowTextW(wnd: HWND; lpString: LPCWSTR): BOOL; static; external 'SetWindowTextW@user32.dll stdcall';

function LibUser32.SetWindowText(wnd: HWND; text: WideString): Boolean; static;
begin
  SetWindowTextW(wnd, PWideChar(text));
end;

// BOOL WINAPI ShowOwnedPopups( _In_ HWND hWnd, _In_ BOOL fShow);
function LibUser32.ShowOwnedPopups(wnd: HWND; fShow: BOOL): BOOL; static; external 'ShowOwnedPopups@user32.dll stdcall';

// BOOL WINAPI ShowWindow( _In_ HWND hWnd, _In_ int nCmdShow);
function LibUser32.ShowWindow(wnd: HWND; nCmdShow: Int32): BOOL; static; external 'ShowWindow@user32.dll stdcall';

// BOOL WINAPI ShowWindowAsync( _In_ HWND hWnd, _In_ int nCmdShow);
function LibUser32.ShowWindowAsync(wnd: HWND; nCmdShow: Int32): BOOL; static; external 'ShowWindowAsync@user32.dll stdcall';

// BOOL WINAPI SoundSentry(void);
function LibUser32.SoundSentry(): BOOL; static; external 'SoundSentry@user32.dll stdcall';

// VOID WINAPI SwitchToThisWindow( _In_ HWND hWnd, _In_ BOOL fAltTab);
procedure LibUser32.SwitchToThisWindow(wnd: HWND; fAltTab: BOOL); static; external 'SwitchToThisWindow@user32.dll stdcall';

// WORD WINAPI TileWindows( _In_opt_  HWND hwndParent, _In_ UINT wHow, _In_opt_ const RECT *lpRect, _In_ UINT cKids, _In_opt_  const HWND *lpKids);
//function LibUser32.TileWindows(hwndParent: HWND; wHow: UInt32; Rect: ^TRect; cKids:UInt32; const lpKids:^HWND): WORD; static; external 'TileWindows@user32.dll stdcall';

// BOOL WINAPI UpdateLayeredWindow( _In_ HWND hwnd, _In_opt_  HDC hdcDst, _In_opt_  POINT *pptDst, _In_opt_  SIZE *psize, _In_opt_  HDC hdcSrc, _In_opt_  POINT *pptSrc, _In_ COLORREF crKey, _In_opt_  BLENDFUNCTION *pblend, _In_ DWORD dwFlags);
//function LibUser32.UpdateLayeredWindow(wnd: HWND; hdcDst: HDC; pptDst: ^TPoint; size: ^SIZE; hdcSrc: HDC; pptSrc: ^POINT; crKey: COLORREF; pblend: ^BLENDFUNCTION; dwFlags: DWORD): BOOL; static; external 'UpdateLayeredWindow@user32.dll stdcall';

// BOOL WINAPI UpdateLayeredWindowIndirect( _In_ HWND hwnd, _In_ const UPDATELAYEREDWINDOWINFO *pULWInfo);
//function LibUser32.UpdateLayeredWindowIndirect(wnd: HWND; ULWInfo:^UPDATELAYEREDWINDOWINFO): BOOL; static; external 'UpdateLayeredWindowIndirect@user32.dll stdcall';

// HWND WINAPI WindowFromPhysicalPoint( _In_ POINT Point);
function LibUser32.WindowFromPhysicalPoint(Point: TPoint): HWND; static; external 'WindowFromPhysicalPoint@user32.dll stdcall';

// HWND WINAPI WindowFromPoint( _In_ POINT Point);
function LibUser32.WindowFromPoint(Point: TPoint): HWND; static; external 'WindowFromPoint@user32.dll stdcall';



// ----------------------------------| MOUSE REF |---------------------------------------------------\\


// BOOL WINAPI ClipCursor( _In_opt_const RECT *lpRect);
function LibUser32.ClipCursor(): BOOL; static; external 'ClipCursor@user32.dll stdcall';

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


//---| Mouse input functions |---

// BOOL WINAPI DragDetect( _In_HWND hwnd, _In_POINT pt);
function LibUser32.DragDetect(wnd: HWND; pt: TPoint): BOOL; static; external 'DragDetect@user32.dll stdcall';

// HWND WINAPI GetCapture(void);
function LibUser32.GetCapture(): HWND; static; external 'GetCapture@user32.dll stdcall';

// UINT WINAPI GetDoubleClickTime(void);
function LibUser32.GetDoubleClickTime(): UInt32; static; external 'GetDoubleClickTime@user32.dll stdcall';

// int WINAPI GetMouseMovePointsEx( _In_UINT cbSize, _In_LPMOUSEMOVEPOINT lppt, _Out_LPMOUSEMOVEPOINT lpptBuf, _In_int nBufPoints, _In_DWORD resolution);
function LibUser32.GetMouseMovePointsEx(cbSize: UInt32; var pt: TMouseMovePoint; var ptBuf: TMouseMovePoint; nBufPoints: Int32; resolution: UInt32): Int32; static; external 'GetMouseMovePointsEx@user32.dll stdcall';

// VOID WINAPI mouse_event( _In_DWORD dwFlags, _In_DWORD dx, _In_DWORD dy, _In_DWORD dwData, _In_ULONG_PTR dwExtraInfo);
procedure LibUser32.mouse_event(dwFlags: UInt32; dx: UInt32; dy: UInt32; dwData: UInt32; dwExtraInfo: PtrUInt); static; external 'mouse_event@user32.dll stdcall';

// BOOL WINAPI ReleaseCapture(void);
function LibUser32.ReleaseCapture(): BOOL; static; external 'ReleaseCapture@user32.dll stdcall';

// HWND WINAPI SetCapture( _In_HWND hWnd);
function LibUser32.SetCapture(Wnd: HWND): HWND; static; external 'SetCapture@user32.dll stdcall';

// BOOL WINAPI SetDoubleClickTime( _In_UINT uInterval);
function LibUser32.SetDoubleClickTime(uInterval: UInt32): BOOL; static; external 'SetDoubleClickTime@user32.dll stdcall';

// BOOL WINAPI SwapMouseButton( _In_BOOL fSwap);
function LibUser32.SwapMouseButton(fSwap: BOOL): BOOL; static; external 'SwapMouseButton@user32.dll stdcall';

// BOOL WINAPI TrackMouseEvent(_Inout_ LPTRACKMOUSEEVENT lpEventTrack);
function LibUser32.TrackMouseEvent(var EventTrack: TTrackMouseEvent): BOOL; static; external 'TrackMouseEvent@user32.dll stdcall';


// ----------------------------------| KEYBOARD REF |---------------------------------------------------\\


// HKL WINAPI ActivateKeyboardLayout(_In_ HKL hkl, _In_UINT Flags);
function LibUser32.ActivateKeyboardLayout(kl: HKL; Flags: UInt32): HKL; static; external 'ActivateKeyboardLayout@user32.dll stdcall';

// BOOL WINAPI BlockInput( _In_BOOL fBlockIt);
function LibUser32.BlockInput(fBlockIt: BOOL): BOOL; static; external 'BlockInput@user32.dll stdcall';

// BOOL WINAPI EnableWindow( _In_HWND hWnd, _In_BOOL bEnable);
function LibUser32.EnableWindow(hWnd: HWND; bEnable: BOOL): BOOL; static; external 'EnableWindow@user32.dll stdcall';

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
function LibUser32.IsWindowEnabled(hWnd: HWND): BOOL; static; external 'IsWindowEnabled@user32.dll stdcall';

// VOID WINAPI keybd_event( _In_BYTE bVk, _In_BYTE bScan, _In_DWORD dwFlags, _In_ULONG_PTR dwExtraInfo);
procedure LibUser32.keybd_event(bVk: Byte; bScan: Byte; dwFlags: DWord; dwExtraInfo: PtrUInt); static; external 'keybd_event@user32.dll stdcall';

// HKL WINAPI LoadKeyboardLayout( _In_LPCTSTR pwszKLID, _In_UINT Flags);
function LibUser32.LoadKeyboardLayout(pwszKLID: LPCTSTR; Flags: UInt32): HKL; static; external 'LoadKeyboardLayoutA@user32.dll stdcall';

(*
// UINT WINAPI MapVirtualKey( _In_UINT uCode, _In_UINT uMapType);
function LibUser32.MapVirtualKey(uCode: UInt32; uMapType: UInt32): UInt32; static; external 'MapVirtualKey@user32.dll stdcall';

// UINT WINAPI MapVirtualKeyEx( _In_UINT uCode, _In_UINT uMapType, _Inout_opt_HKL dwhkl);
function LibUser32.MapVirtualKeyEx(uCode: UInt32; uMapType: UInt32; dwhkl: HKL): UInt32; static; external 'MapVirtualKeyEx@user32.dll stdcall';
*)

// DWORD WINAPI OemKeyScan( _In_WORD wOemChar);
function LibUser32.OemKeyScan(wOemChar: WORD): DWord; static; external 'OemKeyScan@user32.dll stdcall';

// BOOL WINAPI RegisterHotKey( _In_opt_HWND hWnd, _In_int id, _In_UINT fsModifiers, _In_UINT vk);
function LibUser32.RegisterHotKey(hWnd: HWND; id: Int32; fsModifiers: UInt32; vk: UInt32): BOOL; static; external 'RegisterHotKey@user32.dll stdcall';

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
// int WINAPI ToAscii( _In_UINT uVirtKey, _In_UINT uScanCode, _In_opt_const BYTE *lpKeyState, _Out_LPWORD lpChar, _In_UINT uFlags);
function LibUser32.ToAscii(uVirtKey: UInt32; uScanCode: UInt32; ): Int32; static; external 'ToAscii@user32.dll stdcall';

// int WINAPI ToAsciiEx( _In_UINT uVirtKey, _In_UINT uScanCode, _In_opt_const BYTE *lpKeyState, _Out_LPWORD lpChar, _In_UINT uFlags, _In_opt_HKL dwhkl);
function LibUser32.ToAsciiEx(uVirtKey: UInt32; uScanCode: UInt32; ): Int32; static; external 'ToAsciiEx@user32.dll stdcall';

// int WINAPI ToUnicode( _In_UINT wVirtKey, _In_UINT wScanCode, _In_opt_const BYTE *lpKeyState, _Out_LPWSTR pwszBuff, _In_int cchBuff, _In_UINT wFlags);
function LibUser32.ToUnicode(wVirtKey: UInt32; wScanCode: UInt32; ): Int32; static; external 'ToUnicode@user32.dll stdcall';

// int WINAPI ToUnicodeEx( _In_UINT wVirtKey, _In_UINT wScanCode, _In_const BYTE *lpKeyState, _Out_LPWSTR pwszBuff, _In_int cchBuff, _In_UINT wFlags, _In_opt_HKL dwhkl);
function LibUser32.ToUnicodeEx(wVirtKey: UInt32; wScanCode: UInt32; ): Int32; static; external 'ToUnicodeEx@user32.dll stdcall';
*)

// BOOL WINAPI UnloadKeyboardLayout( _In_HKL hkl);
function LibUser32.UnloadKeyboardLayout(hkl: HKL): BOOL; static; external 'UnloadKeyboardLayout@user32.dll stdcall';

// BOOL WINAPI UnregisterHotKey( _In_opt_HWND hWnd, _In_int id);
function LibUser32.UnregisterHotKey(hWnd: HWND; id: Int32): BOOL; static; external 'UnregisterHotKey@user32.dll stdcall';

// SHORT WINAPI VkKeyScan( _In_TCHAR ch);
function LibUser32.VkKeyScan(ch: Char): Int16; static; external 'VkKeyScanA@user32.dll stdcall';

// SHORT WINAPI VkKeyScanEx( _In_TCHAR ch, _In_HKL dwhkl);
function LibUser32.VkKeyScanEx(ch: Char; dwhkl: HKL): Int16; static; external 'VkKeyScanExA@user32.dll stdcall';


