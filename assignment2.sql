--create user
CREATE USER C##el_plsqlauca IDENTIFIED BY auca;
GRANT ALL PRIVILEGES TO C##el_plsqlauca;

----create pdb
SHOW con_name;
ALTER SESSION SET container = CDB$ROOT;
CREATE PLUGGABLE DATABASE el_to_delete_pdb
ADMIN USER el_plsqlauca IDENTIFIED BY auca
FILE_NAME_CONVERT = ('C:\ORACLE\ORADATA\ORCL\PDBSEED\', 'C:\Oracle\Oracle21cHOME\el_to_delete_pdb\');

--after creation this is how you connecto to pdb
ALTER SESSION SET CONTAINER = CDB$ROOT;
CONNECT SYS/Hoodie79 AS SYSDBA;
ALTER PLUGGABLE DATABASE el_to_delete_pdb OPEN;
ALTER SESSION SET CONTAINER = el_to_delete_pdb;
ALTER SESSION SET CONTAINER = el_to_delete_pdb;

----delete pdb
CONNECT SYS/Hoodie79 AS SYSDBA;
ALTER SESSION SET CONTAINER = CDB$ROOT;
ALTER PLUGGABLE DATABASE el_to_delete_pdb CLOSE IMMEDIATE;
DROP PLUGGABLE DATABASE el_to_delete_pdb INCLUDING DATAFILES;
SELECT con_id, name, open_mode FROM v$containers;




