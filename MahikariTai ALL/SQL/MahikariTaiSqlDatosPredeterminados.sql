USE db_MahikariTai;

INSERT INTO cargo_names VALUES('Taicho'),('Fuku-Taicho'),('Shomu'),('Buntaicho'),('Fuku-Buntaicho');

INSERT INTO grupo VALUES('Shonenbu'),('Jun Taiin'),('Taiin'),('Taiin Masculino'),('Taiin Femenino'),('Todo el Grupo');

insert into login values ('rafac183', '1234');

insert into categoria(categoria_name) values ('Shonenbu');
insert into categoria(categoria_name) values ('Seinenbu');
insert into categoria(categoria_name) values ('Seijimbu');

insert into gender(gender) values ('Masculino');
insert into gender(gender) values ('Femenino');
insert into gender(gender) values ('Otro');

insert into nacionality(nacionality) values ('Venezolana'),
	('Chilena'),
	('Afgana'),
	('Aleman'),
	('Arabe'),
	('Argentina'),
	('Australiana'),
	('Belga'),
	('Boliviana'),
	('Brasile�a'),
	('Camboyana'),
	('Canadiense'),
	('China'),
	('Colombiana'),
	('Coreana'),
	('Costarricense'),
	('Cubana'),
	('Danesa'),
	('Ecuatoriana'),
	('Egipcia'),
	('Salvadore�a'),
	('Escocesa'),
	('Espa�ola'),
	('Estadounidense'),
	('Estonia'),
	('Etiope'),
	('Filipina'),
	('Finlandesa'),
	('Francesa'),
	('Galesa'),
	('Griega'),
	('Guatemalteca'),
	('Haitiana'),
	('Holandesa'),
	('Hondure�a'),
	('Indonesa'),
	('Inglesa'),
	('Iraqui'),
	('Irani'),
	('Irlandesa'),
	('Israeli'),
	('Japonesa'),
	('Jordana'),
	('Laosiana'),
	('Letona'),
	('Letonesa'),
	('Malaya'),
	('Marroqui'),
	('Mexicana'),
	('Nicaguarense'),
	('Noruega'),
	('Neozelandesa'),
	('Paname�a'),
	('Paraguaya'),
	('Peruana'),
	('Polaca'),
	('Portuguesa'),
	('Puertorique�a'),
	('Dominicana'),
	('Rumana'),
	('Rusa'),
	('Sueca'),
	('Suiza'),
	('Tailandesa'),
	('Taiwanesa'),
	('Turca'),
	('Ucraniana'),
	('Uruguaya'),
	('Vietnamita');

INSERT INTO omitama (grado) VALUES ('Superior'),('Intermedio'),('Inicial');