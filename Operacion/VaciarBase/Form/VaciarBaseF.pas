//******************************************************************************
//* DeGsoft GeN                                                                *
//* ===========                                                                *
//* GeN(tm) : ERP Software (http://www.degsoft.com.ar/sistemas/GeN)            *
//* Copyright (c) 2002-2011 by the Degsoft                                     *
//* For more information visit: http://www.degsoft.com.ar                      *
//* This program is free software. You can redistribute it and/or modify       *
//* it under the terms of the GNU General Public License as published by       *
//* the Free Software Foundation; either version 3 of the License.             *
//******************************************************************************

unit VaciarBaseF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBScript, IniFiles;

type
  TVaciarBaseForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListBox1: TListBox;
    Label4: TLabel;
    Borrar: TIBScript;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VaciarBaseForm: TVaciarBaseForm;

implementation

{$R *.dfm}

procedure TVaciarBaseForm.BitBtn1Click(Sender: TObject);
Var
 IniFile :TIniFile;
 Path, BaseDeDatos :string;
begin
 ShortDateFormat:='mm/dd/yyyy';
 // Obtiene la ruta y el nombre de la base de datos
 IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'DeG');
 Path := IniFile.ReadString('BD','Path','');
 if Path = '' then Path := ExtractFilePath(Application.ExeName);
 BaseDeDatos := IniFile.ReadString('BD','DBase','');
 if BaseDeDatos = '' then    BasedeDatos := Path +'GeN.FDB';
 if BaseDeDatos = '' then ShowMessage('Error al cargar Base de Datos')
 else
  begin
   Borrar.Script.Text:='SET NAMES WIN1252; CONNECT '+quotedstr(basededatos)+' USER ''SYSDBA'' PASSWORD ''masterkey''; '+Borrar.Script.Text;
   Borrar.ExecuteScript;
   ShowMessage('Base de Datos Restaurada con �xito!!!');
   Close;
  end;
 IniFile.WriteString('Licencia','Dia',inttostr(1));
 IniFile.WriteString('Licencia','Fecha',datetostr(date));
end;

end.