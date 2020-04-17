unit frm_list;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, sqldb, sqlite3conn, FileUtil, LR_Class, LR_DSet, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, DBGrids, Buttons;

type

  { TFrmList }

  TFrmList = class(TForm)
    BitBtn1: TBitBtn;
    BtnPrice: TBitBtn;
    BtnEdit: TBitBtn;
    BtnReset: TBitBtn;
    DsList: TDataSource;
    DBGridList: TDBGrid;
    frReport1: TfrReport;
    frUserDataset1: TfrUserDataset;
    PnlCenter: TPanel;
    PnlRight: TPanel;
    QryList: TSQLQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ResetLabels;
    procedure LoadList;
    procedure ResizeGrid;
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmList: TFrmList;

implementation

{$R *.lfm}

uses
  rb_data, rb_system, rb_types;

procedure TFrmList.FormCreate(Sender: TObject);
begin
  ResetLabels();
  LoadList();
end;

procedure TFrmList.BitBtn1Click(Sender: TObject);
begin
  frReport1.LoadFromFile(ExtractFileDir(ParamStr(0)) +'/Report/RptList.lrf');
  frReport1.ShowReport;
end;

procedure TFrmList.FormResize(Sender: TObject);
begin
  ResizeGrid();
end;

procedure TFrmList.FormShow(Sender: TObject);
begin
  ResizeGrid();
end;

procedure TFrmList.ResetLabels;
begin
  PnlRight.Caption := '';
  PnlCenter.Caption := '';
end;

procedure TFrmList.LoadList;
begin
  RBData.PrepareQuery(QryList);

  with QryList do
  begin
    SQL.Add('SELECT p.id, p.name, (p.ideal_quantity - p.quantity) as qtd, strftime(''%d/%m/%Y'',tmp.date) AS date, ''R$ '' || pc.value AS value, pc.value as price, s.name AS supermarket ');
    SQL.Add('FROM product p LEFT JOIN (SELECT id, product_id, MAX(date) AS date FROM price GROUP BY product_id) tmp ON tmp.product_id = p.id ');
    SQL.Add('LEFT JOIN price pc ON tmp.id = pc.id LEFT JOIN supermarket s ON s.id = pc.supermarket_id ');
    SQL.Add(' WHERE p.quantity < p.ideal_quantity ORDER BY p.name');
    Open();
  end;
end;

procedure TFrmList.ResizeGrid;
var
  Size: integer;
begin
  Size := DBGridList.Width - 40;
  Size := Size - (DBGridList.Columns[0].Width + DBGridList.Columns[2].Width);
  Size := Size - (DBGridList.Columns[3].Width + DBGridList.Columns[4].Width);
  DBGridList.Columns[1].Width := Size;
end;

end.
