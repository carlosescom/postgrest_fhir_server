alter table patient alter column txid set default 0;

alter table patient alter column status set default 'created';


alter table practitioner alter column txid set default 0;

alter table practitioner alter column status set default 'created';


alter table diagnosticreport alter column txid set default 0;

alter table diagnosticreport alter column status set default 'created';