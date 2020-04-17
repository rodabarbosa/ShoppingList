unit frm_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Menus, ActnList;

type

  { TFrmMain }

  TFrmMain = class(TForm)
    ActExit: TAction;
    ActPrint: TAction;
    ActListMain: TActionList;
    ImgListMain: TImageList;
    MnMain: TMainMenu;
    MnItemExit: TMenuItem;
    MnItemRegister: TMenuItem;
    PnlCentral: TPanel;
    PnlTop: TPanel;
    procedure ActExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure LoadListFrame;
    procedure ResetLabels;
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.lfm}

uses
  frm_list,
  rb_system;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  ResetLabels();
  LoadListFrame();
end;

procedure TFrmMain.ActExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.ResetLabels;
begin
  PnlCentral.Caption := '';
  PnlTop.Caption := '';
end;

procedure TFrmMain.LoadListFrame;
var
  Frame: TFrmList;
begin
  try
    Frame := TFrmList.Create(Application);
    RBWindow.FormInPanel(Frame, PnlCentral);

  except
    on E: Exception do
      RBWindow.ShowErrorMessage(E.Message);
  end;
end;

end.

