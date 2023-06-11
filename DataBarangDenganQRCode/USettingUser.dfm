object FUser: TFUser
  Left = 397
  Top = 182
  Width = 799
  Height = 441
  BorderIcons = [biSystemMenu]
  Caption = 'SETTING USERS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 402
    Align = alClient
    Color = 4923684
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 373
      Height = 38
      Caption = 'FORM SETTING USERS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -33
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 192
      Top = 84
      Width = 64
      Height = 16
      Caption = 'Username'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 506
      Top = 84
      Width = 61
      Height = 16
      Caption = 'Password'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 385
      Top = 29
      Width = 84
      Height = 29
      Cursor = crHandPoint
      Caption = 'Add Data'
      Color = 9519176
      TabOrder = 0
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      Left = 477
      Top = 29
      Width = 84
      Height = 29
      Cursor = crHandPoint
      Caption = 'Delete'
      Color = 9519176
      TabOrder = 1
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 567
      Top = 29
      Width = 84
      Height = 29
      Cursor = crHandPoint
      Caption = 'Reset'
      Color = 9519176
      TabOrder = 2
      OnClick = Panel4Click
    end
    object Panel5: TPanel
      Left = 684
      Top = 29
      Width = 84
      Height = 29
      Cursor = crHandPoint
      Caption = 'Close'
      Color = 9519176
      TabOrder = 3
      OnClick = Panel5Click
    end
    object Panel6: TPanel
      Left = 10
      Top = 63
      Width = 759
      Height = 5
      Color = clWhite
      TabOrder = 4
    end
    object Edit1: TEdit
      Left = 122
      Top = 106
      Width = 228
      Height = 24
      BevelInner = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210752
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object Edit3: TEdit
      Left = 417
      Top = 105
      Width = 228
      Height = 24
      BevelInner = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210752
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 72
      Top = 139
      Width = 633
      Height = 65
      Caption = 'Pencarian Berdasarkan Username : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object Edit2: TEdit
        Left = 26
        Top = 26
        Width = 575
        Height = 24
        BevelInner = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = Edit2Change
      end
    end
    object DBGrid1: TDBGrid
      Left = 72
      Top = 209
      Width = 633
      Height = 145
      Color = clWhite
      DataSource = DM.DSLogin
      FixedColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 8
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -13
      TitleFont.Name = 'Roboto'
      TitleFont.Style = [fsBold]
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'username'
          Title.Alignment = taCenter
          Title.Caption = 'USERNAME'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -13
          Title.Font.Name = 'Roboto'
          Title.Font.Style = [fsBold]
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'password'
          Title.Alignment = taCenter
          Title.Caption = 'PASSWORD'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -13
          Title.Font.Name = 'Roboto'
          Title.Font.Style = [fsBold]
          Width = 300
          Visible = True
        end>
    end
  end
end
