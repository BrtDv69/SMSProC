unit devex_loc;

interface

uses
  cxFilterDialog, cxNavigator,cxClasses,cxExportStrs,cxFilterConsts,
  cxFilterControlStrs,cxGridStrs, dxBarStrs, cxGridPopUpMenuConsts, cxEditConsts;


procedure localize_cx;

implementation

procedure localize_cx;
begin
  // навигатор
  cxSetResourceString(@cxNavigatorHint_First,'Первая запись');
  cxSetResourceString(@cxNavigatorHint_Prior,'Предыдущая запись');
  cxSetResourceString(@cxNavigatorHint_PriorPage,'Предыдущая страница');
  cxSetResourceString(@cxNavigatorHint_Next,'Следующая запись');
  cxSetResourceString(@cxNavigatorHint_NextPage,'Следующая страница');
  cxSetResourceString(@cxNavigatorHint_Last,'Последняя запись');
  cxSetResourceString(@cxNavigatorHint_Insert,'Вставить');
  cxSetResourceString(@cxNavigatorHint_Delete,'Удалить');
  cxSetResourceString(@cxNavigatorHint_Edit,'Редактировать');
  cxSetResourceString(@cxNavigatorHint_Post,'Записать');
  cxSetResourceString(@cxNavigatorHint_Cancel,'Отмена');
  cxSetResourceString(@cxNavigatorHint_Refresh,'Обновить');
  cxSetResourceString(@cxNavigatorHint_SaveBookmark,'Установить закладку');
  cxSetResourceString(@cxNavigatorHint_GotoBookmark,'Перейти к закладке');
  cxSetResourceString(@cxNavigatorHint_Filter,'Фильтр');
  cxSetResourceString(@cxNavigator_DeleteRecordQuestion,'Удалить запись?');

  //  экспорт
  cxSetResourceString(@scxUnsupportedExport,'Неподдерживаемый тип экспорта: %1');
  cxSetResourceString(@scxStyleManagerKill,'Style Manager в данный момент используется и не может быть освобожден');
  cxSetResourceString(@scxStyleManagerCreate,'Невозможно создать style manager');

  cxSetResourceString(@scxExportToHtml ,'Экспорт в Web страницу (*.html)');
  cxSetResourceString(@scxExportToXml  ,'Экспорт в XML документ (*.xml)');
  cxSetResourceString(@scxExportToText ,'Экспорт в формат текста (*.txt)');

  cxSetResourceString(@scxEmptyExportCache,'Кэш экспорта пуст');
  cxSetResourceString(@scxIncorrectUnion,'Неверное объединение ячеек');
  cxSetResourceString(@scxIllegalWidth,'Неверная ширина колонки');
  cxSetResourceString(@scxInvalidColumnRowCount,'Неверное количество строк либо колонок');
  cxSetResourceString(@scxIllegalHeight,'Неверная высота строки');
//  cxSetResourceString(@scxInvalidColumnIndex,'The column index %d out of bounds');
//  cxSetResourceString(@scxInvalidRowIndex,'The row index %d out of bounds');
//  cxSetResourceString(@scxInvalidStyleIndex,'Invalid style index %d');

  cxSetResourceString(@scxExportToExcel,'Экспорт в MS Excel (*.xls)');
  cxSetResourceString(@scxWorkbookWrite,'Ошибка записи XLS файла');
//  cxSetResourceString(@scxInvalidCellDimension,'Invalid cell dimension');
  cxSetResourceString(@scxBoolTrue ,'True');
  cxSetResourceString(@scxBoolFalse,'False');

  // фильтр
  cxSetResourceString(@cxSFilterOperatorEqual,'равно');
  cxSetResourceString(@cxSFilterOperatorNotEqual,'не равно');
  cxSetResourceString(@cxSFilterOperatorLess,'<');
  cxSetResourceString(@cxSFilterOperatorLessEqual,'<=');
  cxSetResourceString(@cxSFilterOperatorGreater,'>');
  cxSetResourceString(@cxSFilterOperatorGreaterEqual,'>=');
  cxSetResourceString(@cxSFilterOperatorLike,'похож');
  cxSetResourceString(@cxSFilterOperatorNotLike,'не похож');
  cxSetResourceString(@cxSFilterOperatorBetween,'между');
  cxSetResourceString(@cxSFilterOperatorNotBetween,'не между');
  cxSetResourceString(@cxSFilterOperatorInList,'в');
  cxSetResourceString(@cxSFilterOperatorNotInList,'не в');

  cxSetResourceString(@cxSFilterOperatorYesterday,'вчера');
  cxSetResourceString(@cxSFilterOperatorToday,'сегодня');
  cxSetResourceString(@cxSFilterOperatorTomorrow,'завтра');

  cxSetResourceString(@cxSFilterOperatorLastWeek,'прошлая неделя');
  cxSetResourceString(@cxSFilterOperatorLastMonth,'прошлый месяц');
  cxSetResourceString(@cxSFilterOperatorLastYear,'прошлый год');

  cxSetResourceString(@cxSFilterOperatorThisWeek,'эта неделя');
  cxSetResourceString(@cxSFilterOperatorThisMonth,'этот месяц');
  cxSetResourceString(@cxSFilterOperatorThisYear,'этот год');

  cxSetResourceString(@cxSFilterOperatorNextWeek,'след. неделя');
  cxSetResourceString(@cxSFilterOperatorNextMonth,'след. месяц');
  cxSetResourceString(@cxSFilterOperatorNextYear,'след. год');

  cxSetResourceString(@cxSFilterAndCaption,'и');
  cxSetResourceString(@cxSFilterOrCaption,'или');
  cxSetResourceString(@cxSFilterNotCaption,'не');
  cxSetResourceString(@cxSFilterBlankCaption,'пусто');

  // derived
  cxSetResourceString(@cxSFilterOperatorIsNull,'пусто');
  cxSetResourceString(@cxSFilterOperatorIsNotNull,'не пусто');
  cxSetResourceString(@cxSFilterOperatorBeginsWith,'начинается с');
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith,'не начинается с');
  cxSetResourceString(@cxSFilterOperatorEndsWith,'заканчивается');
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith,'не заканчивается');
  cxSetResourceString(@cxSFilterOperatorContains,'содержит');
  cxSetResourceString(@cxSFilterOperatorDoesNotContain,'не содержит');
  // filter listbox's values
  cxSetResourceString(@cxSFilterBoxAllCaption,'(Все)');
  cxSetResourceString(@cxSFilterBoxCustomCaption,'(Другое...)');
  cxSetResourceString(@cxSFilterBoxBlanksCaption,'(Пустые)');
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption,'(Не пустые)');

  // фильтр-контрол
  // cxFilterBoolOperator
  cxSetResourceString(@cxSFilterBoolOperatorAnd,'И');        // all
  cxSetResourceString(@cxSFilterBoolOperatorOr,'ИЛИ');          // any
  cxSetResourceString(@cxSFilterBoolOperatorNotAnd,'НЕ И'); // not all
  cxSetResourceString(@cxSFilterBoolOperatorNotOr,'НЕ ИЛИ');   // not any
  //
  cxSetResourceString(@cxSFilterRootButtonCaption,'Фильтр');
  cxSetResourceString(@cxSFilterAddCondition,'Доб. &Условие');
  cxSetResourceString(@cxSFilterAddGroup,'Доб. &Группу');
  cxSetResourceString(@cxSFilterRemoveRow,'&Удалить');
  cxSetResourceString(@cxSFilterClearAll,'Очистить &Все');
  cxSetResourceString(@cxSFilterFooterAddCondition,'нажмите кнопку чтобы добавить условие');

  cxSetResourceString(@cxSFilterGroupCaption,'удовлетворяет следующим условиям');
  cxSetResourceString(@cxSFilterRootGroupCaption,'<корень>');
  cxSetResourceString(@cxSFilterControlNullString,'<пусто>');

  cxSetResourceString(@cxSFilterErrorBuilding,'Не могу построить фильтр из исходника');

  //FilterDialog
  cxSetResourceString(@cxSFilterDialogCaption,'Другой Фильтр');
  cxSetResourceString(@cxSFilterDialogInvalidValue,'Неверное значение');
  cxSetResourceString(@cxSFilterDialogUse,'Использовать');
  cxSetResourceString(@cxSFilterDialogSingleCharacter,'представить одиночный символ');
  cxSetResourceString(@cxSFilterDialogCharactersSeries,'представить последовательность символов');
  cxSetResourceString(@cxSFilterDialogOperationAnd,'И');
  cxSetResourceString(@cxSFilterDialogOperationOr,'ИЛИ');
  cxSetResourceString(@cxSFilterDialogRows,'Показать строки где:');

  // FilterControlDialog
  cxSetResourceString(@cxSFilterControlDialogCaption,'Построитель фильтра');
  cxSetResourceString(@cxSFilterControlDialogNewFile,'untitled.flt');
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption,'Открыть');
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption,'Сохранить');
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption,'&Сохр. как...');
  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption,'&Открыть...');
  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption,'&Применить');
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption,'OK');
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption,'Отмена');
  cxSetResourceString(@cxSFilterControlDialogFileExt,'flt');
  cxSetResourceString(@cxSFilterControlDialogFileFilter,'Фильтры (*.flt)|*.flt');

  // грид
//  cxSetResourceString(@scxGridRecursiveLevels,'You cannot create recursive levels');

  cxSetResourceString(@scxGridDeletingConfirmationCaption,'Подтверждение');
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText,'Удалить запись?');
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText,'Удалить выбранные записи?');

  cxSetResourceString(@scxGridNoDataInfoText,'<нет данных для отображения>');

  cxSetResourceString(@scxGridNewItemRowInfoText,'Нажмите для вставки строки');

  cxSetResourceString(@scxGridFilterIsEmpty,'<фильтр пуст>');

  cxSetResourceString(@scxGridCustomizationFormCaption,'Настройка');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption,'Колонки');
  cxSetResourceString(@scxGridGroupByBoxCaption,'Перетащите колонку сюда для группировки по ней');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption,'Настроить...');
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint,'Нажмите для выбора видимых колонок');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption,'Группы');
  cxSetResourceString(@scxGridBandsQuickCustomizationHint,'Нажмите для выбора видимых групп');

  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption,'Строки');

//  cxSetResourceString(@scxGridConverterIntermediaryMissing,'Missing an intermediary component!'#13#10'Please add a %s component to the form.');
//  cxSetResourceString(@scxGridConverterNotExistGrid,'cxGrid does not exist');
  cxSetResourceString(@scxGridConverterNotExistComponent,'Компонент не существует');
  cxSetResourceString(@scxImportErrorCaption,'Ошибка импорта');

//  cxSetResourceString(@scxNotExistGridView,'Grid view does not exist');
//  cxSetResourceString(@scxNotExistGridLevel,'Active grid level does not exist');
  cxSetResourceString(@scxCantCreateExportOutputFile,'Невозможно создать файл для экспорта');

//  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem,'ExtLookupComboBox|Represents an ultra-advanced lookup using the QuantumGrid as its drop down control');

//TcxGridPopupMenu
 cxSetResourceString(@cxSGridAlignCenter, 'Выровнять по центру');
 cxSetResourceString(@cxSGridAlignLeft, 'Выровнять по левому краю');
 cxSetResourceString(@cxSGridAlignmentSubMenu, 'Выравнивание');
 cxSetResourceString(@cxSGridAlignRight, 'Выровнять по правому краю');
 cxSetResourceString(@cxSGridAvgMenuItem, 'Среднее');
 cxSetResourceString(@cxSGridBestFit, 'Подогнать ширину');
 cxSetResourceString(@cxSGridBestFitAllColumns, 'Подогнать ширину (всех столбцов)');
 cxSetResourceString(@cxSGridCountMenuItem, 'Всего');
 cxSetResourceString(@cxSGridFieldChooser, 'Выбор столбцов');
 cxSetResourceString(@cxSGridGroupByBox, 'Панель группировки');
 cxSetResourceString(@cxSGridGroupByThisField, 'Группировать по этому столбцу');
 cxSetResourceString(@cxSGridMaxMenuItem, 'Максимальное значение');
 cxSetResourceString(@cxSGridMinMenuItem, 'Минимальное значение');
 cxSetResourceString(@cxSGridNone, 'Нет');
 cxSetResourceString(@cxSGridNoneMenuItem, 'Нет');
 cxSetResourceString(@cxSGridRemoveColumn, 'Удалить этот столбец');
 cxSetResourceString(@cxSGridShowFooter, 'Итог');
 cxSetResourceString(@cxSGridShowGroupFooter, 'Итоги групп');
 cxSetResourceString(@cxSGridSortColumnAsc, 'Сортировать по возрастанию');
 cxSetResourceString(@cxSGridSortColumnDesc, 'Сортировать по убыванию');
 cxSetResourceString(@cxSGridClearSorting, 'Снять сортировку');
 cxSetResourceString(@cxSGridSumMenuItem, 'Сумма');

end;

end.
