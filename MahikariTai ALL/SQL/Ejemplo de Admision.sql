create database prueba

create table miembro (
id int not null identity primary key,
nombres varchar(50) not null
);

create table admision (
id_admision int not null identity primary key,
fecha_admision varchar(20) not null,
id int not null references miembro
);

insert into miembro (nombres) values ('rafa');
insert into miembro (nombres) values ('anto');
insert into miembro (nombres) values ('elva');
insert into miembro (nombres) values ('andy');
insert into miembro (nombres) values ('ale');

insert into admision (fecha_admision, id) values ('fecha1', '1');
insert into admision (fecha_admision, id) values ('fecha2', '3');
insert into admision (fecha_admision, id) values ('fecha3', '5');

select * from miembro

select * from admision

SELECT nombres as "Nombre", fecha_admision as "Fecha"
FROM miembro
JOIN admision ON miembro.id = admision.id
WHERE admision.fecha_admision IS NULL;

SELECT m.id, m.nombres
FROM miembro m
LEFT JOIN admision a ON m.id = a.id
WHERE a.id IS NULL;