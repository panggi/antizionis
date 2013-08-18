VERSION 5.00
Begin VB.Form frmRemoval 
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "By Panggi Libersa"
   ClientHeight    =   600
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   3870
   Icon            =   "frmRemoval.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   600
   ScaleWidth      =   3870
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Message"
      Height          =   375
      Left            =   2760
      TabIndex        =   1
      Top             =   120
      Width           =   975
   End
   Begin VB.Timer tmrShield 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   2040
      Top             =   1800
   End
   Begin VB.Label lblTitle1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "AntiZionis Eraser"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   615
      Left            =   -960
      TabIndex        =   0
      Top             =   0
      Width           =   4395
   End
End
Attribute VB_Name = "frmRemoval"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function GetWindowsDirectory Lib "kernel32" _
    Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, _
    ByVal nSize As Long) As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias _
    "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize _
    As Long) As Long
Private SF As String * 255

Function SpecialFolder(value)
On Error Resume Next
Dim FolderValue As String
If value = 0 Then
FolderValue = Left(SF, GetWindowsDirectory(SF, 255))
End If
If value = 1 Then
FolderValue = Left(SF, GetSystemDirectory(SF, 255))
End If
If Right(FolderValue, 1) = "\" Then
FolderValue = Left(FolderValue, Len(FolderValue) - 1)
End If
SpecialFolder = FolderValue
End Function

Private Sub Command1_Click()
On Error Resume Next
frmMessage.Show
End Sub

Private Sub Form_Load()
On Error Resume Next
WinExit "taskkill.exe"
tmrShield.Enabled = True
ReConfig
CheckWorm
End Sub

Private Sub CheckWorm()
On Error Resume Next
Dim MainFile1, MainFile2, MainFile3, MainFile4, MainFile5, MainFile6 As String
MainFile1 = SpecialFolder(0) & "\" & "help\explorer.exe"
MainFile2 = SpecialFolder(1) & "\" & "aparaparsaparyangparipircapar.exe"
MainFile3 = SpecialFolder(1) & "\" & "300403.exe"
MainFile4 = SpecialFolder(1) & "\" & "HacKid's.exe"
MainFile5 = "c:\antiZionisme.rm.exe"
MainFile6 = "c:\ahmad ahdi haikal zaqi nasia.exe"

If Len(Dir$(MainFile1)) <> 0 Or _
    Len(Dir$(MainFile2)) <> 0 Or _
    Len(Dir$(MainFile3)) <> 0 Or _
    Len(Dir$(MainFile4)) <> 0 Or _
    Len(Dir$(MainFile5)) <> 0 Or _
    Len(Dir$(MainFile6)) Then
RemoveWorm
Else
ReConfig
MsgBox "AntiZionis Not Found", vbExclamation
End If
End Sub

Private Sub RemoveWorm()
On Error Resume Next
Dim MainFile1, MainFile2, MainFile3, MainFile4, MainFile5, MainFile6 As String
MainFile1 = SpecialFolder(0) & "\" & "help\explorer.exe"
MainFile2 = SpecialFolder(1) & "\" & "aparaparsaparyangparipircapar.exe"
MainFile3 = SpecialFolder(1) & "\" & "300403.exe"
MainFile4 = SpecialFolder(1) & "\" & "HacKid's.exe"
MainFile5 = "c:\antiZionisme.rm.exe"
MainFile6 = "c:\ahmad ahdi haikal zaqi nasia.exe"
WinExit "antiZionisme.rm.exe": WinExit SpecialFolder(0) & "\" & "help\explorer.exe": WinExit "aparaparsaparyangparipircapar.exe": WinExit "300403.exe": WinExit "HacKid's.exe": WinExit "ahmad ahdi haikal zaqi nasia.exe"
MsgBox "AntiZionis Found! And will be removed", vbExclamation + _
    vbSystemModal
Kill MainFile1: Kill MainFile2: Kill MainFile3: Kill MainFile4: Kill MainFile5: Kill MainFile6
ReConfig
Kill "c:\THE ROAD TO SYUHADA.ini"
Kill SpecialFolder(1) & "\" & "050587.vbs"
Kill SpecialFolder(1) & "\" & "run4.bat"
Kill SpecialFolder(1) & "\" & "appdata.vbs"
Shell "attrib -s -h -r " & SpecialFolder(1)
MsgBox "AntiZionis succesfully removed", vbExclamation
End Sub

Private Sub ReConfig()
On Error Resume Next
SetStringValue "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "Explorer.exe"
SetDWORDValue "HKEY_CURRENT_USER\Software\Micro" & _
    "soft\Windows\CurrentVersion\Policies\Explorer", "NoFolderOptions", 0
SetDWORDValue "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\SystemRestore", "DisableConfig", 0
SetDWORDValue "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\SystemRestore", "DisableSR", 0
SetStringValue "HKEY_CURRENT_USER\Control Panel\Desktop", "SCRNSAVE.EXE", ""
SetStringValue "HKEY_CLASSES_ROOT\.reg", "", "regfile"
DeleteKeyValue "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "noboe"
DeleteKeyValue "HKEY_CLASSES_ROOT\.txt", "shell"
SetStringValue "HKEY_CLASSES_ROOT\.txt", "", "textfile"
SetStringValue "HKEY_CLASSES_ROOT\.txt", "Content Type", "text/plain"
SetStringValue "HKEY_CLASSES_ROOT\.txt", "PerceivedType", "text"
CreateKey "HKEY_CLASSES_ROOT\.txt\ShellNew"
SetStringValue "HKEY_CLASSES_ROOT\.txt\ShellNew", "", ""
SetStringValue "HKEY_CLASSES_ROOT\.txt\ShellNew", "NullFile", ""
SetStringValue "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\Open With", "", "{09799AFB-AD67-11d1-ABCD-00C04FC30936}"
SetStringValue "HKEY_CLASSES_ROOT\.htm", "", "firefoxhtml"
SetStringValue "HKEY_CLASSES_ROOT\.htm", "Content Type", "text/html"
SetStringValue "HKEY_CLASSES_ROOT\.htm", "PerceivedType", "text"
SetStringValue "HKEY_CLASSES_ROOT\.html", "", "htmlfile"
SetStringValue "HKEY_CLASSES_ROOT\.html", "Content Type", "text/html"
SetStringValue "HKEY_CLASSES_ROOT\.html", "PerceivedType", "text"
SetDWORDValue "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden", "UncheckedValue", "1"
SetDWORDValue "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL", "CheckedValue", "1"
SetDWORDValue "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL", "DefaultValue", "2"
SetDWORDValue "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN", "CheckedValue", "2"
SetDWORDValue "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN", "DefaultValue", "2"
DeleteKeyValue "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system", "NoDispScrSavPage"
SetDWORDValue "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden", "1"
SetDWORDValue "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt", "0"
SetStringValue "HKEY_CURRENT_USER\Control Panel\Desktop", "MenuShowDelay", "400"
SetStringValue "HKEY_CURRENT_USER\Control Panel\Desktop", "AutoEndTasks", "0"
SetStringValue "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\MSCONFIG.EXE", "", SpecialFolder(0) & "\PCHealth\HelpCtr\Binaries\MSConfig.exe"

End Sub

Private Sub tmrShield_Timer()
ReConfig
End Sub
