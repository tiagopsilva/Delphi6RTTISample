unit UntCustomDAO;

interface

uses
  IBQuery;

type
  TCustomDAO = class
  protected
    function CreateQuery(sql: string = ''): TIBQuery;
  protected
    procedure ParseQueryRecordToObject(qry: TIBQuery; obj: TObject);
    procedure ParseDataChangedToQryInsert(qryAtual, qryInsert: TIBQuery; obj: TObject);
  end;

implementation

uses
  UntDm, SysUtils, DB, TypInfo;

{ TCustomDAO }

function TCustomDAO.CreateQuery(sql: string): TIBQuery;
begin
  result := TIBQuery.Create(nil);
  result.Database := Dm.IdbIntsys;
  if Trim(sql) <> '' then
    result.SQL.Text := sql;
end;

procedure TCustomDAO.ParseQueryRecordToObject(qry: TIBQuery; obj: TObject);
var
 classTypeInfo: PTypeInfo;
 index: integer;
 field: TField;
 prop: PPropInfo;
 typeName: string;
begin
  classTypeInfo := PTypeInfo(obj.ClassInfo);
  for index := 0 to pred(qry.FieldCount) do
  begin
    field := qry.Fields[index];
    prop := GetPropInfo(classTypeInfo, field.FieldName);

    if prop = nil then
      continue;

    case prop^.PropType^^.Kind of
      tkInteger, tkInt64:
        SetPropValue(obj, field.FieldName, field.AsInteger);

      tkChar, tkString, tkWChar, tkLString, tkWString:
        SetPropValue(obj, field.FieldName, field.AsString);

      tkVariant:
        SetPropValue(obj, field.FieldName, field.AsVariant);

      tkFloat:
        begin
          typeName := LowerCase(prop^.PropType^.Name);
          if (typeName = 'tdatetime') or (typeName = 'tdate') or (typeName = 'ttime') then
            SetPropValue(obj, field.FieldName, field.AsDateTime)
          else
            SetPropValue(obj, field.FieldName, field.AsFloat);
        end;
        
      else
        raise Exception.Create('Tipo "' + GetEnumName(TypeInfo(TTypeKind), Ord(prop^.PropType^^.Kind)) + '" ainda não tratado');
    end;
  end;
end;

procedure TCustomDAO.ParseDataChangedToQryInsert(qryAtual, qryInsert: TIBQuery; obj: TObject);
var
  classTypeInfo: PTypeInfo;
  index: integer;
  field: TField;
  param: TParam;
  prop: PPropInfo;
  propValue: string;
begin
  classTypeInfo := PTypeInfo(obj.ClassInfo);
  for index := 0 to pred(qryAtual.FieldCount) do
  begin
    field := qryAtual.Fields[index];
    param := qryInsert.Params.FindParam(field.FieldName);

    if param = nil then
      continue;

    prop := GetPropInfo(classTypeInfo, field.FieldName);
    if prop = nil then
      continue;

    propValue := GetPropValue(obj, field.FieldName);
    if field.AsString <> propValue then
    begin
      case prop^.PropType^^.Kind of
         tkInteger, tkChar, tkWChar, tkClass:
           param.AsInteger := GetOrdProp(obj, prop);

         tkFloat:
           param.AsFloat := GetFloatProp(obj, prop);

         tkString, tkLString:
           param.AsString := GetStrProp(obj, prop);
         tkWString:
           param.AsString := GetWideStrProp(obj, prop);
         tkVariant:
           param.Value := GetVariantProp(obj, prop);
         tkInt64:
           param.AsInteger := GetInt64Prop(obj, prop);

         else
           raise Exception.Create('Tipo "' + GetEnumName(TypeInfo(TTypeKind), Ord(prop^.PropType^^.Kind)) + '" ainda não tratado');
      end;
    end
    else
    begin
      param.Value := field.Value;
    end;
  end;
end;

end.
