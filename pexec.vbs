''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' pexec.vbs
'' v1.02, 2014-11-05, 05:43:42 CST
''
'' AUTHOR: Mark R. Gollnick <mark.r.gollnick@gmail.com>
'' HOMEPAGE: http://github.com/markgollnick
''
'' DESCRIPTION:
''   Print the parent process location. Useful for iexpress.exe packages.
''
'' USAGE:
''   cscript pexec.vbs (if called from cmd.exe, prints C:\path\to\cmd.exe)
''   wscript pexec.vbs (if called from explorer.exe, prints its path, etc.)
''
'' ACKNOWLEDGEMENTS:
''   http://stackoverflow.com/questions/13534699/iexpress-extraction-path/13700281#13700281
''   http://msdn.microsoft.com/en-us/library/aa394599(v=vs.85).aspx
''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Option Explicit

Dim objShell, objWMI, objCmd, objMyParent
Dim strMyParentPath
Dim intMyPid, intMyParentPid, intParents

If WScript.Arguments.Count < 1 Then
  WScript.Echo(_
    "pexec 1.02, a parental executor." & vbCrLf & _
    "Usage: [c|w]script " & WScript.ScriptName & " <1..*>" & vbCrLf & _
    "Prints the executing parent's path x levels up the stack." & vbCrLf & _
    "Useful for iexpress.exe packages and the like." _
  )
  WScript.Quit
Else
  intParents = 1
  If WScript.Arguments.Count >= 1 Then
    If Abs(WScript.Arguments(0)) > 0 Then
      intParents = Abs(WScript.Arguments(0))
    End If
  End If
End If

Set objShell = CreateObject("WScript.Shell")
Set objWMI = GetObject("winmgmts:\\.\root\CIMV2")

Set objCmd = objShell.Exec("cmd.exe")
intMyPid = objWMI.Get("Win32_Process.Handle='" & objCmd.ProcessID & "'").ParentProcessId
objCmd.Terminate

Do While intParents > 0
  intMyParentPid = objWMI.Get("Win32_Process.Handle='" & intMyPid & "'").ParentProcessId
  Set objMyParent = objWMI.Get("Win32_Process.Handle='" & intMyParentPid & "'")
  strMyParentPath = objMyParent.ExecutablePath
  intMyPid = intMyParentPid
  intParents = intParents - 1
Loop

WScript.Echo """" & strMyParentPath & """"
