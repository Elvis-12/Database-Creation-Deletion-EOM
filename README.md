# -Database-Creation-Deletion-EOM


The purpose of this project is to demonstrate proficiency in managing Oracle Pluggable Databases (PDBs). This report covers three key tasks: creating a new PDB for class activities, creating and subsequently deleting another PDB, and configuring Oracle Enterprise Manager to monitor these databases.

### 1. Creating a New User with Full Privileges:

```sql
CREATE USER C##el_plsqlauca IDENTIFIED BY auca;
GRANT ALL PRIVILEGES TO C##el_plsqlauca;
```

. A new user C##el_plsqlauca is created in the Container Database (CDB) with the password auca.

. All privileges are granted to this user.

### 2. Creating a Pluggable Database (PDB):

```sql
SHOW con_name;
ALTER SESSION SET container = CDB$ROOT;
CREATE PLUGGABLE DATABASE el_to_delete_pdb
ADMIN USER el_plsqlauca IDENTIFIED BY auca
FILE_NAME_CONVERT = ('C:\ORACLE\ORADATA\ORCL\PDBSEED\', 'C:\Oracle\Oracle21cHOME\el_to_delete_pdb\');
```

. Displays the current container name using SHOW con_name.

. Switches the session to the root container (CDB$ROOT).

. Creates a PDB named el_to_delete_pdb, using C##el_plsqlauca as the admin user, and specifies the file path for the new PDB’s data files.

### 3.Connecting to the New PDB:

```sql
ALTER SESSION SET CONTAINER = CDB$ROOT;
CONNECT SYS/Hoodie79 AS SYSDBA;
ALTER PLUGGABLE DATABASE el_to_delete_pdb OPEN;
ALTER SESSION SET CONTAINER = el_to_delete_pdb;
```

. Switches back to CDB$ROOT.

. Connects to the database as SYSDBA using the credentials SYS/Hoodie79.

. Opens the new PDB el_to_delete_pdb.

. Switches the session to the new PDB el_to_delete_pdb.

### 4. Dropping the Pluggable Database:

```sql
CONNECT SYS/Hoodie79 AS SYSDBA;
ALTER SESSION SET CONTAINER = CDB$ROOT;
ALTER PLUGGABLE DATABASE el_to_delete_pdb CLOSE IMMEDIATE;
DROP PLUGGABLE DATABASE el_to_delete_pdb INCLUDING DATAFILES;
SELECT con_id, name, open_mode FROM v$containers;
```

. Connects again as SYSDBA.

. Switches back to CDB$ROOT.

. Closes the PDB el_to_delete_pdb immediately.

. Drops the PDB along with its data files.

. Finally, the SELECT query lists all containers with their con_id, name, and open_mode from the v$containers view, to verify the status of remaining databases.

