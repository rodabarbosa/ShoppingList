unit un_shoplist_setting;

{$mode objfpc}{$H+}

interface

uses
  rb_system,
  sqlite3conn, sqldb,
  Classes, Controls, Dialogs, Forms, SysUtils;

type

  { TShopListSetting }

  TShopListSetting = class
  private
    FLastSelectedDate: TDate;
    FLastSupermarketIndex: integer;

    {%H-}
    procedure ConfigureSystem;
    constructor Create;

  public
    property LastSelectedDate: TDate read FLastSelectedDate write FLastSelectedDate;
    property LastSupermarketIndex: integer read FLastSupermarketIndex
      write FLastSupermarketIndex;

    class procedure GetInstance();
    // 0 for new entry
    function OpenBrandEntry(Id: integer): boolean;
    function OpenCategoryEntry(Id: integer): boolean;
    function OpenProductEntry(Id: integer): boolean;
    function OpenPriceEntry(ProductId, Id: integer): boolean;
    function OpenSupermarketEntry(Id: integer): boolean;
    //
    procedure OpenPriceForm(ProductId: integer);
  end;

const
  BRAND_TABLE: string = 'brand';
  CATEGORY_TABLE: string = 'category';
  PRICE_TABLE: string = 'price';
  PRODUCT_TABLE: string = 'product';
  SUPERMARKET_TABLE: string = 'supermarket';

var
  ShopListSetting: TShopListSetting;

implementation

constructor TShopListSetting.Create;
begin
  FLastSelectedDate := now;
  FLastSupermarketIndex := 0;

  ConfigureSystem();
end;

procedure TShopListSetting.ConfigureSystem();
begin
  DateSeparator := '/';
  ShortDateFormat := 'dd/mm/yyyy';
  LongDateFormat := 'd, mmmm yyyy';
  DecimalSeparator := ',';
end;

class procedure TShopListSetting.GetInstance;
begin
  if (ShopListSetting = nil) then
  begin
    ShopListSetting := TShopListSetting.Create;
    TRBApplication.GetInstance();

    RBApplication.AppKey := 'ShopList';
    RBApplication.AppName := 'Gerenciador de compras';
    Application.Title := RBApplication.AppKey;

    RBApplication.LoadDatabaseConnection();
  end;
end;

function TShopListSetting.OpenBrandEntry(Id: integer): boolean;
begin
  Result := False;
end;

function TShopListSetting.OpenCategoryEntry(Id: integer): boolean;
begin
  Result := False;
end;

function TShopListSetting.OpenProductEntry(Id: integer): boolean;
begin
  Result := False;
end;

function TShopListSetting.OpenPriceEntry(ProductId, Id: integer): boolean;
begin
  Result := False;
end;

function TShopListSetting.OpenSupermarketEntry(Id: integer): boolean;
begin
  Result := False;
end;

procedure TShopListSetting.OpenPriceForm(ProductId: integer);
begin

end;

end.
