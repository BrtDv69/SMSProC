inherited frmSockets: TfrmSockets
  Left = 69
  Top = 109
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1082#1077#1090#1086#1074
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
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnsQuickCustomization = False
          OptionsView.ColumnAutoWidth = True
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
          object tvMainListNUMBER: TcxGridDBColumn
            Caption = #8470' '#1089#1086#1082#1077#1090#1072
            DataBinding.FieldName = 'NUMBER'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortIndex = 0
            SortOrder = soAscending
            Width = 96
          end
          object tvMainListOPERATOR_ID: TcxGridDBColumn
            Caption = #1054#1087#1077#1088#1072#1090#1086#1088
            DataBinding.FieldName = 'OPERATOR_ID'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'NAME'
              end>
            Properties.ListOptions.AnsiSort = True
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsOperators
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 256
          end
        end
      end
    end
  end
  inherited fibdsMainList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    S.ID,'
      '    S.OPERATOR_ID,'
      '    S.NUMBER'
      'FROM'
      '    L_SOCKETS S')
    AutoUpdateOptions.UpdateTableName = 'L_SOCKETS'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_L_SOCKETS_ID'
    object fibdsMainListID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsMainListOPERATOR_ID: TFIBIntegerField
      FieldName = 'OPERATOR_ID'
    end
    object fibdsMainListNUMBER: TFIBIntegerField
      FieldName = 'NUMBER'
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
    Top = 119
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
  end
  object dsOperators: TDataSource
    DataSet = fibdsOperators
    OnStateChange = dsMainListStateChange
    Left = 40
    Top = 148
  end
end
