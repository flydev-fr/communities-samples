object MainForm: TMainForm
  Left = 320
  Top = 150
  Caption = 'Sample 01 - Http Client Server Firebird'
  ClientHeight = 306
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    394
    306)
  TextHeight = 16
  object LabelEdit: TLabel
    Left = 8
    Top = 24
    Width = 26
    Height = 16
    Caption = 'Title'
    FocusControl = TitleEdit
  end
  object LabelTime: TLabel
    Left = 8
    Top = 234
    Width = 378
    Height = 16
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 235
    ExplicitWidth = 382
  end
  object TitleEdit: TEdit
    Left = 8
    Top = 46
    Width = 225
    Height = 24
    TabOrder = 0
    TextHint = 'node title'
  end
  object ButtonFind: TButton
    Left = 260
    Top = 45
    Width = 126
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Find'
    TabOrder = 1
    OnClick = ButtonFindClick
  end
  object ContentMemo: TMemo
    Left = 8
    Top = 76
    Width = 378
    Height = 152
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
  object ButtonAdd: TButton
    Left = 8
    Top = 276
    Width = 121
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Add Note'
    TabOrder = 3
    OnClick = ButtonAddClick
  end
  object ButtonQuit: TButton
    Left = 311
    Top = 276
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Quit'
    TabOrder = 4
    OnClick = ButtonQuitClick
  end
  object ButtonDelete: TButton
    Left = 148
    Top = 277
    Width = 65
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Delete'
    TabOrder = 5
    OnClick = ButtonDeleteClick
  end
end
