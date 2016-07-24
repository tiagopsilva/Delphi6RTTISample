unit UntRttiHelper;

interface

uses
  Classes, TypInfo, StdCtrls;

type
  TFormParser = class
    class procedure ParseComponentToObject(component: TComponent; obj: TObject);
    class procedure ParseObjectToComponent(obj: TObject; component: TComponent);
    class procedure ParseValueToObject(obj: TObject; propName, value: string);
    class procedure ParseValueToCustomEdit(obj: TObject; propName: string; edit: TCustomEdit);
  end;

implementation

uses
  SysUtils, StrUtils;

{ TFormParser }

class procedure TFormParser.ParseComponentToObject(component: TComponent; obj: TObject);
var
  propName: string;
  value: string;
  prop: PPropInfo;
begin  
  propName := Trim(RightStr(component.Name, 10));

  if component is TCustomEdit then
    ParseValueToObject(obj, propName, TCustomEdit(component).Text);
end;

class procedure TFormParser.ParseObjectToComponent(obj: TObject; component: TComponent);
var
  propName: string;
  value: string;
  prop: PPropInfo;
begin
  propName := Trim(RightStr(component.Name, 10));

  if component is TCustomEdit then
    ParseValueToCustomEdit(obj, propName, component as TCustomEdit)
end;

class procedure TFormParser.ParseValueToObject(obj: TObject; propName, value: string);
var
  classTypeInfo: PTypeInfo;
  prop: PPropInfo;
  typeName: string;
begin
  classTypeInfo := PTypeInfo(obj.ClassInfo);
  
  prop := GetPropInfo(classTypeInfo, propName);

  if prop <> nil then
  begin

    case prop^.PropType^^.Kind of
      tkInteger, tkInt64:
        SetPropValue(obj, propName, value);

      tkChar, tkString, tkWChar, tkLString, tkWString:
        SetPropValue(obj, propName, value);

      tkVariant:
        SetPropValue(obj, propName, value);

      tkFloat:
        begin
          typeName := LowerCase(prop^.PropType^.Name);
          if (typeName = 'tdatetime') or (typeName = 'tdate') or (typeName = 'ttime') then
            SetPropValue(obj, propName, StrToFloat(value))
          else
            SetPropValue(obj, propName, StrToFloat(value));
        end;

      else
        raise Exception.Create('Tipo "' + GetEnumName(TypeInfo(TTypeKind), Ord(prop^.PropType^^.Kind)) + '" ainda não tratado');
    end;

  end;
end;

class procedure TFormParser.ParseValueToCustomEdit(obj: TObject; propName: string; edit: TCustomEdit);
begin

end;

end.
