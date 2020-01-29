inherited frmSendedSMS: TfrmSendedSMS
  Left = 76
  Top = 193
  Caption = #1055#1086#1089#1083#1072#1085#1085#1099#1077' '#1080#1085#1090#1077#1088#1072#1082#1090#1080#1074#1085#1099#1077' '#1057#1052#1057
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel1: TPanel
      Visible = False
      inherited dbmComments: TcxDBMemo
        DataBinding.DataField = ''
        DataBinding.DataSource = nil
      end
    end
    inherited cxSplitter1: TcxSplitter
      Visible = False
    end
    inherited Panel3: TPanel
      inherited grdMainList: TcxGrid
        inherited tvMainList: TcxGridDBTableView
          DataController.DataSource = dsMainList
          OptionsData.Appending = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellEndEllipsis = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.HeaderEndEllipsis = False
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
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
            Width = 133
          end
          object tvMainListSMS_TIMESTAMP: TcxGridDBColumn
            DataBinding.FieldName = 'SMS_TIMESTAMP'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 95
          end
          object tvMainListSMS_SENT_TIMESTAMP: TcxGridDBColumn
            DataBinding.FieldName = 'SMS_SENT_TIMESTAMP'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 105
          end
          object tvMainListPHONE_NUMBER: TcxGridDBColumn
            DataBinding.FieldName = 'PHONE_NUMBER'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 120
          end
          object tvMainListMSG: TcxGridDBColumn
            DataBinding.FieldName = 'MSG'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 217
          end
        end
      end
    end
  end
  inherited fibdsMainList: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select SH.ID, SH.OPERATOR_ID, SH.SMS_TIMESTAMP, SH.SMS_SENT_TIME' +
        'STAMP, SH.PHONE_NUMBER,'
      'SH.MSG'
      'from OUT_SMS_HISTORY SH'
      'where (SH.MSG_TYPE=2)')
    AutoUpdateOptions.AutoReWriteSqls = False
    AutoUpdateOptions.CanChangeSQLs = False
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.UpdateOnlyModifiedFields = False
    AutoUpdateOptions.WhenGetGenID = wgNever
    AutoUpdateOptions.AutoParamsToFields = False
    AllowedUpdateKinds = []
    object fibdsMainListID: TFIBBCDField
      FieldName = 'ID'
      Size = 0
      RoundByScale = True
    end
    object fibdsMainListOPERATOR_ID: TFIBIntegerField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = 'OPERATOR_ID'
    end
    object fibdsMainListSMS_TIMESTAMP: TFIBDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1075#1077#1085#1077#1088#1072#1094#1080#1080' '#1057#1052#1057
      FieldName = 'SMS_TIMESTAMP'
      DisplayFormat = 'dd.mm.yyyy hh:nn:ss'
    end
    object fibdsMainListSMS_SENT_TIMESTAMP: TFIBDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1057#1052#1057
      FieldName = 'SMS_SENT_TIMESTAMP'
      DisplayFormat = 'dd.mm.yyyy hh:nn:ss'
    end
    object fibdsMainListPHONE_NUMBER: TFIBStringField
      DisplayLabel = #8470' '#1090#1077#1083#1077#1092#1086#1085#1072
      FieldName = 'PHONE_NUMBER'
      EmptyStrToNull = True
    end
    object fibdsMainListMSG: TFIBStringField
      DisplayLabel = #1055#1086#1089#1083#1072#1085#1085#1086#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      FieldName = 'MSG'
      Size = 2240
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
    Top = 121
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
    Top = 150
  end
end
