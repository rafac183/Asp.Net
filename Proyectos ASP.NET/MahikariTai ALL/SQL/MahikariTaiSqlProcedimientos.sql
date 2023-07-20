--Listar Nacionalidades
USE db_MahikariTai;

create procedure nacionalidades
as
select nacionality as Nacionalidad from nacionality order by nacionality;

exec nacionalidades;

--Listar Generos

create procedure generos
as
select gender as Genero from gender order by Gender;

exec generos;

--Listar Categorias

create procedure categorias
as
select categoria_name as Categoria from categoria order by categoria_name;

exec categorias;

--Listar Regiones

create procedure regiones
as
select name_region as Regiones from region order by name_region;

exec regiones;

-- Buscar ciudad por regiones

CREATE PROCEDURE searchCiudadesPorRegion
  @nombreRegion varchar(42)
AS
BEGIN
  SELECT c.name_ciudad as "Ciudad"
  FROM ciudad c
  INNER JOIN region r ON c.id_region = r.id_region
  WHERE r.name_region = @nombreRegion;
END;

EXEC searchCiudadesPorRegion @nombreRegion = 'Antofagasta';

--Buscar Comuna por ciudad


CREATE PROCEDURE searchComunasPorCiudad
  @nombreCiudad varchar(50)
AS
BEGIN
  SELECT co.name_comuna AS Comuna
  FROM comuna co
  INNER JOIN ciudad ci ON co.id_ciudad = ci.id_ciudad
  WHERE ci.name_ciudad = @nombreCiudad;
END;

EXEC searchComunasPorCiudad @nombreCiudad = 'Nombre de la ciudad';

--Insertar Direccion

CREATE PROCEDURE insertarDireccion
    @calle varchar(20),
    @numero int,
    @nombre_comuna varchar(50),
    @nombre_ciudad varchar(50),
    @nombre_region varchar(42)
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener el ID de la región
    DECLARE @regionId int
    SELECT @regionId = id_region FROM region WHERE name_region = @nombre_region;

    -- Obtener el ID de la ciudad
    DECLARE @ciudadId int
    SELECT @ciudadId = id_ciudad FROM ciudad WHERE name_ciudad = @nombre_ciudad AND id_region = @regionId;

    -- Obtener el ID de la comuna
    DECLARE @comunaId int
    SELECT @comunaId = id_comuna FROM comuna WHERE name_comuna = @nombre_comuna AND id_ciudad = @ciudadId;

    -- Insertar los datos en la tabla direccion
    INSERT INTO direccion (calle, number, id_comuna)
    VALUES (@calle, @numero, @comunaId);
END


EXEC insertarDireccion 'Santo Domingo', 3093, 'Santiago', 'Santiago', 'Metropolitana de Santiago';
EXEC insertarDireccion 'San Pascual', 443, 'Las Condes', 'Santiago', 'Metropolitana de Santiago';

select * from ciudad

--_________________________________

--Crear Miembro

CREATE PROCEDURE crearMiembro
    @categoria_name varchar(10),
    @nombres varchar(50),
    @first_lastname varchar(20),
    @second_lastname varchar(20),
    @gender varchar(9),
    @rut_user varchar(13),
    @birthdate date,
    @nacionality varchar(20),
    @calle varchar(20),
    @number int,
    @phone_number varchar(10),
    @email varchar(50),
    @hobbies varchar(100),
    @nombre_comuna varchar(50),
    @nombre_ciudad varchar(50),
    @nombre_region varchar(42)
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener el ID de la región
    DECLARE @regionId int
    SELECT @regionId = id_region FROM region WHERE name_region = @nombre_region;

    -- Obtener el ID de la ciudad
    DECLARE @ciudadId int
    SELECT @ciudadId = id_ciudad FROM ciudad WHERE name_ciudad = @nombre_ciudad AND id_region = @regionId;

    -- Obtener el ID de la comuna
    DECLARE @comunaId int
    SELECT @comunaId = id_comuna FROM comuna WHERE name_comuna = @nombre_comuna AND id_ciudad = @ciudadId;

    -- Obtener el ID de la dirección existente
    DECLARE @direccionId int;
    SELECT @direccionId = id_direccion FROM direccion WHERE calle = @calle AND number = @number;

    -- Insertar una nueva dirección si no existe o si la comuna, ciudad o región son distintas
    IF @direccionId IS NULL OR
       EXISTS (SELECT 1 FROM direccion d
               JOIN comuna c ON d.id_comuna = c.id_comuna
               JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
               JOIN region r ON ci.id_region = r.id_region
               WHERE d.id_direccion = @direccionId
                 AND (c.name_comuna <> @nombre_comuna OR
                      ci.name_ciudad <> @nombre_ciudad OR
                      r.name_region <> @nombre_region))
    BEGIN
        INSERT INTO direccion (calle, number, id_comuna)
        VALUES (@calle, @number, @comunaId);

        SET @direccionId = SCOPE_IDENTITY(); -- Obtener el ID de la dirección insertada
    END

    -- Obtener el ID de la categoría
    DECLARE @id_categoria int;
    SET @id_categoria = (SELECT id_categoria FROM categoria WHERE categoria_name = @categoria_name);

    -- Obtener el ID de la nacionalidad
    DECLARE @id_nac int;
    SET @id_nac = (SELECT id_nac FROM nacionality WHERE nacionality = @nacionality);

    -- Obtener el ID del género
    DECLARE @id_gender int;
    SET @id_gender = (SELECT id_gender FROM gender WHERE gender = @gender);

    -- Insertar el nuevo miembro
    INSERT INTO miembro (id_categoria, nombres, first_lastname, second_lastname, id_gender, rut_user, birthdate, id_nac, id_direccion, phone_number, email, hobbies)
    VALUES (@id_categoria, @nombres, @first_lastname, @second_lastname, @id_gender, @rut_user, @birthdate, @id_nac, @direccionId, @phone_number, @email, @hobbies);
END



EXEC crearMiembro @categoria_name = 'Seinenbu', @nombres = 'Rafael Antonio', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.450.698-9', @birthdate = '2002-03-18', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3093, @phone_number = '955229389', @email = 'rafac183antonio@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_ciudad = 'Santiago', @nombre_region = 'Metropolitana de Santiago';

EXEC crearMiembro @categoria_name = 'Seinenbu', @nombres = 'Rafael Alejandro', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.225.588-9', @birthdate = '2003-07-26', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3093, @phone_number = '955229966', @email = 'cordero478@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_ciudad = 'Santiago', @nombre_region = 'Metropolitana de Santiago';

EXEC crearMiembro @categoria_name = 'Shonenbu', @nombres = 'Rafael Ovidio', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.225.588-5', @birthdate = '2003-07-26', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3093, @phone_number = '955229966', @email = 'cordero478@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_ciudad = 'Santiago', @nombre_region = 'Metropolitana de Santiago';

EXEC crearMiembro @categoria_name = 'Seijimbu', @nombres = 'Rafael Jose', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.225.588-1', @birthdate = '2003-07-26', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3093, @phone_number = '955229966', @email = 'cordero478@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_ciudad = 'Santiago', @nombre_region = 'Metropolitana de Santiago';

EXEC crearMiembro @categoria_name = 'Seijimbu', @nombres = 'Gustavo Jose', @first_lastname = 'Correa', @second_lastname = 'Perez', @gender = 'Masculino', @rut_user = '15.152.158-8', @birthdate = '2000-01-05', @nacionality = 'Chilena', @calle = 'San Pablo', @number = 165, @phone_number = '911225544', @email = 'example@example.com', @hobbies = 'Trabajar', @nombre_comuna = 'Santiago', @nombre_ciudad = 'Santiago', @nombre_region = 'Metropolitana de Santiago';


CREATE PROCEDURE modificarMiembro
    @rut_user varchar(13),
    @categoria_name varchar(10),
    @nombres varchar(50),
    @first_lastname varchar(20),
    @second_lastname varchar(20),
    @gender varchar(9),
    @birthdate date,
    @nacionality varchar(20),
    @calle varchar(20),
    @number int,
    @phone_number varchar(10),
    @email varchar(50),
    @hobbies varchar(100),
    @nombre_comuna varchar(50),
    @nombre_ciudad varchar(50),
    @nombre_region varchar(42)
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener el ID de la región
    DECLARE @regionId int
    SELECT @regionId = id_region FROM region WHERE name_region = @nombre_region;

    -- Obtener el ID de la ciudad
    DECLARE @ciudadId int
    SELECT @ciudadId = id_ciudad FROM ciudad WHERE name_ciudad = @nombre_ciudad AND id_region = @regionId;

    -- Obtener el ID de la comuna
    DECLARE @comunaId int
    SELECT @comunaId = id_comuna FROM comuna WHERE name_comuna = @nombre_comuna AND id_ciudad = @ciudadId;

    -- Obtener el ID de la dirección existente
    DECLARE @direccionId int;
    SELECT @direccionId = id_direccion FROM direccion WHERE calle = @calle AND number = @number;

    -- Insertar una nueva dirección si no existe o si la comuna, ciudad o región son distintas
    IF @direccionId IS NULL OR
       EXISTS (SELECT 1 FROM direccion d
               JOIN comuna c ON d.id_comuna = c.id_comuna
               JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
               JOIN region r ON ci.id_region = r.id_region
               WHERE d.id_direccion = @direccionId
                 AND (c.name_comuna <> @nombre_comuna OR
                      ci.name_ciudad <> @nombre_ciudad OR
                      r.name_region <> @nombre_region))
    BEGIN
        INSERT INTO direccion (calle, number, id_comuna)
        VALUES (@calle, @number, @comunaId);

        SET @direccionId = SCOPE_IDENTITY(); -- Obtener el ID de la dirección insertada
    END

    -- Obtener el ID de la categoría
    DECLARE @id_categoria int;
    SET @id_categoria = (SELECT id_categoria FROM categoria WHERE categoria_name = @categoria_name);

    -- Obtener el ID de la nacionalidad
    DECLARE @id_nac int;
    SET @id_nac = (SELECT id_nac FROM nacionality WHERE nacionality = @nacionality);

    -- Obtener el ID del género
    DECLARE @id_gender int;
    SET @id_gender = (SELECT id_gender FROM gender WHERE gender = @gender);

    -- Modificar el miembro existente
    UPDATE miembro
    SET id_categoria = @id_categoria,
        nombres = @nombres,
        first_lastname = @first_lastname,
        second_lastname = @second_lastname,
        id_gender = @id_gender,
        birthdate = @birthdate,
        id_nac = @id_nac,
        id_direccion = @direccionId,
        phone_number = @phone_number,
        email = @email,
        hobbies = @hobbies
    WHERE rut_user = @rut_user;
END

EXEC modificarMiembro @categoria_name = 'Seinenbu', @nombres = 'Rafael Antonio', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.450.698-9', @birthdate = '2002-03-18', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3093, @phone_number = '955229389', @email = 'rafac183antonio@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_ciudad = 'Santiago', @nombre_region = 'Metropolitana de Santiago';

EXEC modificarMiembro @categoria_name = 'Seinenbu', @nombres = 'Rafael Alejandro', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.225.588-9', @birthdate = '2003-07-26', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3093, @phone_number = '955229966', @email = 'cordero478@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_ciudad = 'Santiago', @nombre_region = 'Metropolitana de Santiago';

EXEC crearMiembro @categoria_name = 'Seijimbu', @nombres = 'Gustavo Jose', @first_lastname = 'Correa', @second_lastname = 'Perez', @gender = 'Masculino', @rut_user = '15.152.158-8', @birthdate = '2000-01-05', @nacionality = 'Chilena', @calle = 'San Pablo', @number = 165, @phone_number = '911225544', @email = 'example@example.com', @hobbies = 'Trabajar', @nombre_comuna = 'Santiago', @nombre_ciudad = 'Santiago', @nombre_region = 'Metropolitana de Santiago';


delete from miembro where rut_user = '15.152.158-8'

SELECT * FROM miembro
EXEC allMembers

CREATE PROCEDURE miembroAllInfo
@rut_user varchar(13)
AS
BEGIN
SELECT mi.rut_user AS Rut, mi.nombres AS Nombres, mi.first_lastname as "Apellido Paterno", mi.second_lastname as "Apellido Materno", ge.gender as Genero, cat.categoria_name as "Categoria", mi.email AS Correo, mi.birthdate as "Fecha de Nacimiento", na.nacionality AS Nacionalidad, mi.phone_number AS Telefono, di.calle AS Calle, di.number AS Numero, re.name_region AS Region, ci.name_ciudad AS Ciudad, co.name_comuna AS Comuna, mi.hobbies AS Hobbies
FROM miembro AS mi
JOIN categoria AS cat ON mi.id_categoria = cat.id_categoria
JOIN nacionality AS na ON mi.id_nac = na.id_nac
JOIN direccion AS di ON mi.id_direccion = di.id_direccion
JOIN comuna as co on di.id_comuna = co.id_comuna
JOIN ciudad as ci on co.id_ciudad = ci.id_ciudad
JOIN region as re on ci.id_region = re.id_region
JOIN gender as ge on mi.id_gender = ge.id_gender
WHERE mi.rut_user = @rut_user
END

exec miembroAllInfo @rut_user = '27.225.588-9'

CREATE PROCEDURE eliminarMiembro
@rut_user varchar(13)
AS
BEGIN
DELETE FROM miembro
WHERE rut_user = @rut_user
END

exec eliminarMiembro @rut_user = '1653'

create procedure allMembers
as
SELECT mi.rut_user AS Rut, mi.nombres AS Nombres, mi.first_lastname as "Apellido Paterno", mi.second_lastname as "Apellido Materno", ge.gender as Genero, cat.categoria_name as "Categoria", mi.email AS Correo, mi.birthdate as "Fecha de Nacimiento", na.nacionality AS Nacionalidad, mi.phone_number AS Telefono, di.calle AS Calle, di.number AS Numero, re.name_region AS Region, ci.name_ciudad AS Ciudad, co.name_comuna AS Comuna, mi.hobbies AS Hobbies
FROM miembro AS mi
JOIN categoria AS cat ON mi.id_categoria = cat.id_categoria
JOIN nacionality AS na ON mi.id_nac = na.id_nac
JOIN direccion AS di ON mi.id_direccion = di.id_direccion
JOIN comuna as co on di.id_comuna = co.id_comuna
JOIN ciudad as ci on co.id_ciudad = ci.id_ciudad
JOIN region as re on ci.id_region = re.id_region
JOIN gender as ge on mi.id_gender = ge.id_gender

exec allMembers;


--Cod para reiniciar Contador

DELETE FROM direccion
DBCC CHECKIDENT ('direccion', RESEED, 0);