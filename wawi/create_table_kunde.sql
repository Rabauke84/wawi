CREATE DATABASE wawi;

use wawi;

-- auf Spaltenebene definierter Constraint
create table kunde (
	id int IDENTITY NOT NULL,  --IDENTITY => AUTO INCREMENT!
	name char(50) NOT NULL,
	vorname char(50) NOT NULL,
	geschlecht char(1) CONSTRAINT ck_kunde_geschlecht CHECK (geschlecht IN ('M','W')), -- nur w oder m
	strasse char(50) NOT NULL,
	hausnummer int NOT NULL,
	plz int NOT NULL CONSTRAINT ck_kunde_plz CHECK (LEN(plz)=5), -- CHECK KEY, um genau 5-stellige PLZ zu bekommen
	ort char(50) NOT NULL,
	CONSTRAINT pk_kunde PRIMARY KEY(id),
	CONSTRAINT uk_kunde_name_vorname UNIQUE (name, vorname)  -- UNIQUE KEY zusammengesetzt für Name und Vorname
);


INSERT INTO wawi.dbo.kunde
VALUES ('Mustermann','Max','M','Musterstrasse',1,66424,'Homburg');

INSERT INTO wawi.dbo.kunde
VALUES ('Mustermann','Mara','X','Stockwiese',1,66424,'Homburg');

SELECT * from wawi.dbo.kunde;

-- DROP TABLE wawi.dbo.kunde;






create table ware (
	fk_ware int NOT NULL PRIMARY KEY,
	hersteller char(50) NOT NULL,
	sorte char(50) NOT NULL,
	bezeichnung char(50) NOT NULL
);