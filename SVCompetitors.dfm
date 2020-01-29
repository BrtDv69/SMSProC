inherited frmSVCompetitors: TfrmSVCompetitors
  Left = 42
  Top = 124
  Caption = #1059#1095#1072#1089#1090#1085#1080#1082#1080' '#1042#1080#1082#1090#1086#1088#1080#1085
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel1: TPanel
      OnResize = Panel1Resize
      inherited Label339: TLabel
        Caption = #1058#1077#1082#1089#1090' '#1057#1052#1057':'
      end
      inherited dbmComments: TcxDBMemo
        Top = 48
        Align = alBottom
        DataBinding.DataField = ''
        DataBinding.DataSource = nil
        Visible = False
        Height = 11
      end
      object btnSend: TcxButton
        Left = 523
        Top = 0
        Width = 75
        Height = 16
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
        Default = True
        TabOrder = 1
        OnClick = btnSendClick
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
      end
      object btnCancel: TcxButton
        Left = 607
        Top = 0
        Width = 75
        Height = 16
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Cancel = True
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 2
        OnClick = btnCancelClick
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
      end
      object mSMS: TcxMemo
        Left = 0
        Top = 16
        Align = alClient
        Properties.MaxLength = 2240
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 3
        Height = 32
        Width = 684
      end
    end
    inherited cxSplitter1: TcxSplitter
      Hint = #1055#1086#1089#1083#1072#1090#1100' '#1057#1052#1057
      OnAfterOpen = cxSplitter1AfterOpen
      OnAfterClose = cxSplitter1AfterClose
    end
    inherited Panel3: TPanel
      inherited grdMainList: TcxGrid
        inherited tvMainList: TcxGridDBTableView
          OnSelectionChanged = tvMainListSelectionChanged
          DataController.DataSource = dsMainList
          OptionsData.Appending = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellEndEllipsis = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
          object tvMainListSERVICE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SERVICE_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.DropDownSizeable = True
            Properties.DropDownWidth = 10
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'SERVICE_DESCRIPTION'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsServices
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 122
          end
          object tvMainListPHONE_NUMBER: TcxGridDBColumn
            DataBinding.FieldName = 'PHONE_NUMBER'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 116
          end
          object tvMainListOPERATOR_ID: TcxGridDBColumn
            DataBinding.FieldName = 'OPERATOR_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'NAME'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsOperators
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 116
          end
          object tvMainListREGISTRATION_DATE: TcxGridDBColumn
            DataBinding.FieldName = 'REGISTRATION_DATE'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 88
          end
          object tvMainListSMS_COUNT: TcxGridDBColumn
            DataBinding.FieldName = 'SMS_COUNT'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 119
          end
          object tvMainListLAST_QUESTION_TIMESTAMP: TcxGridDBColumn
            DataBinding.FieldName = 'LAST_QUESTION_TIMESTAMP'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 109
          end
        end
      end
    end
  end
  inherited fibdsMainList: TpFIBDataSet
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select C.ID, C.SERVICE_ID, C.PHONE_NUMBER, C.OPERATOR_ID, C.REGI' +
        'STRATION_DATE,'
      'C.SMS_COUNT, C.LAST_QUESTION_TIMESTAMP'
      'from CUSTOMERS C, SERVICES S'
      'where (S.ID=C.SERVICE_ID) and (S.SERVICE_KIND=2)')
    AutoUpdateOptions.AutoReWriteSqls = False
    AutoUpdateOptions.CanChangeSQLs = False
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.UpdateOnlyModifiedFields = False
    AutoUpdateOptions.WhenGetGenID = wgNever
    AutoUpdateOptions.AutoParamsToFields = False
    AllowedUpdateKinds = []
    object fibdsMainListID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsMainListSERVICE_ID: TFIBIntegerField
      DisplayLabel = #1042#1080#1082#1090#1086#1088#1080#1085#1072
      FieldName = 'SERVICE_ID'
    end
    object fibdsMainListPHONE_NUMBER: TFIBStringField
      DisplayLabel = #8470' '#1090#1077#1083#1077#1092#1086#1085#1072
      FieldName = 'PHONE_NUMBER'
      EmptyStrToNull = True
    end
    object fibdsMainListOPERATOR_ID: TFIBIntegerField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = 'OPERATOR_ID'
    end
    object fibdsMainListREGISTRATION_DATE: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      FieldName = 'REGISTRATION_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object fibdsMainListSMS_COUNT: TFIBIntegerField
      DisplayLabel = #1063#1080#1089#1083#1086' '#1057#1052#1057
      FieldName = 'SMS_COUNT'
    end
    object fibdsMainListLAST_QUESTION_TIMESTAMP: TFIBDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1074#1086#1087#1088#1086#1089#1072
      FieldName = 'LAST_QUESTION_TIMESTAMP'
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
    inherited sbAdd: TdxBarButton
      Visible = ivNever
    end
    inherited sbDelete: TdxBarButton
      Visible = ivNever
    end
    inherited sbApply: TdxBarButton
      Visible = ivNever
    end
    inherited sbCancel: TdxBarButton
      Visible = ivNever
    end
    object sbSendSMS: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = #1055#1086#1089#1083#1072#1090#1100' '#1057#1052#1057' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1084' '#1091#1095#1072#1089#1090#1085#1080#1082#1072#1084
      Visible = ivAlways
    end
  end
  object fibdsServices: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    S.ID,'
      '    S.SERVICE_DESCRIPTION,'
      '    S.VALID'
      'FROM'
      '    SERVICES S'
      'where (S.SERVICE_KIND=2)'
      'order by 2, 3 desc')
    AfterDelete = fibdsMainListAfterDelete
    AllowedUpdateKinds = []
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
    object fibdsServicesID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsServicesSERVICE_DESCRIPTION: TFIBStringField
      DisplayLabel = #1042#1080#1082#1090#1086#1088#1080#1085#1072
      FieldName = 'SERVICE_DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
    object fibdsServicesVALID: TFIBIntegerField
      FieldName = 'VALID'
    end
  end
  object dsServices: TDataSource
    DataSet = fibdsServices
    OnStateChange = dsMainListStateChange
    Left = 40
    Top = 148
  end
  object fibdsOperators: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    O.ID,'
      '    O.NAME'
      'FROM'
      '    L_OPERATORS O'
      'order by 2')
    AfterDelete = fibdsMainListAfterDelete
    AllowedUpdateKinds = []
    Transaction = trMain
    Database = frmDM.dbMain
    SQLScreenCursor = crSQLWait
    Left = 40
    Top = 177
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
    object fibdsOperatorsID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsOperatorsNAME: TFIBStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object dsOperators: TDataSource
    DataSet = fibdsOperators
    OnStateChange = dsMainListStateChange
    Left = 40
    Top = 206
  end
end
