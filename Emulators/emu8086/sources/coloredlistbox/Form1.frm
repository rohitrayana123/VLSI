VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Colored ListBox Control with Horizontal Scroll"
   ClientHeight    =   3525
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5865
   BeginProperty Font 
      Name            =   "Fixedsys"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3525
   ScaleWidth      =   5865
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text1 
      Height          =   1335
      Left            =   2685
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   7
      Text            =   "Form1.frx":030A
      Top             =   2145
      Width           =   2985
   End
   Begin VB.CommandButton cmdClearList 
      Caption         =   "Clear"
      Height          =   420
      Left            =   3210
      TabIndex        =   6
      Top             =   1200
      Width           =   2100
   End
   Begin VB.CommandButton cmdAddToList 
      Caption         =   "Add to List"
      Height          =   480
      Left            =   3240
      TabIndex        =   2
      Top             =   615
      Width           =   2025
   End
   Begin VB.TextBox txtData 
      Height          =   330
      Left            =   2955
      TabIndex        =   1
      Text            =   "\9Hello \CWorld! \2Hi!"
      Top             =   225
      Width           =   2745
   End
   Begin VB.PictureBox picList 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      Height          =   2715
      Left            =   120
      ScaleHeight     =   177
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   142
      TabIndex        =   0
      Top             =   105
      Width           =   2190
      Begin VB.HScrollBar scrollH 
         Height          =   270
         LargeChange     =   3
         Left            =   135
         Max             =   0
         TabIndex        =   5
         TabStop         =   0   'False
         Top             =   2310
         Width           =   1515
      End
      Begin VB.VScrollBar scrollV 
         Height          =   1785
         LargeChange     =   3
         Left            =   1725
         Max             =   0
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   135
         Width           =   285
      End
   End
   Begin VB.Label lblSelectInfo 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "                   "
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   3090
      TabIndex        =   3
      Top             =   1725
      Width           =   2340
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'    =======================================
'      Colored ListBox Control
'             with Horizontal Scroll
'
'      List box supports up to 16 colors!
'
'          Pure Visual Basic Code!
'
'       Version 1.00
'    =======================================
'
'    Visit my Homepage:
'    http://www.geocities.com/emu8086/vb/
'
'
'    Last Update: Friday, July 12, 2002
'
'
'    Copyright 2002 Alexander Popov Emulation Soft.
'               All rights reserved.
'        http://www.geocities.com/emu8086/


'=======================================
' SUPPORTED COLOR CODES:
'
'   0   Black
'   1   Blue
'   2   Green
'   3   Cyan
'   4   Red
'   5   Magenta
'   6   Yellow
'   7   White
'   8   Gray
'   9   Light Blue
'   A   Light Green
'   B   Light Cyan
'   C   Light Red
'   D   Light Magenta
'   E   Light Yellow
'   F   Bright White
'
'  To use color code add it just after
'  the "\" sign, for example:
'     \CHi
'  This will give the
'   word "Hi" a Light Red color.
'=======================================

Option Explicit

Option Base 0


' ===== list properties ============:
Dim strLIST() As String
Dim iListCount As Integer

Dim iTopIndex As Integer
Dim iListIndex As Integer

Dim iHorScrollVal As Integer

' visible area:
Dim iWorkingWidth As Integer
Dim iWorkingHeight As Integer

Dim iCharWidth As Integer
Dim iCharHeight As Integer

Const COLOR_DEFAULT = vbBlack
Const COLOR_SELECTOR = 9895935 ' RGB(255, 255, 150)
'=====================================







Private Sub picList_Resize()
    scrollH.Top = picList.ScaleHeight - scrollH.Height
    scrollH.Left = 0
    scrollH.Width = picList.ScaleWidth - scrollH.Height
    
    scrollV.Top = 0
    scrollV.Left = picList.ScaleWidth - scrollV.Width
    scrollV.Height = picList.ScaleHeight - scrollV.Width
    
    iWorkingWidth = picList.ScaleWidth - scrollH.Height
    iWorkingHeight = picList.ScaleHeight - scrollV.Width
    
    draw_BOX
End Sub


Private Sub txtData_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
        cmdAddToList_Click
    End If
End Sub

Private Sub cmdAddToList_Click()
    AddItem txtData.Text
End Sub


Private Sub Form_Load()
    Me.Caption = Me.Caption & " v." & App.Major & "." & App.Minor & "." & App.Revision
    clearList
End Sub

Private Sub clearList()

    Erase strLIST
    
    iListCount = 0
    
    iTopIndex = 0
    
    iListIndex = -1
    
    lblSelectInfo.Caption = "                   "
    
    scrollV.Max = 0
    
    scrollH.Max = 0
    
    picList_Resize
    
    updateList
    
    
    ' Assumed that we are using fixed font:
    iCharWidth = picList.TextWidth("W")
    iCharHeight = picList.TextHeight("W")
    
End Sub

Private Sub AddItem(sItem As String)
Dim iTW As Integer
Dim iSC As Integer
Dim sTEMP As String
Dim i As Integer

    ReDim Preserve strLIST(0 To iListCount)
    
    strLIST(iListCount) = sItem
    
    iListCount = iListCount + 1

    scrollV.Max = iListCount

    sTEMP = remove_ALL_COLOR_DATA(sItem)

    iTW = picList.TextWidth(sTEMP)
    
    If iWorkingWidth < iTW Then
    
        iSC = iTW - iWorkingWidth
                
        i = iSC / iCharWidth
        
        If (iSC Mod iCharWidth) > 0 Then iSC = 1  ' remainder converted to full char.

        iSC = iSC + i

        If iSC > scrollH.Max Then
            scrollH.Max = iSC
        End If
        
    End If

    updateList
    
End Sub

Private Sub updateList()
Dim i As Integer
Dim s As String

    picList.Cls
    
    For i = iTopIndex To iListCount - 1
    
        s = strLIST(i)
        
        picList.CurrentX = -iHorScrollVal * iCharWidth
        
        ' for some reason, the horizontal scroll doesn't do
        ' its work nice without it:
        If iHorScrollVal > 0 Then
            picList.CurrentX = picList.CurrentX - iCharWidth
        End If
        
        If i = iListIndex Then
            draw_SELECTOR
        End If
        
        print_in_COLOR s
    
        ' no need to print items that aren't visible:
        If picList.CurrentY > iWorkingHeight Then
            ' Debug.Print "stopped at: " & strLIST(i)
            Exit For
        End If
    
    Next i

    draw_BOX
    
End Sub

Private Sub print_in_COLOR(sExpr As String)

Dim l As Long
Dim lExprLen As Long
Dim s As String
Dim c As String

lExprLen = Len(sExpr)

s = ""
l = 1  ' string starts at index 1.

picList.ForeColor = COLOR_DEFAULT

Do While l <= lExprLen

    c = Mid(sExpr, l, 1)
    
    If c = "\" Then
        
        If Len(s) > 0 Then
            picList.Print s;
            s = ""
        End If
        
        
        l = l + 1
        c = Mid(sExpr, l, 1) ' get color code.
        
        If c = "\" Then
            picList.Print "\";
        Else
            picList.ForeColor = QBColor(Val("&H" & c))
        End If
        
    Else
    
        s = s & c
        
    End If

    l = l + 1
    
Loop

If Len(s) > 0 Then
    picList.Print s
Else
    picList.Print   ' just new line.
End If

End Sub


' this function parses the string the same way as
' print_in_COLOR() does, and returns string without any
' controlling characters:
Private Function remove_ALL_COLOR_DATA(sExpr As String) As String

Dim l As Long
Dim lExprLen As Long
Dim s As String
Dim c As String
Dim sRESULT As String

lExprLen = Len(sExpr)

sRESULT = ""
s = ""
l = 1  ' string starts at index 1.

picList.ForeColor = COLOR_DEFAULT

Do While l <= lExprLen

    c = Mid(sExpr, l, 1)
    
    If c = "\" Then
        
        If Len(s) > 0 Then
            sRESULT = sRESULT & s
            s = ""
        End If
        
        l = l + 1
        
        c = Mid(sExpr, l, 1) ' get color code.
        
        If c = "\" Then
            sRESULT = sRESULT & "\"
        End If
        
    Else
    
        s = s & c
        
    End If

    l = l + 1
    
Loop

If Len(s) > 0 Then sRESULT = sRESULT & s


remove_ALL_COLOR_DATA = sRESULT

End Function



Private Sub scrollH_Change()
    scrollH_Scroll
End Sub

Private Sub scrollH_Scroll()
    iHorScrollVal = scrollH.Value
    updateList
End Sub

Private Sub scrollV_Change()
    scrollV_Scroll
End Sub

Private Sub scrollV_Scroll()
    iTopIndex = scrollV.Value
    updateList
End Sub




Private Sub picList_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim iTEMP As Integer

iTEMP = Fix(Y / iCharHeight)

iTEMP = iTEMP + iTopIndex

If iTEMP < iListCount Then

    iListIndex = iTEMP

    lblSelectInfo.Caption = " Selected Item: " & iListIndex & " "
    
    updateList
    
End If

End Sub

' selection also works when mouse is moving while
' left button is pressed:
Private Sub picList_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = vbLeftButton Then
        picList_MouseDown Button, Shift, X, Y
    End If
End Sub

' Draws little box in the right
' lower corner between scroll bars:
Private Sub draw_BOX()
    picList.Line (scrollH.Width, scrollV.Height)-(picList.ScaleWidth, picList.ScaleHeight), vb3DFace, BF
End Sub

' Draws item selector of selected
' list item:
Private Sub draw_SELECTOR()
    Dim fORIG_cX As Single
    Dim fORIG_cY As Single
    
    ' remember original current X/Y:
    fORIG_cX = picList.CurrentX
    fORIG_cY = picList.CurrentY
    
    picList.Line (0, fORIG_cY)-(iWorkingWidth, fORIG_cY + iCharHeight), COLOR_SELECTOR, BF
    
    ' restore original current X/Y:
    picList.CurrentX = fORIG_cX
    picList.CurrentY = fORIG_cY
End Sub

Private Sub cmdClearList_Click()
    clearList
End Sub

