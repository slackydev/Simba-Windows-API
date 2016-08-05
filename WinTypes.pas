type
  WinDLL      = type Pointer; 
  LibUser32   = WinDLL; //meh... so it's all accessible through "Windows"
  LibGdi32    = WinDLL; //
  LibKernel32 = WinDLL; //
  LibMsimg32  = WinDLL; //
  LibAdvapi32 = WinDLL; //
  LibAvrt     = WinDLL; //
  
  
var
  Windows:  WinDLL;
  User32:   LibUser32;
  Gdi32:    LibGdi32;
  Kernel32: LibKernel32;
  Msimg32:  LibMsimg32;
  Advapi32: LibMsimg32;
  Avrt:     LibAvrt;
  

type
  {$IFNDECL PWideChar}PWideChar = ^WideChar;{$ENDIF}
  {$IFNDECL PUInt32}  PUInt32 = ^UInt32;    {$ENDIF}
  {$IFNDECL PUInt16}  PUInt16 = ^UInt16;    {$ENDIF}
  {$IFNDECL PUInt8}   PUInt8  = ^UInt8;     {$ENDIF}
  
  WINBOOL = LongBool;
  BOOL  = WINBOOL;
  PBOOL = ^BOOL;
  
  COLORREF  = Int32;
  PCOLORREF = ^COLORREF;
  
  WINLONG  = Int32;
  WININT   = Int32;
  WINSHORT = Int16; 
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
  
  DWORDLONG  = UInt64;
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
  LPARAM = Pointer;
  
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
  
  TBlendFunction = Pointer;  
  
  _EnumWindowsProc = function(wnd:HWND; Param: LPARAM): BOOL;
  TEnumWindowsProc = native(_EnumWindowsProc, ffi_stdcall);
  
  PRect = ^TRect;
  
  PSizeStruct = ^TSizeStruct;
  TSizeStruct = record W,H:Int32; end;
  
  PBITMAPINFOHEADER = ^BITMAPINFOHEADER;
  BITMAPINFOHEADER = record
    biSize: DWord;
    biWidth: LongInt;
    biHeight: LongInt;
    biPlanes: Word;
    biBitCount: Word;
    biCompression: DWord;
    biSizeImage: DWord;
    biXPelsPerMeter: LongInt;
    biYPelsPerMeter: LongInt;
    biClrUsed: DWord;
    biClrImportant: DWord;
  end;
  
  PBITMAPINFO = ^BITMAPINFO;
  BITMAPINFO = record
    bmiHeader: BITMAPINFOHEADER;
    bmiColors: array[0..0] of TRGB32;
  end;
  
  PBITMAP = ^BITMAP;
  BITMAP = record
    bmType: LongInt;
    bmWidth: LongInt;
    bmHeight: LongInt;
    bmWidthBytes: LongInt;
    bmPlanes: Word;
    bmBitsPixel: Word;
    bmBits: Pointer;
  end;
  
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
  
  TWindowPlacement = record
    length: UInt32;
    flags: UInt32;
    showCmd: UInt32;
    ptMinPosition: TPoint;
    ptMaxPosition: TPoint;
    rcNormalPosition: TRect;
  end;
  
  // this is actually supposed to be a union, but.. eat shit!
  PSYSTEM_INFO = ^SYSTEM_INFO;
  SYSTEM_INFO = record
    dwOemId: DWord;
    dwPageSize: DWord;
    lpMinimumApplicationAddress: Pointer;
    lpMaximumApplicationAddress: Pointer;
    dwActiveProcessorMask: PtrUInt;
    dwNumberOfProcessors: DWord;
    dwProcessorType: DWord;
    dwAllocationGranularity: DWord;
    wProcessorLevel: Word;
    wProcessorRevision: Word;	
  end;
  
  GROUP_AFFINITY = record
    Mask: PtrUInt;
    Group: Word;
    Reserved0,Reserved1,Reserved2: Word;
  end;
  
  STARTUPINFO = record
    cb: DWord;
    lpReserved: LPWSTR;
    lpDesktop: LPWSTR;
    lpTitle: LPWSTR;
    dwX: DWord;
    dwY: DWord;
    dwXSize: DWord;
    dwYSize: DWord;
    dwXCountChars: DWord;
    dwYCountChars: DWord;
    dwFillAttribute: DWord;
    dwFlags: DWord;
    wShowWindow: Word;
    cbReserved2: Word;
    lpReserved2: ^Byte;
    hStdInput: HANDLE;
    hStdOutput: HANDLE;
    hStdError: HANDLE;
  end;
  
  
  //---| SendInput |----------
  TMouseInput = record
    Itype: DWord;
    dx: Int32;
    dy: Int32;
    mouseData: DWord;
    dwFlags: DWord;
    time: DWord;
    dwExtraInfo: PtrUInt;
  end;
  
  TKeybdInput = record
    Itype: DWord;
    wVk: Word;
    wScan: Word;
    dwFlags: DWord;
    time: DWord;
    dwExtraInfo: PtrUInt;
  end;
  
  THardwareInput = record
    Itype: DWord;
    uMsg: DWord;
    wParamL: Word;
    wParamH: Word;
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
  
  // Window
  GW_HWNDFIRST = 0;
  GW_HWNDLAST = 1;
  GW_HWNDNEXT = 2;
  GW_HWNDPREV = 3;
  GW_OWNER    = 4;
  GW_CHILD    = 5;
  GW_ENABLEDPOPUP= 6;
  GWL_WNDPROC    = -4;
  GWL_HINSTANCE  = -6;
  GWL_HWNDPARENT = -8;
  GWL_ID       = -12;
  GWL_STYLE    = -16;
  GWL_EXSTYLE  = -20;
  GWL_USERDATA = -21;
  
  WS_OVERLAPPED = 0;
  WS_POPUP = -2147483648;
  WS_CHILD = 1073741824;
  WS_MINIMIZE = 536870912;
  WS_VISIBLE = 268435456;
  WS_DISABLED = 134217728;
  WS_CLIPSIBLINGS = 67108864;
  WS_CLIPCHILDREN = 33554432;
  WS_MAXIMIZE = 16777216;
  WS_CAPTION = 12582912;
  WS_BORDER = 8388608;
  WS_DLGFRAME = 4194304;
  WS_VSCROLL = 2097152;
  WS_HSCROLL = 1048576;
  WS_SYSMENU = 524288;
  WS_THICKFRAME = 262144;
  WS_GROUP = 131072;
  WS_TABSTOP = 65536;
  WS_MINIMIZEBOX = 131072;
  WS_MAXIMIZEBOX = 65536;
  WS_TILED = WS_OVERLAPPED;
  WS_ICONIC = WS_MINIMIZE;
  WS_SIZEBOX = WS_THICKFRAME;
  WS_OVERLAPPEDWINDOW = WS_OVERLAPPED or WS_CAPTION or WS_SYSMENU or WS_THICKFRAME or WS_MINIMIZEBOX or WS_MAXIMIZEBOX;
  WS_POPUPWINDOW = WS_POPUP or WS_BORDER or WS_SYSMENU;
  WS_CHILDWINDOW = WS_CHILD;
  WS_TILEDWINDOW = WS_OVERLAPPEDWINDOW;
  
  WS_EX_DLGMODALFRAME = 1;
  WS_EX_NOPARENTNOTIFY = 4;
  WS_EX_TOPMOST = 8;
  WS_EX_ACCEPTFILES = 16;
  WS_EX_TRANSPARENT = 32;
  WS_EX_MDICHILD = 64;
  WS_EX_TOOLWINDOW = 128;
  WS_EX_WINDOWEDGE = 256;
  WS_EX_CLIENTEDGE = 512;
  WS_EX_CONTEXTHELP = 1024;
  WS_EX_RIGHT = 4096;
  WS_EX_LEFT = 0;
  WS_EX_RTLREADING = 8192;
  WS_EX_LTRREADING = 0;
  WS_EX_LEFTSCROLLBAR = 16384;
  WS_EX_RIGHTSCROLLBAR = 0;
  WS_EX_CONTROLPARENT = 65536;
  WS_EX_STATICEDGE = 131072;
  WS_EX_APPWINDOW = 262144;
  WS_EX_OVERLAPPEDWINDOW = (WS_EX_WINDOWEDGE or WS_EX_CLIENTEDGE);
  WS_EX_PALETTEWINDOW = (WS_EX_WINDOWEDGE or WS_EX_TOOLWINDOW or WS_EX_TOPMOST);
  WS_EX_LAYERED = $00080000;
  WS_EX_NOINHERITLAYOUT = $00100000;
  WS_EX_LAYOUTRTL = $00400000;
  WS_EX_COMPOSITED = $02000000;
  WS_EX_NOACTIVATE = $08000000;
  
  
  // mouse
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

  SWP_ASYNCWINDOWPOS = $4000;
  SWP_DEFERERASE     = $2000;
  SWP_DRAWFRAME      = $0020;
  SWP_FRAMECHANGED   = $0020;
  SWP_HIDEWINDOW     = $0080;
  SWP_NOACTIVATE     = $0010;
  SWP_NOCOPYBITS     = $0100;
  SWP_NOMOVE         = $0002;
  SWP_NOOWNERZORDER  = $0200;
  SWP_NOREDRAW       = $0008;
  SWP_NOREPOSITION   = $0200;
  SWP_NOSENDCHANGING = $0400;
  SWP_NOSIZE         = $0001;
  SWP_NOZORDER       = $0004;
  SWP_SHOWWINDOW     = $0040;
