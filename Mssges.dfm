inherited frmMessages: TfrmMessages
  Left = 29
  Top = 120
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel3: TPanel
      inherited grdMainList: TcxGrid
        inherited tvMainList: TcxGridDBTableView
          DataController.DataSource = dsMainList
          OptionsView.CellEndEllipsis = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          Preview.Column = tvMainListCOMMENTS
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
          object tvMainListRESPONCE_NUMBER: TcxGridDBColumn
            DataBinding.FieldName = 'RESPONCE_NUMBER'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
          end
          object tvMainListRESPONCE: TcxGridDBColumn
            DataBinding.FieldName = 'RESPONCE'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 440
          end
          object tvMainListVALID: TcxGridDBColumn
            DataBinding.FieldName = 'VALID'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1077
            Properties.DisplayUnchecked = #1053#1077' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1077
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortIndex = 0
            SortOrder = soDescending
            Width = 91
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
  inherited splServices: TcxSplitter
    Left = 572
    Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1077' '#1089#1077#1088#1074#1080#1089#1099
  end
  inherited grdMainServices: TcxGrid
    Left = 580
    PopupMenu = PopupMenu1
    inherited tvMainServices: TcxGridDBTableView
      OnCellClick = tvMainServicesCellClick
      OnCustomDrawCell = tvMainServicesCustomDrawCell
      DataController.DataSource = dsResponceServices
      DataController.KeyFieldNames = 'S_ID'
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
        DataBinding.FieldName = 'S_DESCRIPTION'
      end
      object tvMainServicesSERVICE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICE_ID'
        Visible = False
        Hidden = True
      end
      object tvMainServicesS_ID: TcxGridDBColumn
        DataBinding.FieldName = 'S_ID'
        Visible = False
        Hidden = True
      end
    end
  end
  inherited cxGridPopupMenu1: TcxGridPopupMenu
    Left = 176
  end
  inherited fibdsMainList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    R.ID,'
      '    R.RESPONCE_NUMBER,'
      '    R.RESPONCE,'
      '    R.VALID,'
      '    R.COMMENTS'
      'FROM'
      '    I_RESPONCES R'
      '@WHERE')
    AutoUpdateOptions.UpdateTableName = 'I_RESPONCES'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_I_RESPONCES_ID'
    BeforeScroll = fibdsMainListBeforeScroll
    object fibdsMainListID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsMainListRESPONCE_NUMBER: TFIBIntegerField
      DisplayLabel = #8470#1087#1087
      FieldName = 'RESPONCE_NUMBER'
    end
    object fibdsMainListRESPONCE: TFIBStringField
      DisplayLabel = #1054#1090#1074#1077#1090
      FieldName = 'RESPONCE'
      Size = 2240
      EmptyStrToNull = True
    end
    object fibdsMainListVALID: TFIBIntegerField
      DisplayLabel = #1044#1077#1081#1089#1090#1074'.'
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
  object fibdsResponceServices: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'SELECT'
      '    RS.ID,'
      '    RS.SERVICE_ID,'
      '    S.ID S_ID,'
      '    S.SERVICE_DESCRIPTION S_DESCRIPTION,'
      '    RS.RESPONCE_ID'
      'FROM SERVICES S left outer join I_RESPONCE_SERVICES RS on'
      '(RS.SERVICE_ID=S.ID) and (RS.RESPONCE_ID=:ID)'
      'where (S.VALID=1) and (S.SERVICE_KIND=1)'
      'order by 4')
    OnUpdateRecord = fibdsResponceServicesUpdateRecord
    AfterDelete = fibdsMainListAfterDelete
    Transaction = trMain
    Database = frmDM.dbMain
    SQLScreenCursor = crSQLWait
    DataSource = dsMainList
    Left = 69
    Top = 61
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
    object fibdsResponceServicesID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsResponceServicesSERVICE_ID: TFIBIntegerField
      FieldName = 'SERVICE_ID'
    end
    object fibdsResponceServicesS_ID: TFIBIntegerField
      FieldName = 'S_ID'
    end
    object fibdsResponceServicesS_DESCRIPTION: TFIBStringField
      FieldName = 'S_DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
    object fibdsResponceServicesRESPONCE_ID: TFIBIntegerField
      FieldName = 'RESPONCE_ID'
    end
  end
  object dsResponceServices: TDataSource
    DataSet = fibdsResponceServices
    OnStateChange = dsMainListStateChange
    Left = 69
    Top = 90
  end
  object PopupMenu1: TPopupMenu
    Left = 648
    Top = 168
    object N1: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1087#1086' '#1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1084' '#1057#1077#1088#1074#1080#1089#1072#1084
      OnClick = N1Click
    end
  end
end
