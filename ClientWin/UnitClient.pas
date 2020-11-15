unit UnitClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Backend.EMSProvider,
  REST.Backend.ServiceTypes, System.JSON, REST.Backend.EMSServices,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,
  REST.Backend.EndPoint, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  REST.Response.Adapter, REST.Types, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    EMSProvider1: TEMSProvider;
    BackendEndpoint1: TBackendEndpoint;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    ClientDataSet1: TClientDataSet;
    Label1: TLabel;
    Label2: TLabel;
    NickEdit: TEdit;
    GameEdit: TEdit;
    ClientDataSet2: TClientDataSet;
    BackendEndpoint2: TBackendEndpoint;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    RefreshUserButton: TButton;
    ApplyChangesUsers: TButton;
    DBGrid2: TDBGrid;
    RefreshGamesData: TButton;
    ApplyChangesGames: TButton;
    DataSource2: TDataSource;
    BackendEndpoint3: TBackendEndpoint;
    RESTResponse3: TRESTResponse;
    BackendEndpoint4: TBackendEndpoint;
    RESTResponse4: TRESTResponse;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure RefreshUserButtonClick(Sender: TObject);
    procedure RefreshGamesDataClick(Sender: TObject);
    procedure ApplyChangesUsersClick(Sender: TObject);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure ClientDataSet2AfterPost(DataSet: TDataSet);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure ApplyChangesGamesClick(Sender: TObject);
  private
    { Private declarations }
    UserValue: integer;
    UserNickname, UserGame: string;
    ChangesUsersObject: TJSONArray;
    ChangesGamesObject: TJSONArray;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.ApplyChangesGamesClick(Sender: TObject);
begin
  BackendEndpoint4.AddBody(TJSONObject.Create(TJSONPair.Create('elements', ChangesGamesObject)));
  BackendEndpoint4.Execute;
  ChangesGamesObject:= TJSONArray.Create;
end;

procedure TForm1.ApplyChangesUsersClick(Sender: TObject);
var s: string;
begin
  BackendEndpoint3.AddBody(TJSONObject.Create(TJSONPair.Create('elements', ChangesUsersObject)));
  BackendEndpoint3.Execute;
  ChangesUsersObject:= TJSONArray.Create;
end;

procedure TForm1.ClientDataSet1AfterPost(DataSet: TDataSet);
var cur_name, old_name: string;
id:integer;
cur_value: integer;
ChangesJSONObject, NewData: TJSONObject;
begin
  cur_name:= ClientDataSet1.FieldByName('NAME').AsString;
  cur_value:= ClientDataSet1.FieldByName('VALUE').AsInteger;
  id:= ClientDataSet1.FieldByName('ID').AsInteger;
  old_name:= NickEdit.Text;

  ChangesJSONObject:= TJSONObject.Create;
  NewData:= TJSONObject.Create;

  if ((cur_name <> old_name) and (old_name <> '')) or ((cur_value <> UserValue) and (UserValue <> -228)) then begin
    ChangesJSONObject.AddPair('old', TJSONNumber.Create(id));
    NewData.AddPair('NAME', cur_name);
    NewData.AddPair('VALUE', TJSONNumber.Create(cur_value));

    ChangesJSONObject.AddPair('new', NewData);
    ChangesUsersObject.Add(ChangesJSONObject);
    UserValue:= cur_value;
    NickEdit.Text:= cur_name;
  end;
end;


procedure TForm1.ClientDataSet2AfterPost(DataSet: TDataSet);
var cur_name, cur_game: string;
ChangesJSONObject, NewData: TJSONObject;
begin
  cur_name:= ClientDataSet2.FieldByName('NICKNAME').AsString;
  cur_game:= ClientDataSet2.FieldByName('GAME').AsString;

  ChangesJSONObject:= TJSONObject.Create;
  NewData:= TJSONObject.Create;

  if ((cur_name <> UserNickname) and (UserNickname <> '')) or ((cur_game <> UserGame) and (UserGame <> '')) then begin
    ChangesJSONObject.AddPair('old', UserNickname);
    NewData.AddPair('NICKNAME', cur_name);
    NewData.AddPair('GAME', cur_game);

    ChangesJSONObject.AddPair('new', NewData);
    ChangesGamesObject.Add(ChangesJSONObject);
    UserNickname:= cur_name;
    UserGame:= cur_game;
  end;
  Edit1.Text:= UserNickname;
  Edit2.Text:= UserGame;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
var name, game: string;
begin
  name:= ClientDataSet1.FieldByName('NAME').AsString;
  UserValue:= ClientDataSet1.FieldByName('VALUE').AsInteger;

  ClientDataSet2.First;
  while not ClientDataSet2.Eof do begin
   if ClientDataSet2.FieldByName('NICKNAME').AsString = name then game:= ClientDataSet2.FieldByName('GAME').AsString;
   ClientDataSet2.Next;
  end;
  NickEdit.Text:= name;
  GameEdit.Text:= game;
end;

procedure TForm1.DBGrid2CellClick(Column: TColumn);
begin
  UserNickname:= ClientDataSet2.FieldByName('NICKNAME').AsString;
  UserGame:= ClientDataSet2.FieldByName('GAME').AsString;
  Edit1.Text:= UserNickname;
  Edit2.Text:= UserGame;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  UserValue:= -228;
  ChangesUsersObject:= TJSONArray.Create;
  ChangesGamesObject:= TJSONArray.Create;
  BackendEndpoint1.Execute;
  BackendEndpoint2.Execute;
end;


procedure TForm1.RefreshGamesDataClick(Sender: TObject);
begin
  ChangesGamesObject:= TJSONArray.Create;
  BackendEndpoint2.Execute;
end;

procedure TForm1.RefreshUserButtonClick(Sender: TObject);
begin
  ChangesUsersObject:= TJSONArray.Create;
  BackendEndpoint1.Execute;
end;

end.
