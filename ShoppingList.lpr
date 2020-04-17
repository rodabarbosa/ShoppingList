program ShoppingList;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, RB_System, lazcontrols, datetimectrls, un_shoplist_setting,
  rb_data,
  frm_main, frm_list;

{$R *.res}

begin
  Application.Title:='ShopList';
  RequireDerivedFormResource := True;
  Application.Initialize;

  TShopListSetting.GetInstance();
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
