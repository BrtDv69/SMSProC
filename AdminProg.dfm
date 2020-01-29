inherited frmAdminProg: TfrmAdminProg
  Left = 247
  Top = 136
  Height = 466
  Caption = #1043#1088#1091#1087#1087#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Height = 432
    object Image1: TImage [0]
      Left = 96
      Top = 376
      Width = 105
      Height = 105
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000120B0000120B0000000000000000
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B
        000F9E1C0F9D1E004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF004B001CB13511A4220C9C1911A021004B00FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B002EC65224BC
        43139224004B000D931A0E9D1D004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF004B0035CA5E39D4651CA134004B00FF00FF004B000A86150F991C
        004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B0029B548004B
        00FF00FFFF00FFFF00FFFF00FF004B000C9518004B00FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        004B00098611004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF}
    end
    inherited Panel1: TPanel
      Top = 373
    end
    inherited cxSplitter1: TcxSplitter
      Top = 365
    end
    inherited Panel3: TPanel
      Left = 249
      Width = 435
      Height = 365
      inherited grdMainList: TcxGrid
        Width = 435
        Height = 365
        RootLevelOptions.DetailTabsPosition = dtpTop
        RootLevelStyles.Tab = frmDM.stHeader
        inherited tvMainList: TcxGridDBTableView
          DragMode = dmAutomatic
          OnEndDrag = tvMainListEndDrag
          OnStartDrag = tvMainListStartDrag
          OnCustomDrawCell = tvMainListCustomDrawCell
          DataController.DataSource = dsMainList
          OptionsCustomize.ColumnsQuickCustomization = False
          OptionsView.ColumnAutoWidth = True
          Preview.Column = tvMainListCOMMENTS
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
          object tvMainListGROUP_NAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
            DataBinding.FieldName = 'GROUP_NAME'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object tvMainListCOMMENTS: TcxGridDBColumn
            DataBinding.FieldName = 'COMMENTS'
          end
          object tvMainListROLE_COUNT: TcxGridDBColumn
            DataBinding.FieldName = 'ROLE_COUNT'
            Visible = False
            Hidden = True
          end
          object tvMainListPARENT_ID: TcxGridDBColumn
            DataBinding.FieldName = 'PARENT_ID'
            Visible = False
            Hidden = True
          end
          object tvMainListID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
          end
        end
        object tvMainRoleRights: TcxGridDBTableView [1]
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = tvMainRoleRightsCustomDrawCell
          OnEditing = tvMainRoleRightsEditing
          DataController.DataSource = dsMainRoleRights
          DataController.KeyFieldNames = 'RDB$RELATION_NAME'
          DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.DataRowSizing = True
          OptionsCustomize.GroupRowSizing = True
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderEndEllipsis = True
          OptionsView.Indicator = True
          Styles.Header = frmDM.stHeader
          Styles.StyleSheet = frmDM.cxGridTableViewStyleSheet1
          object tvMainRoleRightsOBJECT_TYPE: TcxGridDBColumn
            DataBinding.FieldName = 'OBJECT_TYPE'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 74
          end
          object tvMainRoleRightsRDBDESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'RDB$DESCRIPTION'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 183
          end
          object tvMainRoleRightsSELECT_RIGHT: TcxGridDBColumn
            Caption = #1055#1088#1086#1089#1084#1086#1090#1088
            DataBinding.FieldName = 'SELECT_RIGHT'
            RepositoryItem = frmDM.ImageComboBoxSelectRights
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 29
          end
          object tvMainRoleRightsINSERT_RIGHT: TcxGridDBColumn
            DataBinding.FieldName = 'INSERT_RIGHT'
            RepositoryItem = frmDM.ImageComboBoxSelectRights
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 26
          end
          object tvMainRoleRightsUPDATE_RIGHT: TcxGridDBColumn
            DataBinding.FieldName = 'UPDATE_RIGHT'
            RepositoryItem = frmDM.ImageComboBoxSelectRights
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 27
          end
          object tvMainRoleRightsDELETE_RIGHT: TcxGridDBColumn
            DataBinding.FieldName = 'DELETE_RIGHT'
            RepositoryItem = frmDM.ImageComboBoxSelectRights
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 28
          end
          object tvMainRoleRightsREFERENSE_RIGHT: TcxGridDBColumn
            DataBinding.FieldName = 'REFERENSE_RIGHT'
            RepositoryItem = frmDM.ImageComboBoxSelectRights
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 28
          end
          object tvMainRoleRightsEXECUTE_RIGHT: TcxGridDBColumn
            DataBinding.FieldName = 'EXECUTE_RIGHT'
            RepositoryItem = frmDM.ImageComboBoxSelectRights
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 26
          end
        end
        inherited lvMainList: TcxGridLevel
          Caption = #1043#1088#1091#1087#1087#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          Styles.Tab = frmDM.stHeader
          Styles.TabsBackground = frmDM.stHeader
        end
        object lvMainRoleRights: TcxGridLevel
          Caption = #1054#1073#1098#1077#1082#1090#1099' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
          GridView = tvMainRoleRights
          Options.DetailTabsPosition = dtpLeft
          Styles.Tab = frmDM.stHeader
          Styles.TabsBackground = frmDM.stHeader
        end
      end
    end
    object spProgramGroups: TcxSplitter
      Left = 241
      Top = 0
      Width = 8
      Height = 365
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1089#1087#1088#1103#1090#1072#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1086#1090#1076#1077#1083#1077#1085#1080#1081' '#1080' '#1075#1088#1091#1087#1087
      HotZoneClassName = 'TcxMediaPlayer9Style'
      ResizeUpdate = True
      Control = tlGroups
      OnAfterOpen = spProgramGroupsAfterOpen
      OnBeforeClose = spProgramGroupsBeforeClose
      OnAfterClose = spProgramGroupsAfterClose
    end
    object tlGroups: TcxDBTreeList
      Left = 0
      Top = 0
      Width = 241
      Height = 365
      Styles.StyleSheet = frmDM.cxTreeListStyleSheet1
      Align = alLeft
      Bands = <
        item
        end>
      BufferedPaint = False
      DataController.DataSource = dsProgramGroups
      DataController.ParentField = 'PARENT_ID'
      DataController.KeyField = 'ID'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      OptionsBehavior.CellHints = True
      OptionsBehavior.DragFocusing = True
      OptionsBehavior.ExpandOnIncSearch = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.AnsiSort = True
      OptionsData.Deleting = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Indicator = True
      OptionsView.SimpleCustomizeBox = True
      PopupMenu = PopupMenu1
      Preview.Visible = True
      RootValue = Null
      TabOrder = 4
      OnCustomDrawCell = tlGroupsCustomDrawCell
      OnDragDrop = tlGroupsDragDrop
      OnDragOver = tlGroupsDragOver
      object tlGroupsNAME: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1044#1077#1088#1077#1074#1086
        DataBinding.FieldName = 'GROUP_NAME'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
      end
      object tlGroupsID: TcxDBTreeListColumn
        Visible = False
        DataBinding.FieldName = 'ID'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlGroupsPARENT_ID: TcxDBTreeListColumn
        Visible = False
        DataBinding.FieldName = 'PARENT_ID'
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object tlGroupsROLE_COUNT: TcxDBTreeListColumn
        Visible = False
        DataBinding.FieldName = 'ROLE_COUNT'
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  inherited cxGridPopupMenu1: TcxGridPopupMenu
    PopupMenus = <
      item
        GridView = tvMainList
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = PopupMenu1
      end
      item
        GridView = tvMainRoleRights
        HitTypes = [gvhtCell]
        Index = 1
        PopupMenu = PopupMenu2
      end>
  end
  inherited fibdsMainList: TpFIBDataSet
    SelectSQL.Strings = (
      'select PG.ID, PG.PARENT_ID, PG.GROUP_NAME, PG.ROLE_NAME,'
      
        '(select count(*) from RDB$ROLES RR where (RR.RDB$ROLE_NAME=PG.RO' +
        'LE_NAME)) ROLE_COUNT,'
      'PG.COMMENTS'
      'from UA_PROGRAM_GROUPS PG'
      '@WHERE'
      'order by 3')
    OnUpdateRecord = fibdsMainListUpdateRecord
    AutoUpdateOptions.UpdateTableName = 'UA_PROGRAM_GROUPS'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UA_PROGRAM_GROUPS_ID'
    BeforeOpen = fibdsMainListBeforeOpen
    OnNewRecord = fibdsMainListNewRecord
    DataSource = dsProgramGroups
    Left = 69
    object fibdsMainListID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsMainListPARENT_ID: TFIBIntegerField
      FieldName = 'PARENT_ID'
    end
    object fibdsMainListGROUP_NAME: TFIBStringField
      FieldName = 'GROUP_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object fibdsMainListROLE_NAME: TFIBStringField
      FieldName = 'ROLE_NAME'
      Size = 31
      EmptyStrToNull = True
    end
    object fibdsMainListROLE_COUNT: TFIBIntegerField
      FieldName = 'ROLE_COUNT'
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
  inherited dsMainList: TDataSource
    OnStateChange = dsProgramGroupsStateChange
    Left = 69
  end
  object fibdsProgramGroups: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      
        'select PG.ID, PG.PARENT_ID, PG.GROUP_NAME, PG.ROLE_NAME, (select' +
        ' count(*) from RDB$ROLES RR where (RR.RDB$ROLE_NAME=PG.ROLE_NAME' +
        ')) ROLE_COUNT'
      'from UA_PROGRAM_GROUPS PG'
      'order by 3')
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoUpdateOptions.AutoParamsToFields = True
    AfterDelete = fibdsMainListAfterDelete
    BeforeScroll = fibdsProgramGroupsBeforeScroll
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
    object fibdsProgramGroupsID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsProgramGroupsPARENT_ID: TFIBIntegerField
      FieldName = 'PARENT_ID'
    end
    object fibdsProgramGroupsGROUP_NAME: TFIBStringField
      FieldName = 'GROUP_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object fibdsProgramGroupsROLE_COUNT: TFIBIntegerField
      FieldName = 'ROLE_COUNT'
    end
    object fibdsProgramGroupsROLE_NAME: TFIBStringField
      FieldName = 'ROLE_NAME'
      Size = 31
      EmptyStrToNull = True
    end
  end
  object dsProgramGroups: TDataSource
    DataSet = fibdsProgramGroups
    OnStateChange = dsProgramGroupsStateChange
    Left = 40
    Top = 90
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 128
    Top = 144
    object N1: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1088#1086#1083#1100
      OnClick = N1Click
    end
  end
  object fibdsMainRoleRights: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'select R.RDB$RELATION_NAME, R.RDB$DESCRIPTION, 0 OBJECT_TYPE,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'S'#39') and (UP.RDB$RELATION_NAME=R.RDB$R' +
        'ELATION_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) SELECT_RIGHT,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'I'#39') and (UP.RDB$RELATION_NAME=R.RDB$R' +
        'ELATION_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) INSERT_RIGHT,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'U'#39') and (UP.RDB$RELATION_NAME=R.RDB$R' +
        'ELATION_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) UPDATE_RIGHT,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'D'#39') and (UP.RDB$RELATION_NAME=R.RDB$R' +
        'ELATION_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) DELETE_RIGHT,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'R'#39') and (UP.RDB$RELATION_NAME=R.RDB$R' +
        'ELATION_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) REFERENSE_RIGHT,'
      '0 EXECUTE_RIGHT'
      'from RDB$RELATIONS R'
      
        'where (R.RDB$SYSTEM_FLAG=0) and (R.RDB$VIEW_BLR is NULL) and not' +
        '(R.RDB$RELATION_NAME in ('#39'USERS_TUNINGS'#39','#39'LETTER_REPLACEMENT'#39'))'
      'union'
      'select R.RDB$RELATION_NAME, R.RDB$DESCRIPTION, 1 OBJECT_TYPE,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'S'#39') and (UP.RDB$RELATION_NAME=R.RDB$R' +
        'ELATION_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) SELECT_RIGHT,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'I'#39') and (UP.RDB$RELATION_NAME=R.RDB$R' +
        'ELATION_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) INSERT_RIGHT,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'U'#39') and (UP.RDB$RELATION_NAME=R.RDB$R' +
        'ELATION_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) UPDATE_RIGHT,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'D'#39') and (UP.RDB$RELATION_NAME=R.RDB$R' +
        'ELATION_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) DELETE_RIGHT,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'R'#39') and (UP.RDB$RELATION_NAME=R.RDB$R' +
        'ELATION_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) REFERENSE_RIGHT,'
      '0 EXECUTE_RIGHT'
      
        'from RDB$RELATIONS R where NOT (R.RDB$VIEW_BLR is NULL) and (R.R' +
        'DB$RELATION_NAME!='#39'USER_LIST'#39')'
      'union'
      
        'select R.RDB$PROCEDURE_NAME, R.RDB$DESCRIPTION, 2 OBJECT_TYPE, 0' +
        ' SELECT_RIGHT, 0 INSERT_RIGHT,'
      '0 UPDATE_RIGHT, 0 DELETE_RIGHT, 0 REFERENSE_RIGHT,'
      '(select cast(1+COALESCE(RDB$GRANT_OPTION,0) as integer)'
      '   from RDB$USER_PRIVILEGES UP'
      
        '  where (UP.RDB$PRIVILEGE='#39'X'#39') and (UP.RDB$RELATION_NAME=R.RDB$P' +
        'ROCEDURE_NAME) and'
      
        '        (UP.RDB$USER = :ROLE_NAME) and (UP.RDB$USER_TYPE = 13) a' +
        'nd (UP.RDB$FIELD_NAME is NULL)) EXECUTE_RIGHT'
      'from RDB$PROCEDURES R'
      
        'where Not(R.RDB$PROCEDURE_NAME in ('#39'SET_USER_TUNING'#39','#39'GET_USER'#39',' +
        #39'GET_RUSSIAN_CHAR'#39'))'
      'order by 3,1')
    OnUpdateRecord = fibdsMainRoleRightsUpdateRecord
    AfterDelete = fibdsMainListAfterDelete
    BeforeEdit = fibdsMainRoleRightsBeforeEdit
    AllowedUpdateKinds = [ukModify]
    Transaction = trMain
    Database = frmDM.dbMain
    SQLScreenCursor = crSQLWait
    DataSource = dsProgramGroups
    Left = 98
    Top = 61
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
    object fibdsMainRoleRightsRDBRELATION_NAME: TFIBWideStringField
      FieldName = 'RDB$RELATION_NAME'
      Size = 31
    end
    object fibdsMainRoleRightsRDBDESCRIPTION: TFIBMemoField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'RDB$DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object fibdsMainRoleRightsOBJECT_TYPE: TFIBIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #1058#1080#1087
      FieldName = 'OBJECT_TYPE'
      OnGetText = fibdsMainRoleRightsOBJECT_TYPEGetText
    end
    object fibdsMainRoleRightsSELECT_RIGHT: TFIBIntegerField
      DisplayLabel = #1042#1099#1073#1086#1088
      FieldName = 'SELECT_RIGHT'
    end
    object fibdsMainRoleRightsINSERT_RIGHT: TFIBIntegerField
      DisplayLabel = #1042#1089#1090#1072#1074#1082#1072
      FieldName = 'INSERT_RIGHT'
    end
    object fibdsMainRoleRightsUPDATE_RIGHT: TFIBIntegerField
      DisplayLabel = #1048#1079#1084#1077#1085#1077#1085#1080#1077
      FieldName = 'UPDATE_RIGHT'
    end
    object fibdsMainRoleRightsDELETE_RIGHT: TFIBIntegerField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1080#1077
      FieldName = 'DELETE_RIGHT'
    end
    object fibdsMainRoleRightsREFERENSE_RIGHT: TFIBIntegerField
      DisplayLabel = #1057#1089#1099#1083#1082#1072
      FieldName = 'REFERENSE_RIGHT'
    end
    object fibdsMainRoleRightsEXECUTE_RIGHT: TFIBIntegerField
      DisplayLabel = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077
      FieldName = 'EXECUTE_RIGHT'
    end
  end
  object dsMainRoleRights: TDataSource
    DataSet = fibdsMainRoleRights
    OnStateChange = dsProgramGroupsStateChange
    Left = 98
    Top = 90
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 336
    Top = 136
    object N9: TMenuItem
      Tag = 1
      Caption = #1044#1072#1090#1100' '#1087#1088#1072#1074#1086' '#1085#1072' '#1074#1089#1077' '#1086#1073#1098#1077#1082#1090#1099
      OnClick = N9Click
    end
    object N8: TMenuItem
      Tag = 2
      Caption = #1044#1072#1090#1100' '#1087#1088#1072#1074#1086' '#1089' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100#1102' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103' '#1085#1072' '#1074#1089#1077' '#1086#1073#1098#1077#1082#1090#1099
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1087#1088#1072#1074#1086' '#1085#1072' '#1074#1089#1077' '#1086#1073#1098#1077#1082#1090#1099
      OnClick = N9Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Tag = 1
      Caption = #1044#1072#1090#1100' '#1074#1089#1077' '#1087#1088#1072#1074#1072' '#1085#1072' '#1086#1073#1098#1077#1082#1090
      OnClick = N5Click
    end
    object N6: TMenuItem
      Tag = 2
      Caption = #1044#1072#1090#1100' '#1074#1089#1077' '#1087#1088#1072#1074#1072' '#1089' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100#1102' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103' '#1085#1072' '#1086#1073#1098#1077#1082#1090
      OnClick = N5Click
    end
    object N11: TMenuItem
      Caption = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1087#1088#1072#1074#1072' '#1085#1072' '#1086#1073#1098#1077#1082#1090
      OnClick = N5Click
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Tag = 1
      Caption = #1044#1072#1090#1100' '#1074#1089#1077' '#1087#1088#1072#1074#1072' '#1085#1072' '#1074#1089#1077' '#1086#1073#1098#1077#1082#1090#1099
      OnClick = N13Click
    end
    object objectN6TMenuItem1: TMenuItem
      Tag = 2
      Caption = #1044#1072#1090#1100' '#1074#1089#1077' '#1087#1088#1072#1074#1072' '#1089' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100#1102' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103' '#1085#1072' '#1074#1089#1077' '#1086#1073#1098#1077#1082#1090#1099
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1087#1088#1072#1074#1072' '#1085#1072' '#1074#1089#1077' '#1086#1073#1098#1077#1082#1090#1099
      OnClick = N13Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1059#1085#1072#1089#1083#1077#1076#1086#1074#1072#1090#1100' '#1074#1089#1077' '#1087#1088#1072#1074#1072' '#1086#1090' '#1088#1086#1076#1080#1090#1077#1083#1103
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1056#1072#1089#1087#1088#1086#1089#1090#1088#1072#1085#1080#1090#1100' '#1074#1089#1077' '#1087#1088#1072#1074#1072' '#1085#1072' '#1087#1086#1090#1086#1084#1082#1086#1074
      Visible = False
      OnClick = N3Click
    end
  end
end
