insert into login values ('rafac183', '1234');

INSERT INTO cargo_names (cargo_name)
VALUES ('Taicho'), ('FukuTaicho'), ('Buntaicho'), ('FukuBuntaicho');

INSERT INTO cargo (id_cargo_name, rut_user)
VALUES ((SELECT id_cargo_name FROM cargo_names WHERE cargo_name = 'Buntaicho'), '27.450.698-9');

INSERT INTO cargo (id_cargo_name, rut_user)
VALUES ((SELECT id_cargo_name FROM cargo_names WHERE cargo_name = 'Buntaicho'), '27.225.588-9');

INSERT INTO cargo (id_cargo_name, rut_user)
VALUES ((SELECT id_cargo_name FROM cargo_names WHERE cargo_name = 'Taicho'), '15.152.158-8');


select * from login
insert into categoria(categoria_name) values ('Shonenbu');
insert into categoria(categoria_name) values ('Seinenbu');
insert into categoria(categoria_name) values ('Seijimbu');

insert into gender(gender) values ('Masculino');
insert into gender(gender) values ('Femenino');
insert into gender(gender) values ('Otro');

insert into nacionality(nacionality) values ('Venezolana');
insert into nacionality(nacionality) values ('Chilena');
insert into nacionality(nacionality) values('Afgana');
insert into nacionality(nacionality) values('Aleman');
insert into nacionality(nacionality) values('Arabe');
insert into nacionality(nacionality) values('Argentina');
insert into nacionality(nacionality) values('Australiana');
insert into nacionality(nacionality) values('Belga');
insert into nacionality(nacionality) values('Boliviana');
insert into nacionality(nacionality) values('Brasileña');
insert into nacionality(nacionality) values('Camboyana');
insert into nacionality(nacionality) values('Canadiense');
insert into nacionality(nacionality) values('China');
insert into nacionality(nacionality) values('Colombiana');
insert into nacionality(nacionality) values('Coreana');
insert into nacionality(nacionality) values('Costarricense');
insert into nacionality(nacionality) values('Cubana');
insert into nacionality(nacionality) values('Danesa');
insert into nacionality(nacionality) values('Ecuatoriana');
insert into nacionality(nacionality) values('Egipcia');
insert into nacionality(nacionality) values('Salvadoreña');
insert into nacionality(nacionality) values('Escocesa');
insert into nacionality(nacionality) values('Española');
insert into nacionality(nacionality) values('Estadounidense');
insert into nacionality(nacionality) values('Estonia');
insert into nacionality(nacionality) values('Etiope');
insert into nacionality(nacionality) values('Filipina');
insert into nacionality(nacionality) values('Finlandesa');
insert into nacionality(nacionality) values('Francesa');
insert into nacionality(nacionality) values('Galesa');
insert into nacionality(nacionality) values('Griega');
insert into nacionality(nacionality) values('Guatemalteca');
insert into nacionality(nacionality) values('Haitiana');
insert into nacionality(nacionality) values('Holandesa');
insert into nacionality(nacionality) values('Hondureña');
insert into nacionality(nacionality) values('Indonesa');
insert into nacionality(nacionality) values('Inglesa');
insert into nacionality(nacionality) values('Iraqui');
insert into nacionality(nacionality) values('Irani');
insert into nacionality(nacionality) values('Irlandesa');
insert into nacionality(nacionality) values('Israeli');
insert into nacionality(nacionality) values('Japonesa');
insert into nacionality(nacionality) values('Jordana');
insert into nacionality(nacionality) values('Laosiana');
insert into nacionality(nacionality) values('Letona');
insert into nacionality(nacionality) values('Letonesa');
insert into nacionality(nacionality) values('Malaya');
insert into nacionality(nacionality) values('Marroqui');
insert into nacionality(nacionality) values('Mexicana');
insert into nacionality(nacionality) values('Nicaguarense');
insert into nacionality(nacionality) values('Noruega');
insert into nacionality(nacionality) values('Neozelandesa');
insert into nacionality(nacionality) values('Panameña');
insert into nacionality(nacionality) values('Paraguaya');
insert into nacionality(nacionality) values('Peruana');
insert into nacionality(nacionality) values('Polaca');
insert into nacionality(nacionality) values('Portuguesa');
insert into nacionality(nacionality) values('Puertoriqueña');
insert into nacionality(nacionality) values('Dominicana');
insert into nacionality(nacionality) values('Rumana');
insert into nacionality(nacionality) values('Rusa');
insert into nacionality(nacionality) values('Sueca');
insert into nacionality(nacionality) values('Suiza');
insert into nacionality(nacionality) values('Tailandesa');
insert into nacionality(nacionality) values('Taiwanesa');
insert into nacionality(nacionality) values('Turca');
insert into nacionality(nacionality) values('Ucraniana');
insert into nacionality(nacionality) values('Uruguaya');
insert into nacionality(nacionality) values('Vietnamita');