CREATE DATABASE db_MahikariTai;

--Direccion Integrante

USE db_MahikariTai;

CREATE TABLE region (
id_region INT NOT NULL IDENTITY PRIMARY KEY,
name_region varchar(50) NOT NULL
);

CREATE TABLE provincia (
id_provincia INT NOT NULL IDENTITY PRIMARY KEY,
name_provincia VARCHAR(40) NOT NULL,
id_region INT NOT NULL REFERENCES region
);

CREATE TABLE comuna (
id_comuna INT NOT NULL IDENTITY PRIMARY KEY,
name_comuna VARCHAR(30) NOT NULL,
id_provincia INT NOT NULL REFERENCES provincia
);

CREATE TABLE direccion (
id_direccion INT NOT NULL IDENTITY PRIMARY KEY,
calle VARCHAR(20) NOT NULL,
number INT NOT NULL,
id_comuna INT NOT NULL REFERENCES comuna
);

--_______________________________________

--Datos Mahikari

--Categoria Integrante

CREATE TABLE categoria (
id_categoria INT NOT NULL IDENTITY PRIMARY KEY,
categoria_name VARCHAR(10) NOT NULL);

--Datos Generales

--Genero

CREATE TABLE gender (
id_gender INT NOT NULL IDENTITY PRIMARY KEY,
gender VARCHAR(9) NOT NULL
);

--Nacionalidad Integrante

CREATE TABLE nacionality (
id_nac INT NOT NULL IDENTITY PRIMARY KEY,
nacionality VARCHAR(20) NOT NULL
);

--Datos Miembro

CREATE TABLE miembro (
id_categoria INT NOT NULL REFERENCES categoria,
nombres VARCHAR(50) NOT NULL,
first_lastname VARCHAR(20) NOT NULL,
second_lastname VARCHAR(20) NOT NULL,
id_gender INT NOT NULL REFERENCES gender,
rut_user VARCHAR(13) NOT NULL PRIMARY KEY,
birthdate DATE NOT NULL,
id_nac INT NOT NULL REFERENCES nacionality,
id_direccion INT NOT NULL REFERENCES direccion,
phone_number VARCHAR(10) NOT NULL,
email VARCHAR(50) NOT NULL,
hobbies VARCHAR(100) NOT NULL
);

--Admision Jun

CREATE TABLE admision (
id_admision INT NOT NULL IDENTITY PRIMARY KEY,
fecha_admision DATE NOT NULL,
rut_user VARCHAR(13) NOT NULL REFERENCES miembro ON DELETE CASCADE
);

--Cargo Miyakusha

CREATE TABLE grupo (
id_grupo INT NOT NULL IDENTITY PRIMARY KEY,
name_grupo VARCHAR(16) NOT NULL
);

CREATE TABLE cargo_names (
id_cargo_name INT NOT NULL IDENTITY PRIMARY KEY,
cargo_name VARCHAR(20) NOT NULL
);

CREATE TABLE cargo (
id_cargo INT NOT NULL IDENTITY PRIMARY KEY,
id_cargo_name INT NOT NULL REFERENCES cargo_names,
id_grupo INT NOT NULL REFERENCES grupo,
rut_user VARCHAR(13) NOT NULL REFERENCES miembro ON DELETE CASCADE
);

--Estudios Miembro y/o Trabajo

--Estudios

CREATE TABLE grado_estudios (
id_grado_estudios INT NOT NULL IDENTITY PRIMARY KEY,
grado_estudios VARCHAR(8) NOT NULL
);

CREATE TABLE estudios (
id_estudios INT NOT NULL IDENTITY PRIMARY KEY,
id_grado_estudios INT NOT NULL REFERENCES grado_estudios,
career_years INT NOT NULL,
career_name VARCHAR(30) NOT NULL,
name_center VARCHAR(50) NOT NULL,
rut_user VARCHAR(13) NOT NULL REFERENCES miembro ON DELETE CASCADE
);

--Trabajo

CREATE TABLE job (
id_job INT NOT NULL IDENTITY PRIMARY KEY,
profession VARCHAR(20) NOT NULL,
occupation VARCHAR(20) NOT NULL,
rut_user VARCHAR(13) NOT NULL REFERENCES miembro ON DELETE CASCADE
);

--Grado Omitama

CREATE TABLE omitama (
id_grado INT NOT NULL IDENTITY PRIMARY KEY,
grado VARCHAR(10) NOT NULL
);

--Familia Miembro

CREATE TABLE familia (
id_familia INT NOT NULL IDENTITY PRIMARY KEY,
name_lastname_parent VARCHAR(70) NOT NULL,
id_grado INT NOT NULL references omitama,
phone_number VARCHAR(10) NOT NULL,
rut_user VARCHAR(13) NOT NULL REFERENCES miembro ON DELETE CASCADE,
gender VARCHAR(1) NOT NULL,
live_with_him VARCHAR(2) NOT NULL
);

--Omitama Con fecha

CREATE TABLE omitama_date (
id_grado_date INT NOT NULL IDENTITY PRIMARY KEY,
id_grado INT NOT NULL REFERENCES omitama,
grado_date DATE NOT NULL,
rut_user VARCHAR(13) NOT NULL REFERENCES miembro ON DELETE CASCADE
);

CREATE TABLE login(
user_name VARCHAR(15) NOT NULL PRIMARY KEY,
clave VARCHAR(50) 
);

exec allmembers;

SELECT di.calle as Calle, di.number as Numero, co.name_comuna as Comuna, pr.name_provincia As Provincia, re.name_region as Region
FROM direccion AS di
JOIN comuna AS co ON di.id_comuna = co.id_comuna
JOIN provincia AS pr ON pr.id_provincia = co.id_provincia
JOIN region AS re ON re.id_region = pr.id_region

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

---------------------------------------------------------------------
---------------------------------------------------------------------

--Primero eliminar la llaves foraneas creadas

-- Modificar la tabla job para agregar ON DELETE CASCADE a la restricción de clave foránea
ALTER TABLE job
ADD CONSTRAINT FK_job_miembro FOREIGN KEY (rut_user)
REFERENCES miembro(rut_user)
ON DELETE CASCADE;

---------------------------------------------------------------------
---------------------------------------------------------------------