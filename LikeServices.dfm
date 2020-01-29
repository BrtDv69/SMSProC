inherited frmLikeServices: TfrmLikeServices
  Left = 46
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1081' '#1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1093' '#1057#1077#1088#1074#1080#1089#1086#1074
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 545
    inherited Panel1: TPanel
      Width = 545
      inherited Label339: TLabel
        Width = 545
      end
      inherited dbmComments: TcxDBMemo
        Width = 545
      end
    end
    inherited cxSplitter1: TcxSplitter
      Width = 545
    end
    inherited Panel3: TPanel
      Width = 545
      inherited grdMainList: TcxGrid
        Width = 545
        inherited tvMainList: TcxGridDBTableView
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
        end
      end
    end
  end
  object splServices: TcxSplitter [1]
    Left = 545
    Top = 0
    Width = 8
    Height = 449
    Hint = #1042#1080#1082#1090#1086#1088#1080#1085#1099
    HotZoneClassName = 'TcxMediaPlayer9Style'
    AlignSplitter = salRight
    ResizeUpdate = True
    Control = grdMainServices
  end
  object grdMainServices: TcxGrid [2]
    Left = 553
    Top = 0
    Width = 131
    Height = 449
    Align = alRight
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object tvMainServices: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.KeyFieldNames = 'ID'
      DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.DataRowSizing = True
      OptionsCustomize.GroupRowSizing = True
      OptionsData.Appending = True
      OptionsSelection.InvertSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.HeaderEndEllipsis = True
      Styles.StyleSheet = frmDM.cxGridTableViewStyleSheet1
    end
    object lvMainServices: TcxGridLevel
      GridView = tvMainServices
    end
  end
  inherited dxBarManager1: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Custom 1'
        DockedDockingStyle = dsRight
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsRight
        FloatLeft = 76
        FloatTop = 229
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = sbFirst
            Visible = True
          end
          item
            Item = sbPrior
            Visible = True
          end
          item
            Item = sbNext
            Visible = True
          end
          item
            Item = sbLast
            Visible = True
          end
          item
            BeginGroup = True
            Item = sbAdd
            Visible = True
          end
          item
            Item = sbDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = sbRefresh
            Visible = True
          end
          item
            Item = sbFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = sbApply
            Visible = True
          end
          item
            Item = sbCancel
            Visible = True
          end
          item
            BeginGroup = True
            Item = sbClose
            Visible = True
          end>
        Name = 'Custom 11'
        NotDocking = [dsNone, dsLeft]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      27
      0
      0)
  end
end
