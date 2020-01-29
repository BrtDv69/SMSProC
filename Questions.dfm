inherited frmQuestions: TfrmQuestions
  Left = 81
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1086#1087#1088#1086#1089#1086#1074'-'#1086#1090#1074#1077#1090#1086#1074' '#1042#1080#1082#1090#1086#1088#1080#1085
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel3: TPanel
      inherited grdMainList: TcxGrid
        Top = 38
        Height = 219
        OnEnter = grdMainListEnter
        inherited tvMainList: TcxGridDBTableView
          OnEditing = tvMainListEditing
          OnEditKeyPress = tvMainListEditKeyPress
          OnEditKeyUp = tvMainListEditKeyUp
          DataController.DataSource = dsMainList
          OptionsView.CellEndEllipsis = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          Preview.Column = tvMainListCOMMENTS
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
          object tvMainListQUESTION_NUMBER: TcxGridDBColumn
            DataBinding.FieldName = 'QUESTION_NUMBER'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 57
          end
          object tvMainListQUESTION: TcxGridDBColumn
            DataBinding.FieldName = 'QUESTION'
            OnGetDisplayText = tvMainListQUESTIONGetDisplayText
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 380
          end
          object tvMainListVALID: TcxGridDBColumn
            Caption = #1044#1077#1081#1089#1090#1074'.'
            DataBinding.FieldName = 'VALID'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1081
            Properties.DisplayUnchecked = #1053#1077' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1081
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortIndex = 0
            SortOrder = soDescending
            Width = 94
          end
          object tvMainListCOMMENTS: TcxGridDBColumn
            DataBinding.FieldName = 'COMMENTS'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
        end
      end
      object splAnswers: TcxSplitter
        Left = 0
        Top = 257
        Width = 545
        Height = 8
        Hint = #1054#1090#1074#1077#1090#1099
        HotZoneClassName = 'TcxMediaPlayer9Style'
        AlignSplitter = salBottom
        ResizeUpdate = True
        Control = grdMainAnswers
      end
      object grdMainAnswers: TcxGrid
        Left = 0
        Top = 265
        Width = 545
        Height = 117
        Align = alBottom
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnEnter = grdMainAnswersEnter
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object tvMainAnswers: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnEditing = tvMainAnswersEditing
          OnEditKeyPress = tvMainListEditKeyPress
          OnEditKeyUp = tvMainAnswersEditKeyUp
          OnFocusedRecordChanged = tvMainListFocusedRecordChanged
          DataController.DataSource = dsMainAnswers
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
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          OptionsCustomize.GroupRowSizing = True
          OptionsData.Appending = True
          OptionsSelection.InvertSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderEndEllipsis = True
          OptionsView.Indicator = True
          Preview.Column = tvMainAnswersCOMMENTS
          Styles.StyleSheet = frmDM.cxGridTableViewStyleSheet1
          object tvMainAnswersANSWER_USER_NAME: TcxGridDBColumn
            DataBinding.FieldName = 'ANSWER_USER_NAME'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortIndex = 0
            SortOrder = soAscending
            Width = 114
          end
          object tvMainAnswersANSWER: TcxGridDBColumn
            DataBinding.FieldName = 'ANSWER'
            OnGetDisplayText = tvMainAnswersANSWERGetDisplayText
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 274
          end
          object tvMainAnswersANSWER_RIGHTNESS: TcxGridDBColumn
            DataBinding.FieldName = 'ANSWER_RIGHTNESS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ImmediatePost = True
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 73
          end
          object tvMainAnswersCOMMENTS: TcxGridDBColumn
            DataBinding.FieldName = 'COMMENTS'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
        end
        object lvMainAnswers: TcxGridLevel
          GridView = tvMainAnswers
        end
      end
      object grdSize: TcxGrid
        Left = 0
        Top = 0
        Width = 545
        Height = 38
        Align = alTop
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object tvSize: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.Data = {
            700000000F00000044617461436F6E74726F6C6C657231030000001300000054
            6378496E746567657256616C75655479706513000000546378496E7465676572
            56616C75655479706513000000546378496E746567657256616C756554797065
            0100000000000000000000000000000000000000}
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = frmDM.cxGridTableViewStyleSheet1
          object tvSizeTotal: TcxGridColumn
            Caption = #1047#1085#1072#1082#1086#1074' '#1086#1089#1090#1072#1083#1086#1089#1100', '#1074#1089#1077#1075#1086
            DataBinding.ValueType = 'Integer'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object tvSizeQuestion: TcxGridColumn
            Caption = #1047#1085#1072#1082#1086#1074' '#1086#1089#1090#1072#1083#1086#1089#1100', '#1074' '#1074#1086#1087#1088#1086#1089#1077
            DataBinding.ValueType = 'Integer'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object tvSizeAnswer: TcxGridColumn
            Caption = #1047#1085#1072#1082#1086#1074' '#1086#1089#1090#1072#1083#1086#1089#1100', '#1074' '#1086#1090#1074#1077#1090#1077
            DataBinding.ValueType = 'Integer'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
        end
        object lvSize: TcxGridLevel
          GridView = tvSize
        end
      end
    end
  end
  inherited splServices: TcxSplitter
    Left = 572
  end
  inherited grdMainServices: TcxGrid
    Left = 580
    PopupMenu = PopupMenu1
    inherited tvMainServices: TcxGridDBTableView
      OnCellClick = tvMainServicesCellClick
      OnCustomDrawCell = tvMainServicesCustomDrawCell
      DataController.DataSource = dsQuestionServices
      DataController.KeyFieldNames = 'S_ID'
      OptionsBehavior.IncSearch = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Appending = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideSelection = True
      OptionsView.GridLines = glNone
      Styles.IncSearch = nil
      Styles.Selection = frmDM.cxIncSearch
      Styles.Header = nil
      Styles.Preview = nil
      object tvMainServicesS_DESCRIPTION: TcxGridDBColumn
        Caption = #1057#1077#1088#1074#1080#1089
        DataBinding.FieldName = 'S_DESCRIPTION'
      end
      object tvMainServicesS_ID: TcxGridDBColumn
        Caption = #1057#1077#1088#1074#1080#1089
        DataBinding.FieldName = 'S_ID'
        Visible = False
        Hidden = True
      end
      object tvMainServicesSERVICE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICE_ID'
        Visible = False
        Hidden = True
      end
    end
  end
  inherited fibdsMainList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    Q.ID,'
      '    Q.QUESTION_NUMBER,'
      '    Q.QUESTION,'
      '    Q.VALID,'
      '    Q.COMMENTS'
      'FROM'
      '    V_QUESTIONS Q'
      '@WHERE')
    AutoUpdateOptions.UpdateTableName = 'V_QUESTIONS'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_V_QUESTIONS_ID'
    BeforeDelete = fibdsMainListBeforeDelete
    BeforeScroll = fibdsMainListBeforeScroll
    object fibdsMainListID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsMainListQUESTION_NUMBER: TFIBIntegerField
      DisplayLabel = #8470#1087#1087
      FieldName = 'QUESTION_NUMBER'
    end
    object fibdsMainListQUESTION: TFIBStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
      FieldName = 'QUESTION'
      Size = 200
      EmptyStrToNull = True
    end
    object fibdsMainListVALID: TFIBIntegerField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086#1089#1090#1080
      FieldName = 'VALID'
    end
    object fibdsMainListCOMMENTS: TFIBStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
      FieldName = 'COMMENTS'
      Size = 100
      EmptyStrToNull = True
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
            Item = sbClone
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
    inherited sbApply: TdxBarButton
      OnClick = sbApplyClick
    end
    inherited sbCancel: TdxBarButton
      OnClick = sbCancelClick
    end
    object sbClone: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1076#1091#1073#1083#1080#1082#1072#1090' '#1074#1086#1087#1088#1086#1089#1072
      Visible = ivAlways
      ImageIndex = 12
      OnClick = sbCloneClick
    end
  end
  object fibdsMainAnswers: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'SELECT'
      '    A.ID,'
      '    A.QUESTION_ID,'
      '    A.ANSWER_USER_NAME,'
      '    A.ANSWER,'
      '    A.ANSWER_RIGHTNESS,'
      '    A.VALID,'
      '    A.COMMENTS'
      'FROM'
      '    V_ANSWERS A'
      'where (A.QUESTION_ID=:ID)')
    AutoUpdateOptions.UpdateTableName = 'V_ANSWERS'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_V_ANSWERS_ID'
    AutoUpdateOptions.UpdateOnlyModifiedFields = True
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoUpdateOptions.AutoParamsToFields = True
    AfterDelete = fibdsMainListAfterDelete
    BeforeDelete = fibdsMainAnswersBeforeDelete
    Transaction = trMain
    Database = frmDM.dbMain
    SQLScreenCursor = crSQLWait
    DataSource = dsMainList
    Left = 70
    Top = 61
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
    object fibdsMainAnswersID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsMainAnswersQUESTION_ID: TFIBIntegerField
      FieldName = 'QUESTION_ID'
    end
    object fibdsMainAnswersANSWER_USER_NAME: TFIBIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1086#1090#1074#1077#1090#1072
      FieldName = 'ANSWER_USER_NAME'
    end
    object fibdsMainAnswersANSWER: TFIBStringField
      DisplayLabel = #1054#1090#1074#1077#1090
      FieldName = 'ANSWER'
      Size = 40
      EmptyStrToNull = True
    end
    object fibdsMainAnswersANSWER_RIGHTNESS: TFIBIntegerField
      DisplayLabel = #1055#1088#1072#1074#1080#1083#1100#1085#1099#1081
      FieldName = 'ANSWER_RIGHTNESS'
    end
    object fibdsMainAnswersVALID: TFIBIntegerField
      DisplayLabel = #1044#1077#1081#1089#1090#1074'.'
      FieldName = 'VALID'
    end
    object fibdsMainAnswersCOMMENTS: TFIBStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
      FieldName = 'COMMENTS'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object dsMainAnswers: TDataSource
    DataSet = fibdsMainAnswers
    OnStateChange = dsMainListStateChange
    Left = 70
    Top = 90
  end
  object fibdsQuestionServices: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'SELECT'
      '    QS.ID,'
      '    QS.SERVICE_ID,'
      '    S.ID S_ID,'
      '    S.SERVICE_DESCRIPTION S_DESCRIPTION,'
      '    QS.QUESTION_ID'
      'FROM SERVICES S left outer join V_QUESTION_SERVICES QS on'
      '(QS.SERVICE_ID=S.ID) and (QS.QUESTION_ID=:ID)'
      'where (S.VALID=1) and (S.SERVICE_KIND=2)'
      'order by 4')
    OnUpdateRecord = fibdsQuestionServicesUpdateRecord
    AfterDelete = fibdsMainListAfterDelete
    AllowedUpdateKinds = [ukModify]
    Transaction = trMain
    Database = frmDM.dbMain
    SQLScreenCursor = crSQLWait
    DataSource = dsMainList
    Left = 100
    Top = 61
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
    object fibdsQuestionServicesID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsQuestionServicesSERVICE_ID: TFIBIntegerField
      DisplayLabel = #1057#1077#1088#1074#1080#1089
      FieldName = 'SERVICE_ID'
    end
    object fibdsQuestionServicesS_ID: TFIBIntegerField
      FieldName = 'S_ID'
    end
    object fibdsQuestionServicesQUESTION_ID: TFIBIntegerField
      FieldName = 'QUESTION_ID'
    end
    object fibdsQuestionServicesS_DESCRIPTION: TFIBStringField
      FieldName = 'S_DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
  end
  object dsQuestionServices: TDataSource
    DataSet = fibdsQuestionServices
    OnStateChange = dsMainListStateChange
    Left = 100
    Top = 90
  end
  object PopupMenu1: TPopupMenu
    Left = 648
    Top = 168
    object N1: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1087#1086' '#1042#1080#1082#1090#1086#1088#1080#1085#1072#1084
      OnClick = N1Click
    end
  end
end
