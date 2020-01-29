inherited frmSVAnalTotal: TfrmSVAnalTotal
  Left = 257
  Top = 133
  Height = 460
  Caption = #1040#1085#1072#1083#1080#1090#1080#1095#1077#1089#1082#1080#1081' '#1086#1090#1095#1077#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Height = 433
    inherited Panel1: TPanel
      Top = 374
      Visible = False
      inherited dbmComments: TcxDBMemo
        DataBinding.DataField = ''
        DataBinding.DataSource = nil
      end
    end
    inherited cxSplitter1: TcxSplitter
      Top = 366
      Visible = False
    end
    inherited Panel3: TPanel
      Height = 366
      inherited grdMainList: TcxGrid
        Height = 366
        OnResize = grdMainListResize
        inherited tvMainList: TcxGridDBTableView
          DataController.DataSource = dsMainList
          DataController.KeyFieldNames = 'SERVICE_ID;OPERATOR_ID;SMS_DATE;SMS_HOUR;PHONE_NUMBER'
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#0'
              Column = tvMainListSMS_COUNT
            end>
          OptionsCustomize.ColumnGrouping = True
          OptionsCustomize.ColumnHiding = True
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
          OnColumnPosChanged = tvMainListColumnPosChanged
          object tvMainListSERVICE_KIND: TcxGridDBColumn
            DataBinding.FieldName = 'SERVICE_KIND'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'NAME'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsServiceKind
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.CellMerging = True
            SortIndex = 0
            SortOrder = soAscending
          end
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
            Options.CellMerging = True
            SortIndex = 1
            SortOrder = soAscending
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
            Options.CellMerging = True
            SortIndex = 2
            SortOrder = soAscending
          end
          object tvMainListSMS_DATE: TcxGridDBColumn
            DataBinding.FieldName = 'SMS_DATE'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.CellMerging = True
            SortIndex = 3
            SortOrder = soDescending
          end
          object tvMainListSMS_HOUR: TcxGridDBColumn
            DataBinding.FieldName = 'SMS_HOUR'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.CellMerging = True
            SortIndex = 4
            SortOrder = soAscending
          end
          object tvMainListPHONE_NUMBER: TcxGridDBColumn
            DataBinding.FieldName = 'PHONE_NUMBER'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.CellMerging = True
            SortIndex = 5
            SortOrder = soAscending
          end
          object tvMainListSMS_COUNT: TcxGridDBColumn
            DataBinding.FieldName = 'SMS_COUNT'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Moving = False
          end
        end
      end
      object pnlPeriod: TPanel
        Left = 248
        Top = 136
        Width = 206
        Height = 90
        BevelOuter = bvNone
        TabOrder = 1
        object btnOK: TcxButton
          Left = 121
          Top = 64
          Width = 75
          Height = 17
          Cursor = crHandPoint
          Caption = 'OK'
          Default = True
          TabOrder = 0
          OnClick = btnOKClick
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
        end
        object cxLabel1: TcxLabel
          Left = 0
          Top = 0
          Cursor = crDrag
          Align = alTop
          AutoSize = False
          Caption = #1055#1077#1088#1080#1086#1076' '#1086#1090#1095#1077#1090#1072
          ParentColor = False
          ParentFont = False
          Style.Color = clActiveCaption
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clCaptionText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          OnMouseMove = cxLabel1MouseMove
          Height = 19
          Width = 206
        end
        object cxLabel2: TcxLabel
          Left = 17
          Top = 26
          Caption = #1057
        end
        object cxLabel3: TcxLabel
          Left = 10
          Top = 45
          Caption = #1055#1086
        end
        object deStart: TcxDateEdit
          Left = 34
          Top = 24
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfUltraFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfUltraFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 4
          Width = 89
        end
        object deStop: TcxDateEdit
          Left = 34
          Top = 43
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfUltraFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfUltraFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 5
          Width = 89
        end
      end
    end
  end
  inherited fibdsMainList: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select @SERVICE_KIND SERVICE_KIND, @SERVICE_ID SERVICE_ID, @OPER' +
        'ATOR_ID OPERATOR_ID,'
      'cast(@SMS_TIMESTAMP as date) SMS_DATE, @SMS_HOUR SMS_HOUR,'
      '@PHONE_NUMBER PHONE_NUMBER, count(*) SMS_COUNT'
      'from IN_SMS_HISTORY SH, SERVICES S'
      'where (S.ID=SH.SERVICE_ID) and'
      
        '(SH.SMS_TIMESTAMP!<:START_DATE) and (SH.SMS_TIMESTAMP!>:STOP_DAT' +
        'E)'
      'group by @group_by')
    AutoUpdateOptions.AutoReWriteSqls = False
    AutoUpdateOptions.CanChangeSQLs = False
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.UpdateOnlyModifiedFields = False
    AutoUpdateOptions.WhenGetGenID = wgNever
    AutoUpdateOptions.AutoParamsToFields = False
    BeforeOpen = fibdsMainListBeforeOpen
    AllowedUpdateKinds = []
    object fibdsMainListSERVICE_KIND: TFIBIntegerField
      DisplayLabel = #1042#1080#1076' '#1089#1077#1088#1074#1080#1089#1072
      FieldName = 'SERVICE_KIND'
    end
    object fibdsMainListSERVICE_ID: TFIBIntegerField
      DisplayLabel = #1057#1077#1088#1074#1080#1089
      FieldName = 'SERVICE_ID'
    end
    object fibdsMainListOPERATOR_ID: TFIBIntegerField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = 'OPERATOR_ID'
    end
    object fibdsMainListSMS_DATE: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'SMS_DATE'
    end
    object fibdsMainListSMS_HOUR: TFIBSmallIntField
      DisplayLabel = #1063#1072#1089
      FieldName = 'SMS_HOUR'
      DisplayFormat = '00'
    end
    object fibdsMainListPHONE_NUMBER: TFIBStringField
      DisplayLabel = #8470' '#1072#1073#1086#1085#1077#1085#1090#1072
      FieldName = 'PHONE_NUMBER'
      EmptyStrToNull = True
    end
    object fibdsMainListSMS_COUNT: TFIBIntegerField
      DisplayLabel = #1063#1080#1089#1083#1086' '#1057#1052#1057
      FieldName = 'SMS_COUNT'
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
  object fibdsServices: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    S.ID,'
      '    S.SERVICE_DESCRIPTION,'
      '    S.VALID'
      'FROM'
      '    SERVICES S'
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
  object fibdsServiceKind: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    1 ID,'
      '    cast('#39#1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1081' '#1057#1077#1088#1074#1080#1089#39' as varchar(21)) NAME'
      'FROM'
      '    rdb$database'
      'union'
      'SELECT'
      '    2 ID,'
      '    cast('#39#1042#1080#1082#1090#1086#1088#1080#1085#1072#39' as varchar(21)) NAME'
      'FROM'
      '    rdb$database'
      '')
    AfterDelete = fibdsMainListAfterDelete
    AllowedUpdateKinds = []
    Transaction = trMain
    Database = frmDM.dbMain
    SQLScreenCursor = crSQLWait
    Left = 40
    Top = 235
    poSetRequiredFields = True
    poSetReadOnlyFields = True
    poSQLINT64ToBCD = True
    oRefreshAfterPost = False
    oStartTransaction = False
    oFetchAll = True
    object fibdsServiceKindID: TFIBIntegerField
      FieldName = 'ID'
    end
    object fibdsServiceKindNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 21
      EmptyStrToNull = True
    end
  end
  object dsServiceKind: TDataSource
    DataSet = fibdsServiceKind
    OnStateChange = dsMainListStateChange
    Left = 40
    Top = 264
  end
end
