unit Misk;

interface

uses
 Classes, FIBDatabase, pFIBDatabase, pFIBQuery, SysUtils, Graphics, XMLIntf,
 XMLDoc, MSXMLDOM, Variants, LbCipher, LbString;

var
 ImmediateUpdate : Boolean = True; // ���� ������������ ���������� ������������
 clrGroups : TColor = $00C8D0D4;
 clrServices : TColor = clNavy;
 clrReadOnly : TColor = clLtGray;
 clrNotValid : TColor = clGray;
 DefParams : TStrings;

function ReportGetSenderName(Sender: TComponent): String;
procedure InitializeConst(Database: TFIBDatabase; Transaction: TFIBTransaction);
procedure WriteDataSetXML(Database: TpFIBDatabase; Transaction: TpFIBTransaction;
                          SQLText,FileName: String);
procedure WriteXMLDataSet(Database: TpFIBDatabase; Transaction: TpFIBTransaction;
                          Node: IXMLNode; SQLText: String);
function GetName(Name : String; MaxLength : Integer): String;

implementation

uses Like, DM;

function ReportGetSenderName(Sender: TComponent): String;
begin
 Result := TfrmLike(Sender.Owner).FName+' - ������';
 If (Pos('List',Sender.Name)>0) then
  Result := Result+' ������'
end;

procedure InitializeConst(Database: TFIBDatabase; Transaction: TFIBTransaction);
 var fibqLocalAux : TpFIBQuery;
     Started : Boolean;
begin
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := Database;
 fibqLocalAux.Transaction := Transaction;
{!! If Not (Transaction.InTransaction) then
  Begin
   Transaction.StartTransaction;
   Started := True
  End
 else
  Started := False;
 fibqLocalAux.SQL.Clear;
 fibqLocalAux.SQL.Add('select D.NAME, J.NAME CHIEF_JOB, P.SURNAME CHIEF_SURNAME, P.NAME CHIEF_NAME, P.SECOND_NAME CHIEF_SECOND_NAME');
 fibqLocalAux.SQL.Add('from DEPARTMENTS D left outer join JOBS J on (J.ID=D.CHIEF_JOB_ID) left outer join PERSONS P');
 fibqLocalAux.SQL.Add('on (P.ID=D.CHIEF_ID) where (D.PARENT_ID is null) and (D.VALID=1)');
 fibqLocalAux.ExecQuery;
 Institution.Name := fibqLocalAux.FieldByName('NAME').AsString;
 Institution.ChiefSignName := fibqLocalAux.FieldByName('CHIEF_SURNAME').AsString+' '+Copy(fibqLocalAux.FieldByName('CHIEF_NAME').AsString,1,1)+'.'+Copy(fibqLocalAux.FieldByName('CHIEF_SECOND_NAME').AsString,1,1)+'.';
 Institution.ChiefJob := fibqLocalAux.FieldByName('CHIEF_JOB').AsString;
 fibqLocalAux.Close;
 fibqLocalAux.Free;
 If (Started) then
  Transaction.Commit
}  
end;

//-----------------------------------------------------------------------//
// ���������� : ���������� ����� ��������
// ��������� :
// nSum : 		�����, ������� ����� ���������� � �������
// cTxt1 :  		������� ���������, ��������: �����
// cTxt2 :  		������� ���������, ��������: �����
// cTxt3 :  		������� ���������, ��������: ������
// nTypeWrite : 	��� ������� ��������� (1-���, 2-���)
//
function CurrencyToStr (nSum : Integer; cTxt1,cTxt2,cTxt3 : String; nTypeWrite : Byte) : String;
Var aTxtMeasure,aTxtThousand,aTxtMillion,aTxtBillion,aTxtTrillion : array [1..3] of String;
    aTxtHundred, aTxtTen, aTxtExclude : array [0..9] of String;
    aTxtOne : array [0..9,1..2] of String;
    aTxtSum, aTextInWords : array [1..5] of String;
    nPos, nPos2, nTypeAddition : Integer;
    cSum, cText : String;
 Begin
 //------------------------------------���������� ��������� ������������-------------------------
 //������� ��������� ������������

 aTxtMeasure[1] := cTxt1;
 aTxtMeasure[2] := cTxt2;
 aTxtMeasure[3] := cTxt3;
 //������
 aTxtThousand[1] := '������';
 aTxtThousand[2] := '������';
 aTxtThousand[3] := '�����';
 //��������
 aTxtMillion[1] := '�������';
 aTxtMillion[2] := '��������';
 aTxtMillion[3] := '���������';
 //��������
 aTxtBillion[1] := '��������';
 aTxtBillion[2] := '���������';
 aTxtBillion[3] := '����������';
 //���������
 aTxtTrillion[1] := '��������';
 aTxtTrillion[2] := '���������';
 aTxtTrillion[3] := '����������';

 //--------------------------------���������� ������� ��������� �����-------------------------
 //������ �������� 0-9 � ������
 aTxtHundred[0] := '';
 aTxtHundred[1] := '���';
 aTxtHundred[2] := '������';
 aTxtHundred[3] := '������';
 aTxtHundred[4] := '���������';
 aTxtHundred[5] := '�������';
 aTxtHundred[6] := '��������';
 aTxtHundred[7] := '�������';
 aTxtHundred[8] := '���������';
 aTxtHundred[9] := '���������';
 //������ �������� 0-9 � ��������
 aTxtTen[0] := '';
 aTxtTen[1] := '';
 aTxtTen[2] := '��������';
 aTxtTen[3] := '��������';
 aTxtTen[4] := '�����';
 aTxtTen[5] := '���������';
 aTxtTen[6] := '����������';
 aTxtTen[7] := '���������';
 aTxtTen[8] := '�����������';
 aTxtTen[9] := '���������';
 //������ �������� ����� 10-19
 aTxtExclude[0] := '������';
 aTxtExclude[1] := '�����������';
 aTxtExclude[2] := '����������';
 aTxtExclude[3] := '����������';
 aTxtExclude[4] := '������������';
 aTxtExclude[5] := '����������';
 aTxtExclude[6] := '�����������';
 aTxtExclude[7] := '����������';
 aTxtExclude[8] := '������������';
 aTxtExclude[9] := '������������';
 //������ �������� 0-9 ��� ������ (��� �������� ��� �������� � �������� ����)
 aTxtOne[0,1]:= '';
 aTxtOne[1,1] := '����';
 aTxtOne[2,1] := '���';
 aTxtOne[3,1] := '���';
 aTxtOne[4,1] := '������';
 aTxtOne[5,1] := '����';
 aTxtOne[6,1] := '�����';
 aTxtOne[7,1] := '����';
 aTxtOne[8,1] := '������';
 aTxtOne[9,1] := '������';
 aTxtOne[0,2] := '';
 aTxtOne[1,2] := '����';
 aTxtOne[2,2] := '���';
 For nPos:=3 to 9 do aTxtOne[nPos,2] := aTxtOne[nPos,1];

 //������� ������ ����������� ����� �� �������
 // 1 - �������
 // 2 - ������
 // 3 - ��������
 // 4 - ���������
 // 5 - ���������
 // aTxtSum[5]
 //��������� ����� � �������� ��� ������
 cSum := IntToStr(nSum);
 //��������� ����� �� ����������� ����� � �������� �� � ������
 For nPos:=1 to 5 do
  For nPos2:=1 to 3 do
   If ((Pred(nPos)*3+nPos2)<=Length(cSum)) then
    aTxtSum[nPos] := cSum[Length(cSum)-(Pred(nPos)*3+Pred(nPos2))]+aTxtSum[nPos]
   Else
    aTxtSum[nPos] := '0'+aTxtSum[nPos];

 //������� ������ ������� �� ����������� ������:
 // 1 - �������
 // 2 - ������
 // 3 - ��������
 // 4 - ���������
 // 5 - ���������
 //������ ��������� �����
 //aTextInWords(5)

 //���� �� ����������� �������
 For nPos:=1 to 5 do
  If (aTxtSum[nPos]='000') then
   aTextInWords[nPos] := ''
  Else
   Begin
    cText := aTxtHundred[StrToInt(aTxtSum[nPos][1])];
    If (aTxtSum[nPos][2]='1') then
     cText := cText+' '+aTxtExclude[StrToInt(aTxtSum[nPos][3])]
    Else
     Begin
      cText := cText+' '+aTxtTen[StrToInt(aTxtSum[nPos][2])];
      If (nPos=2) then
       cText := cText+' '+aTxtOne[StrToInt(aTxtSum[nPos][3]),2]
      Else
       cText := cText+' '+aTxtOne[StrToInt(aTxtSum[nPos][3]),nTypeWrite]
     End;
    //���������� ��� ��������� �����������:
    // 1 = "�����"
    // 2 = "�����"
    // 3 = "������"
    Case aTxtSum[nPos][3] of
     '1'     : nTypeAddition := 1;
     '2'..'4': nTypeAddition := 2;
    Else
     nTypeAddition := 3
    End;
    If (aTxtSum[nPos][2]='1') then nTypeAddition := 3;
    //���������� ��������� ����� ������� ���������
    Case nPos of
     1 : cText := cText+' '+aTxtMeasure[nTypeAddition];
     2 : cText := cText+' '+aTxtThousand[nTypeAddition];
     3 : cText := cText+' '+aTxtMillion[nTypeAddition];
     4 : cText := cText+' '+aTxtBillion[nTypeAddition];
     5 : cText := cText+' '+aTxtTrillion[nTypeAddition]
    End;
    //��������� ������� � ������ ��������� �����
    aTextInWords[nPos] := cText;
   End;
 //�������� ������ ������� � ���� ������
 cText := '';
 For nPos:=5 downto 1 do
  Begin
   If (nPos=1) and (aTxtSum[nPos]='000') then
    aTextInWords[nPos] := aTextInWords[nPos]+aTxtMeasure[3];
   cText := cText+' '+aTextInWords[nPos]
  End;
 //�������� ������ ��������
 While (Pos('  ',cText)>0) do Delete(cText, Pos('  ',cText), 1);
 If (cText[1]=' ') then Delete(cText, 1, 1);
 //������ ������ ������ - ��������� �����
 If (nSum=0) then
  Result := '00 '+aTxtMeasure[3]
 Else
  Begin
   cSum := AnsiUpperCase(cText[1]);
   Delete(cText, 1, 1);
   Result := cSum + cText
  End
End;

procedure WriteDataSetXML(Database: TpFIBDatabase; Transaction: TpFIBTransaction;
                          SQLText,FileName: String);
var
 i: Integer;
 fibqMain : TpFIBQuery;
 NewRecord, Values: IXMLNode;
 XMLDocument: TXMLDocument;
begin
 DeleteFile(FileName);
 fibqMain := TpFIBQuery.Create(Nil);
 fibqMain.Database := Database;
 fibqMain.Transaction := Transaction;
 fibqMain.SQL.Clear;
 fibqMain.SQL.Add(SQLText);
 fibqMain.ExecQuery;
 If Not (fibqMain.Eof) then
  Begin
   XMLDocument := TXMLDocument.Create(Nil);
   XMLDocument.NodeIndentStr := #9;
   XMLDocument.Options := [doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl];
   XMLDocument.DOMVendor := MSXML_DOM;
   XMLDocument.Active := True;
   XMLDocument.Version := '1.0';
   XMLDocument.Encoding := 'WINDOWS-1251';
   XMLDocument.AddChild('ROOT');
   While Not (fibqMain.Eof) do
    Begin
     NewRecord := XMLDocument.DocumentElement.AddChild('RECORD');
     For I := 0 to Pred(fibqMain.FieldCount) do    // Iterate
      Begin
       Values := NewRecord.AddChild(fibqMain.Fields[I].Name);
       Values.Text := fibqMain.Fields[I].AsString
      End;    // for
     fibqMain.Next
    End;    // while
   XMLDocument.SaveToFile(FileName);
   XMLDocument.Active := False
  End;
 fibqMain.Close;
 fibqMain.Free
end;

procedure WriteXMLDataSet(Database: TpFIBDatabase; Transaction: TpFIBTransaction;
                          Node: IXMLNode; SQLText: String);
var
 K: Integer;
 fibqMain : TpFIBQuery;
begin
 fibqMain := TpFIBQuery.Create(Nil);
 fibqMain.Database := Database;
 fibqMain.Transaction := Transaction;
 fibqMain.SQL.Clear;
 fibqMain.SQL.Add(SQLText);
 For K := 0 to Pred(Node.ChildNodes.Count) do    // Iterate
  If (Node.ChildNodes[K].IsTextElement) then
   Begin
    If (fibqMain.FindParam(Node.ChildNodes[K].NodeName)<>nil) then
     Begin
      If (Node.ChildNodes[K].NodeName<>'FOTO') then
       If (Node.ChildNodes[K].Text='') then
        fibqMain.ParamByName(Node.ChildNodes[K].NodeName).AsVariant := Null
       else
        fibqMain.ParamByName(Node.ChildNodes[K].NodeName).AsString := Node.ChildNodes[K].Text
      else
       If (Node.ChildNodes[K].Text='') then
        fibqMain.ParamByName(Node.ChildNodes[K].NodeName).AsVariant := Null
     End
   End;
 fibqMain.ExecQuery;
 fibqMain.Close;
 fibqMain.Free                            
end;

function GetName(Name : String; MaxLength : Integer): String;
 var Key256 : TKey256;
begin
 GenerateLMDKey(Key256, SizeOf(Key256), 'W��w��yW��=`�����yX�f0���84509WyhfjbhJLUGLI,.*&^#');
 Result := Copy(RDLEncryptStringEx(Name, Key256, SizeOf(Key256), True),0,MaxLength)
end;

end.
