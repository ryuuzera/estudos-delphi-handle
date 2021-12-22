unit IniciaFrontys;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, IniFiles, Vcl.WinXCtrls,
  Vcl.StdCtrls;

type
  TfrmIniciaFrontys = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lbStatus: TLabel;
    Label1: TLabel;
    Atividade: TActivityIndicator;
    Label2: TLabel;
    TimerSelecionaBase: TTimer;
    TimerLogin: TTimer;
    procedure TimerSelecionaBaseTimer(Sender: TObject);
    procedure TimerLoginTimer(Sender: TObject);
  private
    { Private declarations }
    HandleSelecionaBase,
    HandleLogin,
    HandlePrincipal: HWND;
    procedure ConfiguraAtualizacaoCampos;
    procedure CapturarHandle;
    procedure SelecionaBaseDados;
    procedure EfetuaLogin;
    procedure InicializarFrontys;
  public
    { Public declarations }
  end;

var
  frmIniciaFrontys: TfrmIniciaFrontys;

implementation

uses
  FireDAC.Comp.Client;

{$R *.dfm}

{ TfrmIniciaFrontys }

procedure TfrmIniciaFrontys.CapturarHandle;
begin

  HandleSelecionaBase := FindWindowW(nil, 'Selecione a Empresa');
  HandleLogin         := FindWindowW('TfrmAutenticacaoUsuario', nil);
  HandlePrincipal     := FindWindowW('TfrmPrincipal', nil);
  TimerSelecionaBase.Enabled := True;



//    if HandlePrincipal > 0 then
//    begin
//     ShowWindow(HandlePrincipal, SW_HIDE);
//     CloseHandle(HandlePrincipal);
//    end;

end;

procedure TfrmIniciaFrontys.SelecionaBaseDados;
begin
  if HandleSelecionaBase > 0 then
  begin
    TimerSelecionaBase.Enabled := False;
    SetForegroundWindow(HandleSelecionaBase);
    keybd_event(VK_RETURN, 0, 0, 0);
    keybd_event(VK_RETURN, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    TimerLogin.Enabled := True;
  end;
end;

procedure TfrmIniciaFrontys.TimerLoginTimer(Sender: TObject);
begin
  EfetuaLogin;
end;

procedure TfrmIniciaFrontys.TimerSelecionaBaseTimer(Sender: TObject);
begin

  SelecionaBaseDados;
end;

procedure TfrmIniciaFrontys.ConfiguraAtualizacaoCampos;
var
  ConfigAtu : TIniFile;
begin
  ConfigAtu := TIniFile.Create('C:\Frontys\Bin\ConfigAtu.ini');
  try
    ConfigAtu.WriteBool('Config', 'Campos', False);
    ConfigAtu.WriteBool('Config', 'Parametros', False);
  finally
    ConfigAtu.Free;
  end;
end;

procedure TfrmIniciaFrontys.EfetuaLogin;
begin
  if HandleLogin > 0 then
  begin
    SetForegroundWindow(HandleLogin);
    keybd_event(Ord('1'), 0, 0, 0);
    keybd_event(Ord('1'), 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(VK_RETURN, 0, 0, 0);
    keybd_event(VK_RETURN, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(Ord('1'), 0, 0, 0);
    keybd_event(Ord('1'), 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(Ord('2'), 0, 0, 0);
    keybd_event(Ord('2'), 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(Ord('3'), 0, 0, 0);
    keybd_event(Ord('3'), 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(Ord('2'), 0, 0, 0);
    keybd_event(Ord('2'), 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(Ord('5'), 0, 0, 0);
    keybd_event(Ord('5'), 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(Ord('6'), 0, 0, 0);
    keybd_event(Ord('6'), 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(VK_RETURN, 0, 0, 0);
    keybd_event(VK_RETURN, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;

procedure TfrmIniciaFrontys.InicializarFrontys;
begin
  ConfiguraAtualizacaoCampos;
  CapturarHandle;
end;

end.
