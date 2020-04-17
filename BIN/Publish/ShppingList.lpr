program ShppingList;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  lazcontrols,
  frm_main,
  frm_base,
  un_shoplist_setting,
  frm_grid_base,
  frm_brand { you can add units after this };

{$R *.res}

begin
  Application.Title := 'ShopList';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);

  TShopListSetting.GetInstance();

  Application.Run;
end.
