type
  WinDLL = type Pointer;
  LibUser32 = type Pointer;

var 
  Windows: WinDLL;
  User32: LibUser32;


type
  {$IFNDECL PWideChar}PWideChar = ^WideChar;{$ENDIF}
  {$IFNDECL PUInt32}  PUInt32 = ^UInt32;    {$ENDIF}
  {$IFNDECL PUInt16}  PUInt16 = ^UInt16;    {$ENDIF}
  {$IFNDECL PUInt8}   PUInt8  = ^UInt8;     {$ENDIF}
  
  WINBOOL = LongBool;
  BOOL = WINBOOL;
  PBOOL    = ^BOOL;
  
  COLORREF  = Int32;
  PCOLORREF = ^COLORREF;
  
  (*
  SHORT = Int16;
  WINT  = Int32;
  LONG  = Int32;
  
  PInteger = ^Int32;

  LongLong  = Int64;
  PLongLong = ^LongLong;
  
  INT_PTR   = PtrInt;
  UINT_PTR  = PtrUInt;
  LONG_PTR  = PtrInt;
  ULONG_PTR = PtrUInt;
  DWORD_PTR  = ULONG_PTR;
  PDWORD_PTR = ^DWORD_PTR;
  PULONG_PTR = ^ULONG_PTR;
  PLONG64    = ^Int64;
  
  DWORDLONG  = UInt64;  { was unsigned long  }
  PDWORDLONG = ^DWORDLONG;
  *)

  HANDLE  = PtrUInt;
  //HRESULT = Pointer;
  PHRESULT = ^HRESULT;

  HACCEL   = HANDLE;
//HBITMAP  = HANDLE;
  HBRUSH   = HANDLE;
  HCOLORSPACE = HANDLE;
  HCONV    = HANDLE;
  HCONVLIST= HANDLE;
  HCURSOR  = HANDLE;
  HDBC     = HANDLE;
  HDC      = HANDLE;
  HDDEDATA = HANDLE;
  HDESK    = HANDLE;
  HDROP    = HANDLE;
  HDWP     = HANDLE;
  HENHMETAFILE = HANDLE;
  HENV     = HANDLE;
  HFILE    = HANDLE;
  HFONT    = HANDLE;
  HGDIOBJ  = HANDLE;
  HGLOBAL  = HANDLE;
  HGLRC    = HANDLE;
  HHOOK    = HANDLE;
  HICON    = HANDLE;
  HIMAGELIST = HANDLE;
  HINST    = HANDLE;
  HKEY     = HANDLE;
  HKL      = HANDLE;
  HLOCAL   = HANDLE;
  HMENU    = HANDLE;
  HMETAFILE= HANDLE;
  HMODULE  = HANDLE;
  HMONITOR = HANDLE;
//HPALETTE = HANDLE;
  HPEN     = HANDLE;
  HRASCONN = HANDLE;
  HRGN     = HANDLE;
  HRSRC    = HANDLE;
  HSTMT    = HANDLE;
  HSTR     = HANDLE;
  HSZ      = HANDLE;
  HWINSTA  = HANDLE;
  HWND     = HANDLE;
  HTASK    = HANDLE;

  LANGID = UInt16;
  LCID   = UInt32;
  LCTYPE = UInt32;
  LPARAM = PtrUInt;
  
  LPCOLORREF = ^COLORREF;
  LPCSTR  = ^Char;
  LPCTSTR = ^Char;
  
  LPCWCH  = ^WideChar;
  LPCWSTR = ^WideChar;
  
  LPPCSTR  = ^LPCSTR;
  LPPCTSTR = ^LPCTSTR;
  LPPCWSTR = ^LPCWSTR;

  LPDWORD = ^UInt32;

  LPHANDLE = ^HANDLE;

  LPINT  = ^LongInt;
  LPLONG = ^LongInt;

  LPSTR  = ^Char;
  LPTCH  = ^Char;
  LPTSTR = ^Char;

  LRESULT = PtrUInt;
  PLRESULT= ^LRESULT;

  LPWCH  = ^WideChar;
  LPWORD = ^UInt16;
  LPWSTR = ^WideChar;
  NWPSTR = ^WideChar;
   
  LPVoid = Pointer; 
   
  _EnumWindowsProc = function(wnd:HWND; Param: LPARAM): BOOL;
  TEnumWindowsProc = native(_EnumWindowsProc, ffi_stdcall); //how dafuq do we use this?
  
  PRect  = ^TRect;

  PWINDOWINFO = ^WINDOWINFO;
  WINDOWINFO = record
    cbSize: UInt32;
    rcWindow: TRect;
    rcClient: TRect;
    dwStyle: UInt32;
    dwExStyle: UInt32;
    dwWindowStatus: UInt32;
    cxWindowBorders: UInt32;
    cyWindowBorders: UInt32;
    atomWindowType: UInt16;
    wCreatorVersion: UInt16;
  end;
  
  PCURSORINFO = ^CURSORINFO;
  CURSORINFO = record
    cbSize: UInt32;
    flags: UInt32;
    cursor: HCURSOR;
    ptScreenPos: TPoint;
  end;
  
  //---| SendInput |----------
  TMouseInput = record
    Itype: UInt32;
    dx: Int32;
    dy: Int32;
    mouseData: UInt32;
    dwFlags: UInt32;
    time: UInt32;
    dwExtraInfo: PtrUInt;
  end;
  
  TKeybdInput = record
    Itype: UInt32;
    wVk: UInt16;
    wScan: UInt16;
    dwFlags: UInt32;
    time: UInt32;
    dwExtraInfo: PtrUInt;
  end;
  
  THardwareInput = record
    Itype: UInt32;
    uMsg: UInt32;
    wParamL: UInt16;
    wParamH: UInt16;
  end;
  
  
  //
  PTrackMouseEvent = ^TTrackMouseEvent;
  TTrackMouseEvent = record
    cbSize: UInt32;
    dwFlags: UInt32;
    hwndTrack: HWND;
    dwHoverTime: UInt32;
  end;
  
  PMouseMovePoint = ^TMouseMovePoint;
  TMouseMovePoint = record
    x: Int32;
    y: Int32;
    time: UInt32;
    dwExtraInfo: PtrUInt;
  end; 


const
  SM_ARRANGE   = 56;
  SM_CLEANBOOT = 67;
  SM_CMONITORS = 80;
  SM_CMOUSEBUTTONS = 43;
  SM_CONVERTIBLESLATEMODE = $2003;
  SM_CXBORDER = 5;
  SM_CXCURSOR = 13;
  SM_CXDLGFRAME  = 7;
  SM_CXDOUBLECLK = 36;
  SM_CXDRAG = 68;
  SM_CXEDGE = 45;
  SM_CXFIXEDFRAME  = 7;
  SM_CXFOCUSBORDER = 83;
  SM_CXFRAME = 32;
  SM_CXFULLSCREEN = 16;
  SM_CXHSCROLL = 21;
  SM_CXHTHUMB  = 10;
  SM_CXICON    = 11;
  SM_CXICONSPACING= 38;
  SM_CXMAXIMIZED  = 61;
  SM_CXMAXTRACK   = 59;
  SM_CXMENUCHECK  = 71;
  SM_CXMENUSIZE   = 54;
  SM_CXMIN        = 28;
  SM_CXMINIMIZED  = 57;
  SM_CXMINSPACING = 47;
  SM_CXMINTRACK   = 34;
  SM_CXPADDEDBORDER = 92;
  SM_CXSCREEN = 0;
  SM_CXSIZE   = 30;
  SM_CXSIZEFRAME = 32;
  SM_CXSMICON    = 49;
  SM_CXSMSIZE    = 52;
  SM_CXVIRTUALSCREEN = 78;
  SM_CXVSCROLL = 2;
  SM_CYBORDER  = 6;
  SM_CYCAPTION = 4;
  SM_CYCURSOR  = 14;
  SM_CYDLGFRAME  = 8;
  SM_CYDOUBLECLK = 37;
  SM_CYDRAG = 69;
  SM_CYEDGE = 46;
  SM_CYFIXEDFRAME  = 8;
  SM_CYFOCUSBORDER = 84;
  SM_CYFRAME      = 33;
  SM_CYFULLSCREEN = 17;
  SM_CYHSCROLL = 3;
  SM_CYICON    = 12;
  SM_CYICONSPACING = 39;
  SM_CYKANJIWINDOW = 18;
  SM_CYMAXIMIZED = 62;
  SM_CYMAXTRACK  = 60;
  SM_CYMENU      = 15;
  SM_CYMENUCHECK = 72;
  SM_CYMENUSIZE  = 55;
  SM_CYMIN       = 29;
  SM_CYMINIMIZED = 58;
  SM_CYMINSPACING = 48;
  SM_CYMINTRACK = 35;
  SM_CYSCREEN   = 1;
  SM_CYSIZE     = 31;
  SM_CYSIZEFRAME = 33;
  SM_CYSMCAPTION = 51;
  SM_CYSMICON = 50;
  SM_CYSMSIZE = 53;
  SM_CYVIRTUALSCREEN = 79;
  SM_CYVSCROLL = 20;
  SM_CYVTHUMB  = 9;
  SM_DBCSENABLED = 42;
  SM_DEBUG = 22;
  SM_DIGITIZER  = 94;
  SM_IMMENABLED = 82;
  SM_MAXIMUMTOUCHES = 95;
  SM_MEDIACENTER    = 87;
  SM_MENUDROPALIGNMENT = 40;
  SM_MIDEASTENABLED = 74;
  SM_MOUSEPRESENT   = 19;
  SM_MOUSEHORIZONTALWHEELPRESENT = 91;
  SM_MOUSEWHEELPRESENT = 75;
  SM_NETWORK       = 63;
  SM_PENWINDOWS    = 41;
  SM_REMOTECONTROL = $2001;
  SM_REMOTESESSION = $1000;
  SM_SAMEDISPLAYFORMAT = 81;
  SM_SECURE     = 44;
  SM_SERVERR2   = 89;
  SM_SHOWSOUNDS = 70;
  SM_SHUTTINGDOWN = $2000;
  SM_SLOWMACHINE  = 73;
  SM_STARTER      = 88;
  SM_SWAPBUTTON   = 23;
  SM_SYSTEMDOCKED = $2004;
  SM_TABLETPC     = 86;
  SM_XVIRTUALSCREEN = 76;
  SM_YVIRTUALSCREEN = 77;
  
  
  MOUSEEVENTF_ABSOLUTE  = $8000;
  MOUSEEVENTF_LEFTDOWN  = $0002;
  MOUSEEVENTF_LEFTUP    = $0004;
  MOUSEEVENTF_MIDDLEDOWN= $0020;
  MOUSEEVENTF_MIDDLEUP  = $0040;
  MOUSEEVENTF_MOVE      = $0001;
  MOUSEEVENTF_RIGHTDOWN = $0008;
  MOUSEEVENTF_RIGHTUP   = $0010;
  MOUSEEVENTF_WHEEL     = $0800;
  MOUSEEVENTF_XDOWN     = $0080;
  MOUSEEVENTF_XUP       = $0100;
  MOUSEEVENTF_HWHEEL    = $01000;
