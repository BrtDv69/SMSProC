inherited frmPrizes: TfrmPrizes
  Left = 62
  Top = 124
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1088#1080#1079#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 370
    inherited Panel1: TPanel
      Width = 370
      inherited Label339: TLabel
        Width = 370
      end
      inherited dbmComments: TcxDBMemo
        Width = 370
      end
    end
    inherited cxSplitter1: TcxSplitter
      Width = 370
    end
    inherited Panel3: TPanel
      Width = 370
      inherited grdMainList: TcxGrid
        Width = 370
        inherited tvMainList: TcxGridDBTableView
          DataController.DataSource = dsMainList
          OptionsView.CellEndEllipsis = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          Preview.Column = tvMainListCOMMENTS
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
          object tvMainListNAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'NAME'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 265
          end
          object tvMainListVALID: TcxGridDBColumn
            Caption = #1044#1077#1081#1089#1090#1074'.'
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
    Left = 397
  end
  inherited grdMainServices: TcxGrid
    Left = 405
    Width = 306
    inherited tvMainServices: TcxGridDBTableView
      OnCellClick = tvMainServicesCellClick
      OnCustomDrawCell = tvMainServicesCustomDrawCell
      OnEditing = tvMainServicesEditing
      DataController.DataSource = dsPrizeServices
      DataController.KeyFieldNames = 'S_ID'
      OptionsBehavior.ImmediateEditor = True
      OptionsBehavior.IncSearch = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Appending = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.Header = True
      Styles.IncSearch = nil
      Styles.Header = nil
      Styles.Preview = nil
      object tvMainServicesS_DESCRIPTION: TcxGridDBColumn
        Caption = #1042#1080#1082#1090#1086#1088#1080#1085#1099
        DataBinding.FieldName = 'S_DESCRIPTION'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 236
      end
      object tvMainServicesSMS_COUNT: TcxGridDBColumn
        Caption = #1063#1080#1089#1083#1086' '#1057#1052#1057
        DataBinding.FieldName = 'SMS_COUNT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 68
      end
      object tvMainServicesSERVICE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICE_ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
      object tvMainServicesS_ID: TcxGridDBColumn
        DataBinding.FieldName = 'S_ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
    end
  end
  inherited fibdsMainList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    P.ID,'
      '    P.NAME,'
      '    P.VALID,'
      '    P.COMMENTS'
      'FROM'
      '    PRIZES P')
    AutoUpdateOptions.UpdateTableName = 'PRIZES'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_PRIZES_ID'
    BeforeScroll = fibdsMainListBeforeScroll
    object fibdsMainListID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsMainListNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 200
      EmptyStrToNull = True
    end
    object fibdsMainListVALID: TFIBIntegerField
      FieldName = 'VALID'
    end
    object fibdsMainListCOMMENTS: TFIBStringField
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
  object fibdsPrizeServices: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'SELECT'
      '    PS.ID,'
      '    PS.SERVICE_ID,'
      '    S.ID S_ID,'
      '    S.SERVICE_DESCRIPTION S_DESCRIPTION,'
      '    PS.PRIZE_ID,'
      '    PS.SMS_COUNT'
      'FROM SERVICES S left outer join PRIZE_SERVICES PS on'
      '(PS.SERVICE_ID=S.ID) and (PS.PRIZE_ID=:ID)'
      'where (S.VALID=1) and (S.SERVICE_KIND=2)'
      'order by 4')
    OnUpdateRecord = fibdsPrizeServicesUpdateRecord
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
    object fibdsPrizeServicesID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsPrizeServicesSERVICE_ID: TFIBIntegerField
      FieldName = 'SERVICE_ID'
    end
    object fibdsPrizeServicesS_ID: TFIBIntegerField
      FieldName = 'S_ID'
    end
    object fibdsPrizeServicesS_DESCRIPTION: TFIBStringField
      FieldName = 'S_DESCRIPTION'
      Size = 200
      EmptyStrToNull = True
    end
    object fibdsPrizeServicesPRIZE_ID: TFIBIntegerField
      FieldName = 'PRIZE_ID'
    end
    object fibdsPrizeServicesSMS_COUNT: TFIBIntegerField
      FieldName = 'SMS_COUNT'
    end
  end
  object dsPrizeServices: TDataSource
    DataSet = fibdsPrizeServices
    OnStateChange = dsMainListStateChange
    Left = 69
    Top = 90
  end
end
