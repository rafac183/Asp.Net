create database db_MahikariTai;

--Direccion Integrante

use db_MahikariTai;

create table region (
id_region int not null identity primary key,
name_region varchar(50) not null
);

use db_MahikariTai;

create table provincia (
id_provincia int not null identity primary key,
name_provincia varchar(40) not null,
id_region int not null references region
);

use db_MahikariTai;

create table comuna (
id_comuna int not null identity primary key,
name_comuna varchar(30) not null,
id_provincia int not null references provincia
);

use db_MahikariTai;

create table direccion (
id_direccion int not null identity primary key,
calle varchar(20) not null,
number int not null,
id_comuna int not null references comuna
);

--_______________________________________

--Datos Mahikari

--Categoria Integrante

use db_MahikariTai;

create table categoria (
id_categoria int not null identity primary key,
categoria_name varchar(10) not null);

--Grado Omitama

use db_MahikariTai;

create table omitama (
id_grado int not null identity primary key,
grado varchar(10) not null
);

--Datos Generales

--Genero

create table gender (
id_gender int not null identity primary key,
gender varchar(9) not null
);

--Nacionalidad Integrante

use db_MahikariTai

create table nacionality (
id_nac int not null identity primary key,
nacionality varchar(20) not null
);

--Datos Miembro

use db_MahikariTai;

create table miembro (
id_categoria int not null references categoria,
nombres varchar(50) not null,
first_lastname varchar(20) not null,
second_lastname varchar(20),
id_gender int not null references gender,
rut_user varchar(13) not null primary key,
birthdate date not null,
id_nac int not null references nacionality,
id_direccion int not null references direccion,
phone_number varchar(10) not null,
email varchar(50) not null,
hobbies varchar(100) not null
);

--Admision Jun

create table admision (
id_admision int not null identity primary key,
fecha_admision date not null,
rut_user varchar(13) not null references miembro
);

--Cargo Miyakusha

use db_MahikariTai;

create table grupo (
id_grupo int not null identity primary key,
name_grupo varchar(10) not null
);

use db_MahikariTai;

create table cargo_names (
id_cargo_name int not null identity primary key,
cargo_name varchar(20) not null,
id_grupo int not null references grupo
);

use db_MahikariTai;

create table cargo (
id_cargo int not null identity primary key,
id_cargo_name int not null references cargo_names,
rut_user varchar(13) not null references miembro
);

--tabla anterior
--create table cargo (
--id_cargo int not null identity primary key,
--cargo_nombre varchar(50) not null,
--rut_user varchar(13) not null references miembro
--);

--modificaciones
--ALTER TABLE cargo
--DROP COLUMN cargo_nombre;

--alter table cargo
--ADD id_cargo_name int not null REFERENCES cargo_names(id_cargo_name);

--select * from cargo

--Estudios Miembro y/o Trabajo

--Estudios

use db_MahikariTai;

create table grado_estudios (
id_grado_estudios int not null identity primary key,
grado_estudios varchar(8) not null
);

use db_MahikariTai;

create table estudios (
id_estudios int not null identity primary key,
id_grado_estudios int not null references grado_estudios,
career_years int not null,
career_name varchar(30) not null,
name_center varchar(50) not null,
rut_user varchar(13) not null references miembro
);

--Trabajo

use db_MahikariTai;

create table job (
id_job int not null identity primary key,
profession varchar(20) not null,
occupation varchar(20) not null,
rut_user varchar(13) not null references miembro
);

--Familia Miembro

use db_MahikariTai;

create table familia (
id_familia int not null identity primary key,
name_lastname_parent varchar(70) not null,
id_grado int not null references omitama,
phone_number varchar(10) not null,
rut_user varchar(13) not null references miembro,
gender varchar(1) not null,
live_with_him varchar(2) not null
);

--Omitama Con fecha

create table omitama_date (
id_grado_date int not null identity primary key,
grado_name varchar(10) not null,
grado_date date not null,
rut_user varchar(13) not null references miembro
);

create table login(
user_name varchar(15) not null primary key,
clave varchar(50) 
);


SELECT di.calle as Calle, di.number as Numero, co.name_comuna as Comuna, pr.name_provincia As Provincia, re.name_region as Region
FROM direccion AS di
JOIN comuna AS co ON di.id_comuna = co.id_comuna
JOIN provincia AS pr ON pr.id_provincia = co.id_provincia
JOIN region AS re ON re.id_region = pr.id_region
