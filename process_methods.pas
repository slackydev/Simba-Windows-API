{$include_once WinTypes.pas}
//--------------------------------------------------------------------------------------------------------------------\\
//-----| Processes and Threads  >  Process and Thread Reference  >  Process and Thread Functions  |-------------------||
//--------------------------------------------------------------------------------------------------------------------//

// VOID WINAPI ExitProcess( _In_UINT uExitCode); [@Kernel32.dll]
procedure LibKernel32.ExitProcess(uExitCode: UInt32); static; external 'ExitProcess@Kernel32.dll stdcall';

// VOID WINAPI ExitThread( _In_DWORD dwExitCode); [@Kernel32.dll; ]
procedure LibKernel32.ExitThread(dwExitCode: DWORD); static; external 'ExitThread@Kernel32.dll stdcall';

// VOID WINAPI FlushProcessWriteBuffers(); [@Kernel32.dll]
procedure LibKernel32.FlushProcessWriteBuffers(); static; external 'FlushProcessWriteBuffers@Kernel32.dll stdcall';

// BOOL WINAPI FreeEnvironmentStrings( _In_LPTCH lpszEnvironmentBlock); [@Kernel32.dll]
function LibKernel32.FreeEnvironmentStrings(lpszEnvironmentBlock: LPWCH): BOOL; static; external 'FreeEnvironmentStringsW@Kernel32.dll stdcall';

// DWORD GetActiveProcessorCount( _In_WORD GroupNumber); [@Kernel32.dll]
function LibKernel32.GetActiveProcessorCount(GroupNumber: WORD): DWORD; static; external 'GetActiveProcessorCount@Kernel32.dll stdcall';

// WORD GetActiveProcessorGroupCount(); [@Kernel32.dll]
function LibKernel32.GetActiveProcessorGroupCount(): Word; static; external 'GetActiveProcessorGroupCount@Kernel32.dll stdcall';

// LPTSTR WINAPI GetCommandLine(); [@Kernel32.dll]
function LibKernel32.GetCommandLine(): LPWSTR; static; external 'GetCommandLineW@Kernel32.dll stdcall';

// HANDLE WINAPI GetCurrentProcess(); [@Kernel32.dll]
function LibKernel32.GetCurrentProcess(): HANDLE; static; external 'GetCurrentProcess@Kernel32.dll stdcall';

// DWORD WINAPI GetCurrentProcessId(); [@Kernel32.dll]
function LibKernel32.GetCurrentProcessId(): DWORD; static; external 'GetCurrentProcessId@Kernel32.dll stdcall';

// DWORD WINAPI GetCurrentProcessorNumber(); [@Kernel32.dll]
function LibKernel32.GetCurrentProcessorNumber(): DWord; static; external 'GetCurrentProcessorNumber@Kernel32.dll stdcall';

// HANDLE WINAPI GetCurrentThread(); [@Kernel32.dll]
function LibKernel32.GetCurrentThread(): HANDLE; static; external 'GetCurrentThread@Kernel32.dll stdcall';

// DWORD WINAPI GetCurrentThreadId(); [@Kernel32.dll]
function LibKernel32.GetCurrentThreadId(): DWord; static; external 'GetCurrentThreadId@Kernel32.dll stdcall';

// LPTCH WINAPI GetEnvironmentStrings(); [@Kernel32.dll]
function LibKernel32.GetEnvironmentStrings(): LPWCH; static; external 'GetEnvironmentStringsW@Kernel32.dll stdcall';

// DWORD WINAPI GetEnvironmentVariable( _In_opt_LPCTSTR lpName, _Out_opt_LPTSTR lpBuffer, _In_DWORD nSize); [@Kernel32.dll]
function LibKernel32.GetEnvironmentVariable(lpName: LPCWSTR; lpBuffer: LPWSTR; nSize: DWord): DWord; static; external 'GetEnvironmentVariableW@Kernel32.dll stdcall';

// DWORD WINAPI GetPriorityClass( _In_HANDLE hProcess); [@Kernel32.dll]
function LibKernel32.GetPriorityClass(hProcess: HANDLE): DWord; static; external 'GetPriorityClass@Kernel32.dll stdcall';

// BOOL WINAPI GetProcessAffinityMask( _In_HANDLE hProcess, _Out_PDWORD_PTR lpProcessAffinityMask, _Out_PDWORD_PTR lpSystemAffinityMask); [@Kernel32.dll]
function LibKernel32.GetProcessAffinityMask(hProcess: HANDLE; out ProcessAffinityMask, SystemAffinityMask: PtrUInt): BOOL; static; external 'GetProcessAffinityMask@Kernel32.dll stdcall';

// BOOL GetProcessGroupAffinity( _In_HANDLE hProcess, _Inout_PUSHORT GroupCount, _Out_PUSHORT GroupArray); [@Kernel32.dll]
function LibKernel32.GetProcessGroupAffinity(hProcess: HANDLE; var GroupCount: UInt16; out GroupArray: UInt16): BOOL; static; external 'GetProcessGroupAffinity@Kernel32.dll stdcall';

// BOOL WINAPI GetProcessHandleCount( _In_HANDLE hProcess, _Inout_PDWORD pdwHandleCount); [@Kernel32.dll]
function LibKernel32.GetProcessHandleCount(hProcess: HANDLE; var dwHandleCount: DWord): BOOL; static; external 'GetProcessHandleCount@Kernel32.dll stdcall';

// DWORD WINAPI GetProcessId( _In_HANDLE Process); [@Kernel32.dll]
function LibKernel32.GetProcessId(Process: HANDLE): DWORD; static; external 'GetProcessId@Kernel32.dll stdcall';

// DWORD WINAPI GetProcessIdOfThread( _In_HANDLE Thread); [@Kernel32.dll]
function LibKernel32.GetProcessIdOfThread(Thread: HANDLE): DWORD; static; external 'GetProcessIdOfThread@Kernel32.dll stdcall';

// BOOL WINAPI GetProcessPriorityBoost( _In_HANDLE hProcess, _Out_PBOOL pDisablePriorityBoost); [@Kernel32.dll]
function LibKernel32.GetProcessPriorityBoost(hProcess: HANDLE; out DisablePriorityBoost: BOOL): BOOL; static; external 'GetProcessPriorityBoost@Kernel32.dll stdcall';

// BOOL WINAPI GetProcessShutdownParameters( _Out_LPDWORD lpdwLevel, _Out_LPDWORD lpdwFlags); [@Kernel32.dll]
function LibKernel32.GetProcessShutdownParameters(out dwLevel, dwFlags: DWord): BOOL; static; external 'GetProcessShutdownParameters@Kernel32.dll stdcall';

// DWORD WINAPI GetProcessVersion( _In_DWORD ProcessId); [@Kernel32.dll]
function LibKernel32.GetProcessVersion(ProcessId: DWORD): DWORD; static; external 'GetProcessVersion@Kernel32.dll stdcall';

// BOOL WINAPI GetProcessWorkingSetSize( _In_HANDLE hProcess, _Out_PSIZE_T lpMinimumWorkingSetSize, _Out_PSIZE_T lpMaximumWorkingSetSize); [@Kernel32.dll]
function LibKernel32.GetProcessWorkingSetSize(hProcess: HANDLE; out lpMinimumWorkingSetSize, lpMaximumWorkingSetSize: SizeInt): BOOL; static; external 'GetProcessWorkingSetSize@Kernel32.dll stdcall';

// BOOL WINAPI GetProcessWorkingSetSizeEx( _In_HANDLE hProcess, _Out_PSIZE_T lpMinimumWorkingSetSize, _Out_PSIZE_T lpMaximumWorkingSetSize, _Out_PDWORD Flags); [@Kernel32.dll]
function LibKernel32.GetProcessWorkingSetSizeEx(hProcess: HANDLE; out MinimumWorkingSetSize, MaximumWorkingSetSize: SizeInt; out Flags: DWord): BOOL; static; external 'GetProcessWorkingSetSizeEx@Kernel32.dll stdcall';

// VOID WINAPI GetStartupInfo( _Out_LPSTARTUPINFO lpStartupInfo); [@Kernel32.dll]
procedure LibKernel32.GetStartupInfo(out StartupInfo: STARTUPINFO); static; external 'GetStartupInfoW@Kernel32.dll stdcall';

// BOOL GetThreadGroupAffinity( _In_HANDLE hThread, _Out_PGROUP_AFFINITY GroupAffinity); [@Kernel32.dll]
function LibKernel32.GetThreadGroupAffinity(hThread: HANDLE; out GroupAffinity: GROUP_AFFINITY): BOOL; static; external 'GetThreadGroupAffinity@Kernel32.dll stdcall';

// DWORD WINAPI GetThreadId( _In_HANDLE Thread); [@Kernel32.dll]
function LibKernel32.GetThreadId(Thread: HANDLE): DWORD; static; external 'GetThreadId@Kernel32.dll stdcall';

// BOOL WINAPI GetThreadIOPendingFlag( _In_HANDLE hThread, _Inout_PBOOL lpIOIsPending); [@Kernel32.dll]
function LibKernel32.GetThreadIOPendingFlag(hThread: HANDLE; var IOIsPending: BOOL): BOOL; static; external 'GetThreadIOPendingFlag@Kernel32.dll stdcall';

// int WINAPI GetThreadPriority( _In_HANDLE hThread); [@Kernel32.dll; ]
function LibKernel32.GetThreadPriority(hThread: HANDLE): Int32; static; external 'GetThreadPriority@Kernel32.dll stdcall';

// BOOL WINAPI GetThreadPriorityBoost( _In_HANDLE hThread, _Out_PBOOL pDisablePriorityBoost); [@Kernel32.dll]
function LibKernel32.GetThreadPriorityBoost(hThread: HANDLE; out DisablePriorityBoost: BOOL): BOOL; static; external 'GetThreadPriorityBoost@Kernel32.dll stdcall';

// BOOL WINAPI IsProcessInJob( _In_HANDLE ProcessHandle, _In_opt_HANDLE JobHandle, _Out_PBOOL Result); [@Kernel32.dll]
function LibKernel32.IsProcessInJob(ProcessHandle: HANDLE; JobHandle: HANDLE; out Res: BOOL): BOOL; static; external 'IsProcessInJob@Kernel32.dll stdcall';

// HANDLE WINAPI OpenProcess( _In_DWORD dwDesiredAccess, _In_BOOL bInheritHandle, _In_DWORD dwProcessId); [@Kernel32.dll]
function LibKernel32.OpenProcess(dwDesiredAccess: DWORD; bInheritHandle: BOOL; dwProcessId: DWORD): HANDLE; static; external 'OpenProcess@Kernel32.dll stdcall';

// HANDLE WINAPI OpenThread( _In_DWORD dwDesiredAccess, _In_BOOL bInheritHandle, _In_DWORD dwThreadId); [@Kernel32.dll]
function LibKernel32.OpenThread(dwDesiredAccess: DWORD; bInheritHandle: BOOL; dwThreadId: DWORD): HANDLE; static; external 'OpenThread@Kernel32.dll stdcall';

// DWORD WINAPI ResumeThread( _In_HANDLE hThread); [@Kernel32.dll; ]
function LibKernel32.ResumeThread(hThread: HANDLE): DWORD; static; external 'ResumeThread@Kernel32.dll stdcall';

// BOOL WINAPI SetEnvironmentVariable( _In_LPCTSTR lpName, _In_opt_LPCTSTR lpValue); [@Kernel32.dll]
function LibKernel32.SetEnvironmentVariable(lpName: LPCWSTR; lpValue: LPCWSTR): BOOL; static; external 'SetEnvironmentVariableW@Kernel32.dll stdcall';

// BOOL WINAPI SetPriorityClass( _In_HANDLE hProcess, _In_DWORD dwPriorityClass); [@Kernel32.dll]
function LibKernel32.SetPriorityClass(hProcess: HANDLE; dwPriorityClass: DWORD): BOOL; static; external 'SetPriorityClass@Kernel32.dll stdcall';

// BOOL WINAPI SetProcessAffinityMask( _In_HANDLE hProcess, _In_DWORD_PTR dwProcessAffinityMask); [@Kernel32.dll]
function LibKernel32.SetProcessAffinityMask(hProcess: HANDLE; dwProcessAffinityMask: PtrUInt): BOOL; static; external 'SetProcessAffinityMask@Kernel32.dll stdcall';

// BOOL WINAPI SetProcessAffinityUpdateMode( _In_HANDLE ProcessHandle, _In_DWORD dwFlags); [@Kernel32.dll]
function LibKernel32.SetProcessAffinityUpdateMode(ProcessHandle: HANDLE; dwFlags: DWORD): BOOL; static; external 'SetProcessAffinityUpdateMode@Kernel32.dll stdcall';

// BOOL WINAPI SetProcessPriorityBoost( _In_HANDLE hProcess, _In_BOOL DisablePriorityBoost); [@Kernel32.dll]
function LibKernel32.SetProcessPriorityBoost(hProcess: HANDLE; DisablePriorityBoost: BOOL): BOOL; static; external 'SetProcessPriorityBoost@Kernel32.dll stdcall';

// BOOL WINAPI SetProcessShutdownParameters( _In_DWORD dwLevel, _In_DWORD dwFlags); [@Kernel32.dll]
function LibKernel32.SetProcessShutdownParameters(dwLevel: DWORD; dwFlags: DWORD): BOOL; static; external 'SetProcessShutdownParameters@Kernel32.dll stdcall';

// BOOL WINAPI SetProcessWorkingSetSize( _In_HANDLE hProcess, _In_SIZE_T dwMinimumWorkingSetSize, _In_SIZE_T dwMaximumWorkingSetSize); [@Kernel32.dll]
function LibKernel32.SetProcessWorkingSetSize(hProcess: HANDLE; dwMinimumWorkingSetSize, dwMaximumWorkingSetSize: SizeInt): BOOL; static; external 'SetProcessWorkingSetSize@Kernel32.dll stdcall';

// BOOL WINAPI SetProcessWorkingSetSizeEx( _In_HANDLE hProcess, _In_SIZE_T dwMinimumWorkingSetSize, _In_SIZE_T dwMaximumWorkingSetSize, _In_DWORD Flags); [@Kernel32.dll]
function LibKernel32.SetProcessWorkingSetSizeEx(hProcess: HANDLE; dwMinimumWorkingSetSize, dwMaximumWorkingSetSize: SizeInt; Flags: Dword): BOOL; static; external 'SetProcessWorkingSetSizeEx@Kernel32.dll stdcall';

// DWORD_PTR WINAPI SetThreadAffinityMask( _In_HANDLE hThread, _In_DWORD_PTR dwThreadAffinityMask); [@Kernel32.dll]
function LibKernel32.SetThreadAffinityMask(hThread: HANDLE; dwThreadAffinityMask: PtrUInt): PtrUInt; static; external 'SetThreadAffinityMask@Kernel32.dll stdcall';

// DWORD WINAPI SetThreadIdealProcessor( _In_HANDLE hThread, _In_DWORD dwIdealProcessor); [@Kernel32.dll]
function LibKernel32.SetThreadIdealProcessor(hThread: HANDLE; dwIdealProcessor: DWORD): DWORD; static; external 'SetThreadIdealProcessor@Kernel32.dll stdcall';

// BOOL WINAPI SetThreadPriority( _In_HANDLE hThread, _In_int nPriority); [@Kernel32.dll; ]
function LibKernel32.SetThreadPriority(hThread: HANDLE; nPriority: Int32): BOOL; static; external 'SetThreadPriority@Kernel32.dll stdcall';

// BOOL WINAPI SetThreadPriorityBoost( _In_HANDLE hThread, _In_BOOL DisablePriorityBoost); [@Kernel32.dll]
function LibKernel32.SetThreadPriorityBoost(hThread: HANDLE; DisablePriorityBoost: BOOL): BOOL; static; external 'SetThreadPriorityBoost@Kernel32.dll stdcall';

// BOOL WINAPI SetThreadStackGuarantee( _Inout_PULONG StackSizeInBytes); [@Kernel32.dll]
function LibKernel32.SetThreadStackGuarantee(var StackSizeInBytes: UInt32): BOOL; static; external 'SetThreadStackGuarantee@Kernel32.dll stdcall';

// VOID WINAPI Sleep( _In_DWORD dwMilliseconds); [@Kernel32.dll; ]
procedure LibKernel32.Sleep(dwMilliseconds: DWORD); static; external 'Sleep@Kernel32.dll stdcall';

// DWORD WINAPI SleepEx( _In_DWORD dwMilliseconds, _In_BOOL bAlertable); [@Kernel32.dll]
function LibKernel32.SleepEx(dwMilliseconds: DWORD; bAlertable: BOOL): DWORD; static; external 'SleepEx@KernelBase.dll stdcall';

// DWORD WINAPI SuspendThread( _In_HANDLE hThread); [@Kernel32.dll]
function LibKernel32.SuspendThread(hThread: HANDLE): DWORD; static; external 'SuspendThread@Kernel32.dll stdcall';

// BOOL WINAPI TerminateJobObject( _In_HANDLE hJob, _In_UINT uExitCode); [@Kernel32.dll]
function LibKernel32.TerminateJobObject(hJob: HANDLE; uExitCode: UInt32): BOOL; static; external 'TerminateJobObject@Kernel32.dll stdcall';

// BOOL WINAPI TerminateProcess( _In_HANDLE hProcess, _In_UINT uExitCode); [@Kernel32.dll]
function LibKernel32.TerminateProcess(hProcess: HANDLE; uExitCode: UInt32): BOOL; static; external 'TerminateProcess@Kernel32.dll stdcall';

// BOOL WINAPI TerminateThread( _Inout_HANDLE hThread, _In_DWORD dwExitCode); [@Kernel32.dll]
function LibKernel32.TerminateThread(hThread: HANDLE; dwExitCode: DWORD): BOOL; static; external 'TerminateThread@Kernel32.dll stdcall';

// DWORD WINAPI TlsAlloc(); [@Kernel32.dll]
function LibKernel32.TlsAlloc(): DWord; static; external 'TlsAlloc@Kernel32.dll  stdcall';

// BOOL WINAPI TlsFree( _In_DWORD dwTlsIndex); [@Kernel32.dll]
function LibKernel32.TlsFree(dwTlsIndex: DWord): BOOL; static; external 'TlsFree@Kernel32.dll  stdcall';

// LPVOID WINAPI TlsGetValue( _In_DWORD dwTlsIndex); [@Kernel32.dll]
function LibKernel32.TlsGetValue(dwTlsIndex: DWord): Pointer; static; external 'TlsGetValue@Kernel32.dll stdcall';

// BOOL WINAPI TlsSetValue( _In_DWORD dwTlsIndex, _In_opt_LPVOID lpTlsValue); [@Kernel32.dll]
function LibKernel32.TlsSetValue(dwTlsIndex: DWord; lpTlsValue: Pointer): BOOL; static; external 'TlsSetValue@Kernel32.dll stdcall';

// BOOL WINAPI UserHandleGrantAccess( _In_HANDLE hUserHandle, _In_HANDLE hJob, _In_BOOL bGrant); [@User32.dll]
function LibUser32.UserHandleGrantAccess(hUserHandle: HANDLE; hJob: HANDLE; bGrant: BOOL): BOOL; static; external 'UserHandleGrantAccess@User32.dll stdcall';

// DWORD WINAPI WaitForInputIdle( _In_HANDLE hProcess, _In_DWORD dwMilliseconds); [@User32.dll]
function LibUser32.WaitForInputIdle(hProcess: HANDLE; dwMilliseconds: DWORD): DWORD; static; external 'WaitForInputIdle@User32.dll stdcall';

// UINT WINAPI WinExec( _In_LPCSTR lpCmdLine, _In_UINT uCmdShow); [@Kernel32.dll]
function LibKernel32.WinExec(lpCmdLine: LPTSTR; uCmdShow: UInt32): UInt32; static; external 'WinExec@Kernel32.dll stdcall';
