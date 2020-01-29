inherited frmTemplates: TfrmTemplates
  Left = 71
  Top = 115
  Caption = #1064#1072#1073#1083#1086#1085#1099' '#1057#1052#1057' '#1042#1080#1082#1090#1086#1088#1080#1085
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel3: TPanel
      inherited grdMainList: TcxGrid
        inherited tvMainList: TcxGridDBTableView
          DataController.DataSource = dsMainList
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnsQuickCustomization = False
          OptionsView.CellEndEllipsis = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          Preview.Column = tvMainListCOMMENTS
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
          object tvMainListSERVICE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SERVICE_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
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
            Width = 154
          end
          object tvMainListPREV_MSG: TcxGridDBColumn
            DataBinding.FieldName = 'PREV_MSG'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 182
          end
          object tvMainListNEXT_MSG: TcxGridDBColumn
            DataBinding.FieldName = 'NEXT_MSG'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 160
          end
          object tvMainListPRIZE_MSG: TcxGridDBColumn
            DataBinding.FieldName = 'PRIZE_MSG'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 174
          end
          object tvMainListCOMMENTS: TcxGridDBColumn
            DataBinding.FieldName = 'COMMENTS'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
        end
      end
    end
  end
  inherited fibdsMainList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    T.ID,'
      '    T.SERVICE_ID,'
      '    T.PREV_MSG,'
      '    T.NEXT_MSG,'
      '    T.PRIZE_MSG,'
      '    T.COMMENTS'
      'FROM'
      '    V_TEMPLETS T')
    AutoUpdateOptions.UpdateTableName = 'V_TEMPLETS'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_V_TEMPLETS_ID'
    object fibdsMainListID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsMainListSERVICE_ID: TFIBIntegerField
      DisplayLabel = #1042#1080#1082#1090#1086#1088#1080#1085#1072
      FieldName = 'SERVICE_ID'
    end
    object fibdsMainListPREV_MSG: TFIBStringField
      DisplayLabel = #1057#1086#1086#1073#1097#1077#1085#1080#1077' '#1086' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1084' '#1086#1090#1074#1077#1090#1077' '#1085#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1074#1086#1087#1088#1086#1089
      FieldName = 'PREV_MSG'
      Size = 50
      EmptyStrToNull = True
    end
    object fibdsMainListNEXT_MSG: TFIBStringField
      DisplayLabel = #1057#1086#1086#1073#1097#1077#1085#1080#1077' '#1086' '#1089#1083#1077#1076#1091#1102#1097#1077#1084' '#1074#1086#1087#1088#1086#1089#1077
      FieldName = 'NEXT_MSG'
      Size = 50
      EmptyStrToNull = True
    end
    object fibdsMainListPRIZE_MSG: TFIBStringField
      DisplayLabel = #1057#1086#1086#1073#1097#1077#1085#1080#1077' '#1086' '#1087#1088#1080#1079#1077
      FieldName = 'PRIZE_MSG'
      Size = 100
      EmptyStrToNull = True
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
end
