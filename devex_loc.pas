unit devex_loc;

interface

uses
  cxFilterDialog, cxNavigator,cxClasses,cxExportStrs,cxFilterConsts,
  cxFilterControlStrs,cxGridStrs, dxBarStrs, cxGridPopUpMenuConsts, cxEditConsts;


procedure localize_cx;

implementation

procedure localize_cx;
begin
  // ���������
  cxSetResourceString(@cxNavigatorHint_First,'������ ������');
  cxSetResourceString(@cxNavigatorHint_Prior,'���������� ������');
  cxSetResourceString(@cxNavigatorHint_PriorPage,'���������� ��������');
  cxSetResourceString(@cxNavigatorHint_Next,'��������� ������');
  cxSetResourceString(@cxNavigatorHint_NextPage,'��������� ��������');
  cxSetResourceString(@cxNavigatorHint_Last,'��������� ������');
  cxSetResourceString(@cxNavigatorHint_Insert,'��������');
  cxSetResourceString(@cxNavigatorHint_Delete,'�������');
  cxSetResourceString(@cxNavigatorHint_Edit,'�������������');
  cxSetResourceString(@cxNavigatorHint_Post,'��������');
  cxSetResourceString(@cxNavigatorHint_Cancel,'������');
  cxSetResourceString(@cxNavigatorHint_Refresh,'��������');
  cxSetResourceString(@cxNavigatorHint_SaveBookmark,'���������� ��������');
  cxSetResourceString(@cxNavigatorHint_GotoBookmark,'������� � ��������');
  cxSetResourceString(@cxNavigatorHint_Filter,'������');
  cxSetResourceString(@cxNavigator_DeleteRecordQuestion,'������� ������?');

  //  �������
  cxSetResourceString(@scxUnsupportedExport,'���������������� ��� ��������: %1');
  cxSetResourceString(@scxStyleManagerKill,'Style Manager � ������ ������ ������������ � �� ����� ���� ����������');
  cxSetResourceString(@scxStyleManagerCreate,'���������� ������� style manager');

  cxSetResourceString(@scxExportToHtml ,'������� � Web �������� (*.html)');
  cxSetResourceString(@scxExportToXml  ,'������� � XML �������� (*.xml)');
  cxSetResourceString(@scxExportToText ,'������� � ������ ������ (*.txt)');

  cxSetResourceString(@scxEmptyExportCache,'��� �������� ����');
  cxSetResourceString(@scxIncorrectUnion,'�������� ����������� �����');
  cxSetResourceString(@scxIllegalWidth,'�������� ������ �������');
  cxSetResourceString(@scxInvalidColumnRowCount,'�������� ���������� ����� ���� �������');
  cxSetResourceString(@scxIllegalHeight,'�������� ������ ������');
//  cxSetResourceString(@scxInvalidColumnIndex,'The column index %d out of bounds');
//  cxSetResourceString(@scxInvalidRowIndex,'The row index %d out of bounds');
//  cxSetResourceString(@scxInvalidStyleIndex,'Invalid style index %d');

  cxSetResourceString(@scxExportToExcel,'������� � MS Excel (*.xls)');
  cxSetResourceString(@scxWorkbookWrite,'������ ������ XLS �����');
//  cxSetResourceString(@scxInvalidCellDimension,'Invalid cell dimension');
  cxSetResourceString(@scxBoolTrue ,'True');
  cxSetResourceString(@scxBoolFalse,'False');

  // ������
  cxSetResourceString(@cxSFilterOperatorEqual,'�����');
  cxSetResourceString(@cxSFilterOperatorNotEqual,'�� �����');
  cxSetResourceString(@cxSFilterOperatorLess,'<');
  cxSetResourceString(@cxSFilterOperatorLessEqual,'<=');
  cxSetResourceString(@cxSFilterOperatorGreater,'>');
  cxSetResourceString(@cxSFilterOperatorGreaterEqual,'>=');
  cxSetResourceString(@cxSFilterOperatorLike,'�����');
  cxSetResourceString(@cxSFilterOperatorNotLike,'�� �����');
  cxSetResourceString(@cxSFilterOperatorBetween,'�����');
  cxSetResourceString(@cxSFilterOperatorNotBetween,'�� �����');
  cxSetResourceString(@cxSFilterOperatorInList,'�');
  cxSetResourceString(@cxSFilterOperatorNotInList,'�� �');

  cxSetResourceString(@cxSFilterOperatorYesterday,'�����');
  cxSetResourceString(@cxSFilterOperatorToday,'�������');
  cxSetResourceString(@cxSFilterOperatorTomorrow,'������');

  cxSetResourceString(@cxSFilterOperatorLastWeek,'������� ������');
  cxSetResourceString(@cxSFilterOperatorLastMonth,'������� �����');
  cxSetResourceString(@cxSFilterOperatorLastYear,'������� ���');

  cxSetResourceString(@cxSFilterOperatorThisWeek,'��� ������');
  cxSetResourceString(@cxSFilterOperatorThisMonth,'���� �����');
  cxSetResourceString(@cxSFilterOperatorThisYear,'���� ���');

  cxSetResourceString(@cxSFilterOperatorNextWeek,'����. ������');
  cxSetResourceString(@cxSFilterOperatorNextMonth,'����. �����');
  cxSetResourceString(@cxSFilterOperatorNextYear,'����. ���');

  cxSetResourceString(@cxSFilterAndCaption,'�');
  cxSetResourceString(@cxSFilterOrCaption,'���');
  cxSetResourceString(@cxSFilterNotCaption,'��');
  cxSetResourceString(@cxSFilterBlankCaption,'�����');

  // derived
  cxSetResourceString(@cxSFilterOperatorIsNull,'�����');
  cxSetResourceString(@cxSFilterOperatorIsNotNull,'�� �����');
  cxSetResourceString(@cxSFilterOperatorBeginsWith,'���������� �');
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith,'�� ���������� �');
  cxSetResourceString(@cxSFilterOperatorEndsWith,'�������������');
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith,'�� �������������');
  cxSetResourceString(@cxSFilterOperatorContains,'��������');
  cxSetResourceString(@cxSFilterOperatorDoesNotContain,'�� ��������');
  // filter listbox's values
  cxSetResourceString(@cxSFilterBoxAllCaption,'(���)');
  cxSetResourceString(@cxSFilterBoxCustomCaption,'(������...)');
  cxSetResourceString(@cxSFilterBoxBlanksCaption,'(������)');
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption,'(�� ������)');

  // ������-�������
  // cxFilterBoolOperator
  cxSetResourceString(@cxSFilterBoolOperatorAnd,'�');        // all
  cxSetResourceString(@cxSFilterBoolOperatorOr,'���');          // any
  cxSetResourceString(@cxSFilterBoolOperatorNotAnd,'�� �'); // not all
  cxSetResourceString(@cxSFilterBoolOperatorNotOr,'�� ���');   // not any
  //
  cxSetResourceString(@cxSFilterRootButtonCaption,'������');
  cxSetResourceString(@cxSFilterAddCondition,'���. &�������');
  cxSetResourceString(@cxSFilterAddGroup,'���. &������');
  cxSetResourceString(@cxSFilterRemoveRow,'&�������');
  cxSetResourceString(@cxSFilterClearAll,'�������� &���');
  cxSetResourceString(@cxSFilterFooterAddCondition,'������� ������ ����� �������� �������');

  cxSetResourceString(@cxSFilterGroupCaption,'������������� ��������� ��������');
  cxSetResourceString(@cxSFilterRootGroupCaption,'<������>');
  cxSetResourceString(@cxSFilterControlNullString,'<�����>');

  cxSetResourceString(@cxSFilterErrorBuilding,'�� ���� ��������� ������ �� ���������');

  //FilterDialog
  cxSetResourceString(@cxSFilterDialogCaption,'������ ������');
  cxSetResourceString(@cxSFilterDialogInvalidValue,'�������� ��������');
  cxSetResourceString(@cxSFilterDialogUse,'������������');
  cxSetResourceString(@cxSFilterDialogSingleCharacter,'����������� ��������� ������');
  cxSetResourceString(@cxSFilterDialogCharactersSeries,'����������� ������������������ ��������');
  cxSetResourceString(@cxSFilterDialogOperationAnd,'�');
  cxSetResourceString(@cxSFilterDialogOperationOr,'���');
  cxSetResourceString(@cxSFilterDialogRows,'�������� ������ ���:');

  // FilterControlDialog
  cxSetResourceString(@cxSFilterControlDialogCaption,'����������� �������');
  cxSetResourceString(@cxSFilterControlDialogNewFile,'untitled.flt');
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption,'�������');
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption,'���������');
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption,'&����. ���...');
  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption,'&�������...');
  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption,'&���������');
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption,'OK');
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption,'������');
  cxSetResourceString(@cxSFilterControlDialogFileExt,'flt');
  cxSetResourceString(@cxSFilterControlDialogFileFilter,'������� (*.flt)|*.flt');

  // ����
//  cxSetResourceString(@scxGridRecursiveLevels,'You cannot create recursive levels');

  cxSetResourceString(@scxGridDeletingConfirmationCaption,'�������������');
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText,'������� ������?');
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText,'������� ��������� ������?');

  cxSetResourceString(@scxGridNoDataInfoText,'<��� ������ ��� �����������>');

  cxSetResourceString(@scxGridNewItemRowInfoText,'������� ��� ������� ������');

  cxSetResourceString(@scxGridFilterIsEmpty,'<������ ����>');

  cxSetResourceString(@scxGridCustomizationFormCaption,'���������');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption,'�������');
  cxSetResourceString(@scxGridGroupByBoxCaption,'���������� ������� ���� ��� ����������� �� ���');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption,'���������...');
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint,'������� ��� ������ ������� �������');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption,'������');
  cxSetResourceString(@scxGridBandsQuickCustomizationHint,'������� ��� ������ ������� �����');

  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption,'������');

//  cxSetResourceString(@scxGridConverterIntermediaryMissing,'Missing an intermediary component!'#13#10'Please add a %s component to the form.');
//  cxSetResourceString(@scxGridConverterNotExistGrid,'cxGrid does not exist');
  cxSetResourceString(@scxGridConverterNotExistComponent,'��������� �� ����������');
  cxSetResourceString(@scxImportErrorCaption,'������ �������');

//  cxSetResourceString(@scxNotExistGridView,'Grid view does not exist');
//  cxSetResourceString(@scxNotExistGridLevel,'Active grid level does not exist');
  cxSetResourceString(@scxCantCreateExportOutputFile,'���������� ������� ���� ��� ��������');

//  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem,'ExtLookupComboBox|Represents an ultra-advanced lookup using the QuantumGrid as its drop down control');

//TcxGridPopupMenu
 cxSetResourceString(@cxSGridAlignCenter, '��������� �� ������');
 cxSetResourceString(@cxSGridAlignLeft, '��������� �� ������ ����');
 cxSetResourceString(@cxSGridAlignmentSubMenu, '������������');
 cxSetResourceString(@cxSGridAlignRight, '��������� �� ������� ����');
 cxSetResourceString(@cxSGridAvgMenuItem, '�������');
 cxSetResourceString(@cxSGridBestFit, '��������� ������');
 cxSetResourceString(@cxSGridBestFitAllColumns, '��������� ������ (���� ��������)');
 cxSetResourceString(@cxSGridCountMenuItem, '�����');
 cxSetResourceString(@cxSGridFieldChooser, '����� ��������');
 cxSetResourceString(@cxSGridGroupByBox, '������ �����������');
 cxSetResourceString(@cxSGridGroupByThisField, '������������ �� ����� �������');
 cxSetResourceString(@cxSGridMaxMenuItem, '������������ ��������');
 cxSetResourceString(@cxSGridMinMenuItem, '����������� ��������');
 cxSetResourceString(@cxSGridNone, '���');
 cxSetResourceString(@cxSGridNoneMenuItem, '���');
 cxSetResourceString(@cxSGridRemoveColumn, '������� ���� �������');
 cxSetResourceString(@cxSGridShowFooter, '����');
 cxSetResourceString(@cxSGridShowGroupFooter, '����� �����');
 cxSetResourceString(@cxSGridSortColumnAsc, '����������� �� �����������');
 cxSetResourceString(@cxSGridSortColumnDesc, '����������� �� ��������');
 cxSetResourceString(@cxSGridClearSorting, '����� ����������');
 cxSetResourceString(@cxSGridSumMenuItem, '�����');

end;

end.
