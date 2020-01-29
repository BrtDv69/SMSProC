inherited frmAdminUsers: TfrmAdminUsers
  Left = 81
  Top = 127
  Height = 466
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1080' '#1048#1085#1090#1077#1088#1092#1077#1081#1089
  WindowState = wsMaximized
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
      TabOrder = 2
    end
    inherited cxSplitter1: TcxSplitter
      Top = 365
    end
    inherited Panel3: TPanel
      Left = 210
      Width = 474
      Height = 365
      TabOrder = 1
      inherited grdMainList: TcxGrid
        Width = 272
        Height = 365
        OnEnter = grdMainListEnter
        RootLevelStyles.Tab = frmDM.stHeader
        inherited tvMainList: TcxGridDBTableView
          DragMode = dmAutomatic
          OnEndDrag = tvMainListEndDrag
          OnStartDrag = tvMainListStartDrag
          DataController.DataSource = dsMainList
          OptionsCustomize.ColumnsQuickCustomization = False
          OptionsData.Deleting = False
          OptionsView.ColumnAutoWidth = True
          Preview.Column = tvMainListCOMMENTS
          Styles.IncSearch = nil
          Styles.Header = nil
          Styles.Preview = nil
          object tvMainListPROG_USER_NAME: TcxGridDBColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
            DataBinding.FieldName = 'PROG_USER_NAME'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 158
          end
          object tvMainListPSWD: TcxGridDBColumn
            Caption = #1055#1072#1088#1086#1083#1100
            DataBinding.FieldName = 'PSWD'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
          end
          object tvMainListVALID: TcxGridDBColumn
            Caption = #1044#1077#1081#1089#1090#1074'.'
            DataBinding.FieldName = 'VALID'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ImmediatePost = True
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortIndex = 0
            SortOrder = soDescending
            Width = 78
          end
          object tvMainListCOMMENTS: TcxGridDBColumn
            DataBinding.FieldName = 'COMMENTS'
          end
          object tvMainListPROGRAM_GROUP_ID: TcxGridDBColumn
            DataBinding.FieldName = 'PROGRAM_GROUP_ID'
            Visible = False
            Hidden = True
          end
          object tvMainListID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
          end
        end
        inherited lvMainList: TcxGridLevel
          Caption = #1043#1088#1091#1087#1087#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          Styles.Tab = frmDM.stHeader
          Styles.TabsBackground = frmDM.stHeader
        end
      end
      object tlUI: TRzCheckTree
        Left = 272
        Top = 0
        Width = 202
        Height = 365
        OnStateChange = tlUIStateChange
        Align = alRight
        BorderStyle = bsNone
        Indent = 19
        SelectionPen.Color = clBtnShadow
        StateImages = tlUI.CheckImages
        TabOrder = 1
        OnDeletion = tlUIDeletion
      end
    end
    object spProgramGroups: TcxSplitter
      Left = 202
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
      Width = 202
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
      Preview.Visible = True
      RootValue = Null
      TabOrder = 0
      OnCustomDrawCell = tlGroupsCustomDrawCell
      OnDragDrop = tlGroupsDragDrop
      OnDragOver = tlGroupsDragOver
      OnEnter = tlGroupsEnter
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
        HitTypes = [gvhtCell]
        Index = 0
      end
      item
        GridView = tvMainList
        HitTypes = [gvhtCell]
        Index = 1
        PopupMenu = PopupMenu2
      end>
  end
  inherited fibdsMainList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    U.ID,'
      '    U.PROG_USER_NAME,'
      '    U.PROGRAM_GROUP_ID,'
      '    U.VALID,'
      '    '#39'********************'#39' PSWD,'
      '    U.COMMENTS'
      'FROM'
      '    USERS U'
      '@WHERE')
    OnUpdateRecord = fibdsMainListUpdateRecord
    AutoUpdateOptions.UpdateTableName = 'USERS'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_USERS_ID'
    BeforeOpen = fibdsMainListBeforeOpen
    BeforeScroll = fibdsMainListBeforeScroll
    OnNewRecord = fibdsMainListNewRecord
    DataSource = dsProgramGroups
    Left = 69
    poSetReadOnlyFields = False
    object fibdsMainListID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsMainListPROG_USER_NAME: TFIBStringField
      FieldName = 'PROG_USER_NAME'
      Size = 60
      EmptyStrToNull = True
    end
    object fibdsMainListPROGRAM_GROUP_ID: TFIBIntegerField
      FieldName = 'PROGRAM_GROUP_ID'
    end
    object fibdsMainListVALID: TFIBIntegerField
      FieldName = 'VALID'
    end
    object fibdsMainListPSWD: TFIBStringField
      FieldName = 'PSWD'
      EmptyStrToNull = True
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
    inherited sbDelete: TdxBarButton
      Visible = ivNever
    end
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
      'select PG.ID,'
      'PG.PARENT_ID,'
      'PG.GROUP_NAME,'
      'PG.ROLE_NAME,'
      
        '(select count(*) from RDB$ROLES RR where (RR.RDB$ROLE_NAME=PG.RO' +
        'LE_NAME)) ROLE_COUNT'
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
  object fibdsMainRoleRights: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'SELECT'
      '    PGV.PROGRAM_GROUP_ID,'
      '    PGV.VISIBLE_NAME'
      'FROM'
      '    UA_PROGRAM_GROUPS_VISIBLES PGV'
      'WHERE (PGV.PROGRAM_GROUP_ID=:ID)')
    AutoUpdateOptions.UpdateTableName = 'UA_PROGRAM_GROUPS_VISIBLES'
    AutoUpdateOptions.KeyFields = 'PROGRAM_GROUP_ID;VISIBLE_NAME'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.AutoParamsToFields = True
    AfterDelete = fibdsMainListAfterDelete
    AfterOpen = fibdsMainRoleRightsAfterOpen
    AllowedUpdateKinds = [ukInsert, ukDelete]
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
    object fibdsMainRoleRightsPROGRAM_GROUP_ID: TFIBIntegerField
      FieldName = 'PROGRAM_GROUP_ID'
    end
    object fibdsMainRoleRightsVISIBLE_NAME: TFIBStringField
      FieldName = 'VISIBLE_NAME'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object dsMainRoleRights: TDataSource
    DataSet = fibdsMainRoleRights
    OnStateChange = dsProgramGroupsStateChange
    Left = 98
    Top = 90
  end
  object PopupMenu2: TPopupMenu
    Left = 336
    Top = 136
    object GetRightsFromGroup: TMenuItem
      Caption = #1059#1085#1072#1089#1083#1077#1076#1086#1074#1072#1090#1100' '#1074#1089#1077' '#1087#1088#1072#1074#1072' '#1075#1088#1091#1087#1087#1099
      OnClick = GetRightsFromGroupClick
    end
  end
  object ssUsers: TpFIBSecurityService
    Protocol = TCP
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    LibraryName = 'fbclient.dll'
    SecurityAction = ActionAddUser
    UserID = 0
    GroupID = 0
    Left = 69
    Top = 119
  end
  object fibdsMainUserRights: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'SELECT'
      '    U.USER_ID,'
      '    U.VISIBLE_NAME'
      'FROM'
      '    USERS_VISIBLES U'
      'WHERE (U.USER_ID=:ID)')
    AutoUpdateOptions.UpdateTableName = 'USERS_VISIBLES'
    AutoUpdateOptions.KeyFields = 'USER_ID;VISIBLE_NAME'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.AutoParamsToFields = True
    AfterDelete = fibdsMainListAfterDelete
    AfterOpen = fibdsMainUserRightsAfterOpen
    AllowedUpdateKinds = [ukInsert, ukDelete]
    Transaction = trMain
    Database = frmDM.dbMain
    SQLScreenCursor = crSQLWait
    DataSource = dsMainList
    Left = 127
    Top = 61
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
    object fibdsMainUserRightsUSER_ID: TFIBIntegerField
      FieldName = 'USER_ID'
    end
    object fibdsMainUserRightsVISIBLE_NAME: TFIBStringField
      FieldName = 'VISIBLE_NAME'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object dsMainUserRights: TDataSource
    DataSet = fibdsMainUserRights
    OnStateChange = dsProgramGroupsStateChange
    Left = 127
    Top = 90
  end
end
