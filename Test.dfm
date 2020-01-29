object frmTest: TfrmTest
  Left = 279
  Top = 134
  Width = 646
  Height = 411
  Caption = 'frmTest'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 109
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 95
      Top = 12
      Width = 30
      Height = 13
      Caption = #1057#1086#1082#1077#1090
    end
    object Label2: TLabel
      Left = 64
      Top = 30
      Width = 61
      Height = 13
      Caption = #8470' '#1072#1073#1086#1085#1077#1085#1090#1072
    end
    object Label3: TLabel
      Left = 17
      Top = 48
      Width = 108
      Height = 13
      Caption = #8470' '#1090#1077#1083#1077#1092#1086#1085#1072' '#1089#1077#1088#1074#1080#1089#1072
    end
    object Label4: TLabel
      Left = 176
      Top = 66
      Width = 90
      Height = 13
      Caption = #1058#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
    end
    object Label5: TLabel
      Left = 13
      Top = 66
      Width = 112
      Height = 13
      Caption = #1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077' '#1089#1077#1088#1074#1080#1089#1072
    end
    object edPhoneNumber: TcxTextEdit
      Left = 130
      Top = 26
      Properties.MaxLength = 20
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 145
    end
    object edMessage: TcxTextEdit
      Left = 271
      Top = 62
      Properties.MaxLength = 160
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 145
    end
    object cbSocket: TcxLookupComboBox
      Left = 130
      Top = 8
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NUMBER_OPERATOR_NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsSockets
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 145
    end
    object cxButton1: TcxButton
      Left = 132
      Top = 83
      Width = 75
      Height = 17
      Caption = '"'#1055#1086#1089#1083#1072#1090#1100'"'
      TabOrder = 3
      OnClick = cxButton1Click
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
    end
    object edServicePhoneNumber: TcxTextEdit
      Left = 130
      Top = 44
      Properties.MaxLength = 20
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Width = 145
    end
    object edServiceShortName: TcxTextEdit
      Left = 130
      Top = 62
      Properties.MaxLength = 1
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Width = 41
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 109
    Width = 638
    Height = 275
    Align = alClient
    TabOrder = 1
    object grdMainList: TcxGrid
      Left = 300
      Top = 1
      Width = 337
      Height = 273
      Align = alRight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object tvMainList: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsOutSMSHistory
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
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.HeaderEndEllipsis = True
        OptionsView.Indicator = True
        Styles.StyleSheet = frmDM.cxGridTableViewStyleSheet1
        object tvMainListSMS_SENT_TIMESTAMP: TcxGridDBColumn
          DataBinding.FieldName = 'SMS_SENT_TIMESTAMP'
          Width = 93
        end
        object tvMainListPHONE_NUMBER: TcxGridDBColumn
          DataBinding.FieldName = 'PHONE_NUMBER'
          Width = 95
        end
        object tvMainListSERVICE_DESCRIPTION: TcxGridDBColumn
          DataBinding.FieldName = 'SERVICE_DESCRIPTION'
          Width = 129
        end
        object tvMainListMSG: TcxGridDBColumn
          DataBinding.FieldName = 'MSG'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 230
        end
      end
      object lvMainList: TcxGridLevel
        GridView = tvMainList
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 292
      Top = 1
      Width = 8
      Height = 273
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.Visible = False
      AlignSplitter = salRight
      ResizeUpdate = True
      Control = grdMainList
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 291
      Height = 273
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object cxGridDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsInSMSHistory
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
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellEndEllipsis = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.HeaderEndEllipsis = True
        OptionsView.Indicator = True
        Styles.StyleSheet = frmDM.cxGridTableViewStyleSheet1
        object cxGridDBTableView1SMS_TIMESTAMP: TcxGridDBColumn
          DataBinding.FieldName = 'SMS_TIMESTAMP'
        end
        object cxGridDBTableView1PHONE_NUMBER: TcxGridDBColumn
          DataBinding.FieldName = 'PHONE_NUMBER'
          Width = 95
        end
        object cxGridDBTableView1SERVICE_DESCRIPTION: TcxGridDBColumn
          DataBinding.FieldName = 'SERVICE_DESCRIPTION'
          Width = 120
        end
        object cxGridDBTableView1MSG: TcxGridDBColumn
          DataBinding.FieldName = 'MSG'
          Width = 150
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object trMain: TpFIBTransaction
    DefaultDatabase = frmDM.dbMain
    TimeoutAction = TARollback
    Left = 40
    Top = 32
  end
  object fibdsSockets: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'SELECT S.ID, S.NUMBER, O.NAME OPERATOR_NAME'
      'FROM L_SOCKETS S, L_OPERATORS O'
      'where (O.ID=S.OPERATOR_ID)'
      'order by 3')
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.UpdateOnlyModifiedFields = True
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoUpdateOptions.AutoParamsToFields = True
    OnCalcFields = fibdsSocketsCalcFields
    Transaction = trMain
    Database = frmDM.dbMain
    SQLScreenCursor = crSQLWait
    Left = 40
    Top = 61
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
    object fibdsSocketsID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsSocketsNUMBER: TFIBIntegerField
      FieldName = 'NUMBER'
    end
    object fibdsSocketsOPERATOR_NAME: TFIBStringField
      FieldName = 'OPERATOR_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object fibdsSocketsNUMBER_OPERATOR_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'NUMBER_OPERATOR_NAME'
      Size = 100
      Calculated = True
    end
  end
  object dsSockets: TDataSource
    DataSet = fibdsSockets
    Left = 40
    Top = 90
  end
  object fibdsInSMSHistory: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      
        'SELECT H.ID,H.SMS_TIMESTAMP,H.PHONE_NUMBER,S.SERVICE_DESCRIPTION' +
        ',H.MSG'
      'FROM IN_SMS_HISTORY H, SERVICES S'
      'where (S.ID=H.SERVICE_ID)'
      'order by 1')
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.UpdateOnlyModifiedFields = True
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoUpdateOptions.AutoParamsToFields = True
    Transaction = trMain
    Database = frmDM.dbMain
    SQLScreenCursor = crSQLWait
    Left = 40
    Top = 119
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
    object fibdsInSMSHistoryID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsInSMSHistorySMS_TIMESTAMP: TFIBDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1088#1080#1093#1086#1076#1072' '#1057#1052#1057
      FieldName = 'SMS_TIMESTAMP'
      DisplayFormat = 'dd.mm.yyyy hh:nn:ss'
    end
    object fibdsInSMSHistoryPHONE_NUMBER: TFIBStringField
      DisplayLabel = #8470' '#1072#1073#1086#1085#1077#1085#1090#1072
      FieldName = 'PHONE_NUMBER'
      EmptyStrToNull = True
    end
    object fibdsInSMSHistorySERVICE_DESCRIPTION: TFIBStringField
      DisplayLabel = #1057#1077#1088#1074#1080#1089
      FieldName = 'SERVICE_DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
    object fibdsInSMSHistoryMSG: TFIBStringField
      DisplayLabel = #1057#1086#1086#1073#1097#1077#1085#1080#1077' '#1072#1073#1086#1085#1077#1085#1090#1072
      FieldName = 'MSG'
      Size = 160
      EmptyStrToNull = True
    end
  end
  object dsInSMSHistory: TDataSource
    DataSet = fibdsInSMSHistory
    Left = 40
    Top = 148
  end
  object fibdsOutSMSHistory: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      
        'SELECT H.ID,H.SMS_SENT_TIMESTAMP,H.PHONE_NUMBER,S.SERVICE_DESCRI' +
        'PTION,H.MSG'
      'FROM OUT_SMS_HISTORY H, SERVICES S'
      'where (S.ID=H.SERVICE_ID)'
      'order by 1')
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.UpdateOnlyModifiedFields = True
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoUpdateOptions.AutoParamsToFields = True
    Transaction = trMain
    Database = frmDM.dbMain
    SQLScreenCursor = crSQLWait
    Left = 71
    Top = 119
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
    object fibdsOutSMSHistoryID: TFIBBCDField
      FieldName = 'ID'
      Size = 0
      RoundByScale = True
    end
    object fibdsOutSMSHistorySMS_SENT_TIMESTAMP: TFIBDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      FieldName = 'SMS_SENT_TIMESTAMP'
      DisplayFormat = 'dd.mm.yyyy hh:nn:ss'
    end
    object fibdsOutSMSHistoryPHONE_NUMBER: TFIBStringField
      DisplayLabel = #8470' '#1072#1073#1086#1085#1077#1085#1090#1072
      FieldName = 'PHONE_NUMBER'
      EmptyStrToNull = True
    end
    object fibdsOutSMSHistorySERVICE_DESCRIPTION: TFIBStringField
      DisplayLabel = #1057#1077#1088#1074#1080#1089
      FieldName = 'SERVICE_DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
    object fibdsOutSMSHistoryMSG: TFIBStringField
      DisplayLabel = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      FieldName = 'MSG'
      Size = 2240
      EmptyStrToNull = True
    end
  end
  object dsOutSMSHistory: TDataSource
    DataSet = fibdsOutSMSHistory
    Left = 71
    Top = 148
  end
end
