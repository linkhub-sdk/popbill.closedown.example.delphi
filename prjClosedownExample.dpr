program prjClosedownExample;

uses
  Forms,
  Example in 'Example.pas' {frmExample},
  PopbillClosedown in 'PopbillClosedown\PopbillClosedown.pas',
  Popbill in 'Popbill\Popbill.pas',
  Linkhub in 'Linkhub\Linkhub.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmExample, frmExample);
  Application.Run;
end.
