unit UntLibrary;

interface

function IsEmpty(value: string): boolean;

function IIf(condition: boolean; trueValue, falseValue: string): string; overload;
function IIf(condition: boolean; trueValue, falseValue: integer): integer; overload;

implementation

uses
  SysUtils;

function IsEmpty(value: string): boolean;
begin
  result := Trim(value) = '';
end;

function IsPopulated(value: string): boolean;
begin
  result := not IsEmpty(value);
end;

function IIf(condition: boolean; trueValue, falseValue: string): string;
begin
  if condition then
    result := trueValue
  else
    result := falseValue;
end;

function IIf(condition: boolean; trueValue, falseValue: integer): integer;
begin
  if condition then
    result := trueValue
  else
    result := falseValue;
end;

end.
