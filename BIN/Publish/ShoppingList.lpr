program ShoppingList;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, RB_System, lazcontrols, datetimectrls, frm_main, un_shoplist_setting,
  frm_brand, frm_base, frm_grid_base, frm_dialog_base, frm_brand_dlg, rb_data,
  frm_category, frm_category_dlg, frm_supermarket, frm_supermarket_dlg,
  frm_product, frm_price, frm_product_dlg, frm_price_dlg, frm_list;

{$R *.res}

begin
  Application.Title:='ShopList';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);

  TShopListSetting.GetInstance();
  Application.Run;
end.
