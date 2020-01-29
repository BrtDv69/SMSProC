inherited frmServices: TfrmServices
  Left = 42
  Top = 102
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1077#1088#1074#1080#1089#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel3: TPanel
      inherited grdMainList: TcxGrid
        inherited tvMainList: TcxGridDBTableView
          DataController.DataSource = dsMainList
          OptionsView.ColumnAutoWidth = True
          Preview.Column = tvMainListCOMMENTS
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
          object tvMainListSERVICE_KIND: TcxGridDBColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'SERVICE_KIND'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              #1042#1080#1082#1090#1086#1088#1080#1085#1072
              #1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1081' '#1057#1077#1088#1074#1080#1089)
            Properties.ReadOnly = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortIndex = 1
            SortOrder = soAscending
            Width = 122
          end
          object tvMainListPHONE_NUMBER: TcxGridDBColumn
            Caption = #1058#1077#1083#1077#1092#1086#1085
            DataBinding.FieldName = 'PHONE_NUMBER'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 65
          end
          object tvMainListSERVICE_USER_NAME: TcxGridDBColumn
            Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1089#1077#1088#1074#1080#1089#1072
            DataBinding.FieldName = 'SERVICE_USER_NAME'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortIndex = 2
            SortOrder = soAscending
            Width = 92
          end
          object tvMainListSERVICE_DESCRIPTION: TcxGridDBColumn
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1077#1088#1074#1080#1089#1072
            DataBinding.FieldName = 'SERVICE_DESCRIPTION'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 294
          end
          object tvMainListVALID: TcxGridDBColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086#1089#1090#1080
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
            Width = 97
          end
          object tvMainListCOMMENTS: TcxGridDBColumn
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
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
      '    S.ID,'
      '    S.SERVICE_KIND,'
      '    S.PHONE_NUMBER,'
      '    S.SERVICE_USER_NAME,'
      '    S.SERVICE_DESCRIPTION,'
      '    S.VALID,'
      '    S.COMMENTS'
      'FROM'
      '    SERVICES S')
    AutoUpdateOptions.UpdateTableName = 'SERVICES'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_SERVICES_ID'
    object fibdsMainListID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsMainListSERVICE_KIND: TFIBIntegerField
      Alignment = taLeftJustify
      FieldName = 'SERVICE_KIND'
      OnGetText = fibdsMainListSERVICE_KINDGetText
      OnSetText = fibdsMainListSERVICE_KINDSetText
    end
    object fibdsMainListPHONE_NUMBER: TFIBStringField
      FieldName = 'PHONE_NUMBER'
      EmptyStrToNull = True
    end
    object fibdsMainListSERVICE_USER_NAME: TFIBStringField
      FieldName = 'SERVICE_USER_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object fibdsMainListSERVICE_DESCRIPTION: TFIBStringField
      FieldName = 'SERVICE_DESCRIPTION'
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
end
