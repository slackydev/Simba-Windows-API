{$include_once WinTypes.pas}
//--------------------------------------------------------------------------------------------------------------------\\
//-----| Messages and Message Queues  >  Message Reference  >  Message Functions  |-----------------------------------||
//--------------------------------------------------------------------------------------------------------------------//

// LRESULT WINAPI SendMessage( _In_ HWND   hWnd, _In_ UINT Msg, _In_ WPARAM wParam, _In_ LPARAM lParam);
function LibUser32.SendMessage(hwnd: HWND; Msg: UInt32; wPar: WPARAM; lPar: LPARAM): LRESULT; static; external 'SendMessageW@User32.dll' + WINAPI_CC;


//--------------------------------------------------------------------------------------------------------------------\\
//-----| Device Contexts  >  Device Context Reference  >  Device Context Functions  |---------------------------------||
//--------------------------------------------------------------------------------------------------------------------//

function LibGdi32.CancelDC(dc: HDC): BOOL; static; external 'CancelDC@gdi32.dll' + WINAPI_CC;
//function LibGdi32.CreateDC(lpszDriver: LPCTSTR; lpszDevice:LPCTSTR; lpszOutput: LPCTSTR; const lpInitData: ^DEVMODE): HDC; static; external 'CreateDC@gdi32.dll' + WINAPI_CC; 
function LibGdi32.DeleteDC(dc: HDC): BOOL; static; external 'DeleteDC@gdi32.dll' + WINAPI_CC;
function LibGdi32.DeleteObject(hObject: HGDIOBJ): BOOL; static; external 'DeleteObject@gdi32.dll' + WINAPI_CC;
function LibGdi32.GetCurrentObject(dc: HDC; uObjectType:UInt32): HGDIOBJ; static; external 'GetCurrentObject@gdi32.dll' + WINAPI_CC;
//function LibGdi32.ResetDC(hdc: HDC; const lpInitData: ^DEVMODE): HDC; static; external 'ResetDC@gdi32.dll' + WINAPI_CC;
function LibGdi32.RestoreDC(hdc: HDC; nSavedDC: Int32): BOOL; static; external 'RestoreDC@gdi32.dll' + WINAPI_CC;
function LibGdi32.SaveDC(dc: HDC): Int32; static; external 'SaveDC@gdi32.dll' + WINAPI_CC;
function LibGdi32.GetObject(hObject: HGDIOBJ; cbBuffer: Int32; lpvObject: Pointer): Int32; static; external 'GetObjectW@gdi32.dll' + WINAPI_CC;
function LibGdi32.CreateCompatibleDC(dc: HDC): HDC; static; external 'CreateCompatibleDC@gdi32.dll' + WINAPI_CC;
function LibGdi32.SelectObject(dc:HDC; hObject: HGDIOBJ): HGDIOBJ; static; external 'SelectObject@gdi32.dll' + WINAPI_CC;


function LibUser32.GetDC(wnd: HWND): HDC; static; external 'GetDC@user32.dll' + WINAPI_CC;
function LibUser32.GetWindowDC(wnd: HWND): HDC; static; external 'GetWindowDC@user32.dll' + WINAPI_CC;
function LibUser32.GetDCEx(wnd: HWND; hrgnClip:HRGN; flags:DWord): HDC; static; external 'GetDCEx@user32.dll' + WINAPI_CC;
function LibUser32.ReleaseDC(wnd: HWND; hdc: HDC): Int32; static; external 'ReleaseDC@user32.dll' + WINAPI_CC;


function LibGdi32.GetDCBrushColor(dc: HDC): COLORREF; static; external 'GetDCBrushColor@gdi32.dll' + WINAPI_CC;
function LibGdi32.GetDCPenColor(dc: HDC): COLORREF; static; external 'GetDCPenColor@gdi32.dll' + WINAPI_CC;
function LibGdi32.SetDCBrushColor(dc: HDC; crColor:COLORREF): COLORREF; static; external 'SetDCBrushColor@gdi32.dll' + WINAPI_CC;
function LibGdi32.SetDCPenColor(dc: HDC; crColor:COLORREF): COLORREF; static; external 'SetDCPenColor@gdi32.dll' + WINAPI_CC;
