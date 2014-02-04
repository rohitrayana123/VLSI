VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "about emu8086"
   ClientHeight    =   4455
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   6405
   ClipControls    =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4455
   ScaleWidth      =   6405
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox picCopyrights 
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      Height          =   1560
      Left            =   735
      ScaleHeight     =   1560
      ScaleWidth      =   4935
      TabIndex        =   11
      Top             =   2415
      Width           =   4935
      Begin VB.TextBox txtCopyright3 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   705
         Left            =   795
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   12
         TabStop         =   0   'False
         Text            =   "frmAbout.frx":0000
         Top             =   420
         Width           =   3405
      End
      Begin VB.Label lblCopyright1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BorderStyle     =   1  'Fixed Single
         Caption         =   " Copyright © 2008 emu8086.com   All rights reserved. "
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   510
         TabIndex        =   14
         Top             =   1245
         Width           =   3975
      End
      Begin VB.Label lblCopyright2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BorderStyle     =   1  'Fixed Single
         Caption         =   " Portions Copyright 1997-2008 Barry Allyn.  All rights reserved. "
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   165
         TabIndex        =   13
         Top             =   75
         Width           =   4650
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   " this product is registered to: "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1155
      Left            =   165
      TabIndex        =   1
      Top             =   1245
      Width           =   6075
      Begin VB.CommandButton cmdRegister 
         Caption         =   "click here to enter the registration key..."
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         Left            =   900
         TabIndex        =   2
         Top             =   405
         Width           =   4275
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "                                                                                    "
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   180
         TabIndex        =   9
         Top             =   375
         Visible         =   0   'False
         Width           =   5730
      End
      Begin VB.Label lblLicNumber 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "                                                                           "
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   135
         TabIndex        =   8
         Top             =   735
         Visible         =   0   'False
         Width           =   5820
      End
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "ok"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   6180
      TabIndex        =   0
      Top             =   4500
      Width           =   1755
   End
   Begin VB.PictureBox picIcon 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   480
      Left            =   5490
      Picture         =   "frmAbout.frx":0062
      ScaleHeight     =   337.12
      ScaleMode       =   0  'User
      ScaleWidth      =   337.12
      TabIndex        =   3
      Top             =   105
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Label lblRegNow 
      AutoSize        =   -1  'True
      Caption         =   "."
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Left            =   30
      TabIndex        =   10
      Top             =   4185
      Visible         =   0   'False
      Width           =   30
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   390
      Picture         =   "frmAbout.frx":036C
      Top             =   105
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Label lblDescription 
      Alignment       =   2  'Center
      Caption         =   "8086 microprocessor emulator"
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   105
      TabIndex        =   7
      Top             =   840
      Width           =   6210
   End
   Begin VB.Label lblURL 
      AutoSize        =   -1  'True
      BackColor       =   &H0080FFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "www.emu8086.com"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   240
      Left            =   2115
      MouseIcon       =   "frmAbout.frx":0422
      MousePointer    =   99  'Custom
      TabIndex        =   6
      Top             =   4155
      Width           =   2175
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   135
      X2              =   6255
      Y1              =   4050
      Y2              =   4050
   End
   Begin VB.Label lblTitle 
      Alignment       =   2  'Center
      Caption         =   "Application Title"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   450
      Left            =   83
      TabIndex        =   4
      Top             =   135
      Width           =   6225
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   0
      X1              =   120
      X2              =   6240
      Y1              =   4065
      Y2              =   4065
   End
   Begin VB.Label lblVersion 
      Alignment       =   2  'Center
      Caption         =   "                                "
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   75
      TabIndex        =   5
      Top             =   585
      Width           =   6180
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' 

' 

'





Option Explicit






Private Sub cmdOK_Click()

On Error Resume Next

  Me.Hide
    
' 1.19 called from frmEmulation also...
' so only hide!
' frmMain.SetFocus

End Sub


Private Sub cmdRegister_Click()

On Error Resume Next

    ' 2007-10-29
    If bNO_UNLOCK Then
        open_HTML_FILE Me, gRegFILE
    Else
        frmRegister.Show vbModal, Me
    End If
    
        'show_Registered_To
End Sub

Private Sub Form_Load()

On Error Resume Next


   If Load_from_Lang_File(Me) Then Exit Sub
    
    ' 01-aug-2003
    lblURL.Caption = sABOUT_URL
    

    lblVersion.Caption = "version " & App.Major & "." & App.Minor & App.Revision & sVER_SFX
    lblTitle.Caption = App.Title
    
    Me.Icon = frmMain.Icon 'yur
     
     
    ' 2007-10-29
    If bNO_UNLOCK Then
        cmdRegister.Caption = "CLICK HERE TO BUY THIS SOFTWARE..."
    End If
    
     

    show_Registered_To
    
    

    
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    If lblURL.FontUnderline Then lblURL.FontUnderline = False
    ' If lblEmail.FontUnderline Then lblEmail.FontUnderline = False
End Sub


Private Sub imgDonation_Click()
On Error Resume Next

  open_HTML_FILE Me, "http://www.emu8086.com/dr/donation.html", True

End Sub



Private Sub lblEmail_Click()
On Error GoTo err1
        Call ShellExecute(Me.hwnd, "open", "mailto:" & sABOUT_EMAIL, "", App.Path, SW_SHOWDEFAULT)
        Exit Sub
err1:
        Debug.Print "lblemail: " & LCase(err.Description)
End Sub


Private Sub Label1_Click()

End Sub

'
'Private Sub lblEmail_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'   ' If Not lblEmail.FontUnderline Then lblEmail.FontUnderline = True
'End Sub

Private Sub lblURL_Click()
On Error Resume Next
' simpllle2005-04-20 '  StartNewBrowser (sABOUT_URL)
open_HTML_FILE Me, "http://" & sABOUT_URL, True

End Sub

Private Sub lblURL_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    If Not lblURL.FontUnderline Then lblURL.FontUnderline = True
End Sub


'
'
Private Sub Form_Activate()

On Error Resume Next

    ' 1.23#252
    ' in case font is not as original, make sure
    ' the size of the labels will become regular
    ' before user moves mouse over:
    
    lblURL.FontUnderline = True
   ' lblEmail.FontUnderline = True
    
    lblURL.FontUnderline = False
   ' lblEmail.FontUnderline = False
    
    lblRegNow.Visible = bFOR_REGNOW ' show a littler dot in the left bottom corner.
    

    ' 4.00b15
    If lblLicNumber.Caption = "" Then
        lblUserName.Top = cmdRegister.Top + (cmdRegister.Height - lblUserName.Height)
    End If
    
    
End Sub



Public Sub show_Registered_To()

On Error Resume Next

    If bREGISTERED Then

        lblUserName.Caption = sUSER_NAME
        
        
        If iLICENSE_COUNT = 200 Then
            lblLicNumber.Caption = cMT("Site License")
        ElseIf iLICENSE_COUNT = 60 Then
            lblLicNumber.Caption = cMT("1 Year Site License")
        Else
            lblLicNumber.Caption = ""
        End If

        
        lblUserName.Visible = True
        lblLicNumber.Visible = True
        
        frmAbout.cmdRegister.Visible = False
        
        
    Else
    
        ' #327xl-softpass#
        If bSOFTWARE_PASSPORT Then
            Frame1.Visible = False
            cmdOK.Top = Frame1.Top + 50
            Me.Height = 4395 - Frame1.Height
        End If
            
        
    End If

End Sub
