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
BEGIN
	select categoria_name as Categoria from categoria order by categoria_name;
END

exec categorias;

--_________________________________

--Crear Integrante

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
    @nombre_provincia varchar(50),
    @nombre_region varchar(42)
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener o insertar la ID de la región
    DECLARE @regionId int
    SELECT @regionId = id_region FROM region WHERE name_region = @nombre_region;

    IF @regionId IS NULL
    BEGIN
        INSERT INTO region (name_region) VALUES (@nombre_region);
        SET @regionId = SCOPE_IDENTITY();
    END

    -- Obtener o insertar la ID de la provincia
    DECLARE @provinciaId int
    SELECT @provinciaId = id_provincia FROM provincia WHERE name_provincia = @nombre_provincia AND id_region = @regionId;

    IF @provinciaId IS NULL
    BEGIN
        INSERT INTO provincia (name_provincia, id_region) VALUES (@nombre_provincia, @regionId);
        SET @provinciaId = SCOPE_IDENTITY();
    END

    -- Obtener o insertar la ID de la comuna
    DECLARE @comunaId int
    SELECT @comunaId = id_comuna FROM comuna WHERE name_comuna = @nombre_comuna AND id_provincia = @provinciaId;

    IF @comunaId IS NULL
    BEGIN
        INSERT INTO comuna (name_comuna, id_provincia) VALUES (@nombre_comuna, @provinciaId);
        SET @comunaId = SCOPE_IDENTITY();
    END

    -- Obtener el ID de la dirección existente
    DECLARE @direccionId int;
    SELECT @direccionId = id_direccion FROM direccion WHERE calle = @calle AND number = @number;

    -- Insertar una nueva dirección si no existe o si la comuna, ciudad o región son distintas
    IF @direccionId IS NULL OR
       EXISTS (SELECT 1 FROM direccion d
               JOIN comuna c ON d.id_comuna = c.id_comuna
               JOIN provincia pr ON c.id_provincia = pr.id_provincia
               JOIN region r ON pr.id_region = r.id_region
               WHERE d.id_direccion = @direccionId
                 AND (c.name_comuna <> @nombre_comuna OR
                      pr.name_provincia <> @nombre_provincia OR
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

--Ejemplos

EXEC crearMiembro @categoria_name = 'Seinenbu', @nombres = 'Rafael Antonio', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.450.698-9', @birthdate = '2002-03-18', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3093, @phone_number = '955229389', @email = 'rafac183antonio@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_provincia = 'Provincia de Santiago', @nombre_region = 'Región Metropolitana';

EXEC crearMiembro @categoria_name = 'Seinenbu', @nombres = 'Rafael Alejandro', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.225.588-9', @birthdate = '2003-07-26', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3093, @phone_number = '955229966', @email = 'cordero478@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_provincia = 'Provincia de Santiago', @nombre_region = 'Región Metropolitana';

EXEC crearMiembro @categoria_name = 'Shonenbu', @nombres = 'Rafael Ovidio', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.225.588-5', @birthdate = '2003-07-26', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3093, @phone_number = '955229966', @email = 'cordero478@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_provincia = 'Provincia de Santiago', @nombre_region = 'Región Metropolitana';

EXEC crearMiembro @categoria_name = 'Seijimbu', @nombres = 'Rafael Jose', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.225.588-1', @birthdate = '2003-07-26', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3093, @phone_number = '955229966', @email = 'cordero478@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_provincia = 'Provincia de Santiago', @nombre_region = 'Región Metropolitana';

EXEC crearMiembro @categoria_name = 'Seijimbu', @nombres = 'Gustavo Jose', @first_lastname = 'Correa', @second_lastname = 'Perez', @gender = 'Masculino', @rut_user = '15.152.158-8', @birthdate = '2000-01-05', @nacionality = 'Chilena', @calle = 'San Pablo', @number = 165, @phone_number = '911225544', @email = 'example@example.com', @hobbies = 'Trabajar', @nombre_comuna = 'Santiago', @nombre_provincia = 'Provincia de Santiago', @nombre_region = 'Región Metropolitana';

--Modicicar integrante

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
    @nombre_provincia varchar(50),
    @nombre_region varchar(42)
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener o insertar la ID de la comuna
    DECLARE @comunaId int
    SELECT @comunaId = id_comuna FROM comuna WHERE name_comuna = @nombre_comuna;

    IF @comunaId IS NULL
    BEGIN
        -- Obtener o insertar la ID de la provincia
        DECLARE @provinciaId int
        SELECT @provinciaId = id_provincia FROM provincia WHERE name_provincia = @nombre_provincia;

        IF @provinciaId IS NULL
        BEGIN
            -- Obtener o insertar la ID de la región
            DECLARE @regionId int
            SELECT @regionId = id_region FROM region WHERE name_region = @nombre_region;

            IF @regionId IS NULL
            BEGIN
                INSERT INTO region (name_region) VALUES (@nombre_region);
                SET @regionId = SCOPE_IDENTITY();
            END

            INSERT INTO provincia (name_provincia, id_region) VALUES (@nombre_provincia, @regionId);
            SET @provinciaId = SCOPE_IDENTITY();
        END

        INSERT INTO comuna (name_comuna, id_provincia) VALUES (@nombre_comuna, @provinciaId);
        SET @comunaId = SCOPE_IDENTITY();
    END

    -- Obtener o insertar la ID de la dirección
    DECLARE @direccionId int
    SELECT @direccionId = id_direccion FROM direccion WHERE calle = @calle AND number = @number;

    IF @direccionId IS NULL
    BEGIN
        INSERT INTO direccion (calle, number, id_comuna)
        VALUES (@calle, @number, @comunaId);
        SET @direccionId = SCOPE_IDENTITY(); -- Obtener el ID de la dirección insertada
    END
    ELSE
    BEGIN
        -- Actualizar la dirección existente
        UPDATE direccion
        SET id_comuna = @comunaId
        WHERE id_direccion = @direccionId;
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

	--Eliminar direcciones sobrantes
	DELETE FROM direccion
    WHERE id_direccion NOT IN (SELECT DISTINCT id_direccion FROM miembro);
END;

--Ejemplos

EXEC modificarMiembro @categoria_name = 'Seinenbu', @nombres = 'Rafael Antonio', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '27.450.698-9', @birthdate = '2002-03-18', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3095, @phone_number = '955229389', @email = 'rafac183antonio@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Quinta Normal', @nombre_provincia = 'Provincia de Santiago', @nombre_region = 'Región Metropolitana';

EXEC modificarMiembro @categoria_name = 'Seinenbu', @nombres = 'Carla', @first_lastname = 'Cordero', @second_lastname = 'Giron', @gender = 'Masculino', @rut_user = '85', @birthdate = '2003-07-26', @nacionality = 'Venezolana', @calle = 'Santo Domingo', @number = 3097, @phone_number = '955229966', @email = 'cordero478@gmail.com', @hobbies = 'Jugar VideoJuegos, Ejercicio', @nombre_comuna = 'Santiago', @nombre_provincia = 'Provincia de Santiago', @nombre_region = 'Región Metropolitana';

exec allMembers

delete from miembro where rut_user = '15.152.158-8'

SELECT * FROM miembro

--Listar datos de integrante en especifico

CREATE PROCEDURE miembroAllInfo
@rut_user varchar(13)
AS
BEGIN
SELECT mi.rut_user AS Rut, mi.nombres AS Nombres, mi.first_lastname as "Apellido Paterno", mi.second_lastname as "Apellido Materno", ge.gender as Genero, cat.categoria_name as "Categoria", mi.email AS Correo, mi.birthdate as "Fecha de Nacimiento", na.nacionality AS Nacionalidad, mi.phone_number AS Telefono, di.calle AS Calle, di.number AS Numero, re.name_region AS Region, pr.name_provincia AS Provincia, co.name_comuna AS Comuna, mi.hobbies AS Hobbies
FROM miembro AS mi
JOIN categoria AS cat ON mi.id_categoria = cat.id_categoria
JOIN nacionality AS na ON mi.id_nac = na.id_nac
JOIN direccion AS di ON mi.id_direccion = di.id_direccion
JOIN comuna as co on di.id_comuna = co.id_comuna
JOIN provincia as pr on co.id_provincia = pr.id_provincia
JOIN region as re on pr.id_region = re.id_region
JOIN gender as ge on mi.id_gender = ge.id_gender
WHERE mi.rut_user = @rut_user
END

exec miembroAllInfo @rut_user = '27.225.588-9'

CREATE PROCEDURE miembroAllInfoKenshu
@rut_user VARCHAR(13)
AS
BEGIN
	SELECT o.grado AS Grado, od.grado_date AS Fecha
	FROM omitama_date AS od
	JOIN omitama AS o ON o.id_grado = od.id_grado
	WHERE od.rut_user = @rut_user
END

--Eliminar Integrante

CREATE PROCEDURE eliminarMiembro
@rut_user varchar(13)
AS
BEGIN
DELETE FROM miembro
WHERE rut_user = @rut_user
END

exec allMembers;

exec eliminarMiembro @rut_user = '85'

--Listar Todos los integrantes

create procedure allMembers
as
SELECT mi.rut_user AS Rut, mi.nombres AS Nombres, mi.first_lastname as "Apellido Paterno", mi.second_lastname as "Apellido Materno", ge.gender as Genero, cat.categoria_name as "Categoria", mi.email AS Correo, mi.birthdate as "Fecha de Nacimiento", na.nacionality AS Nacionalidad, mi.phone_number AS Telefono, di.calle AS Calle, di.number AS Numero, re.name_region AS Region, pr.name_provincia AS Provincia, co.name_comuna AS Comuna, mi.hobbies AS Hobbies
FROM miembro AS mi
JOIN categoria AS cat ON mi.id_categoria = cat.id_categoria
JOIN nacionality AS na ON mi.id_nac = na.id_nac
JOIN direccion AS di ON mi.id_direccion = di.id_direccion
JOIN comuna as co on di.id_comuna = co.id_comuna
JOIN provincia as pr on co.id_provincia = pr.id_provincia
JOIN region as re on pr.id_region = re.id_region
JOIN gender as ge on mi.id_gender = ge.id_gender

exec allMembers;

--Crear Kenshu de Integrante

CREATE PROCEDURE crearKenshuMiembro
	@rut_user varchar(13),
	@grado_date_ini date,
    @grado_date_int date = NULL,
    @grado_date_sup date = NULL
AS
BEGIN
	DECLARE @gradeId int
    SELECT @gradeId = id_grado FROM omitama WHERE grado = 'Inicial';

	INSERT INTO omitama_date(id_grado, grado_date, rut_user) VALUES (@gradeId, @grado_date_ini, @rut_user);

	IF @grado_date_int IS NOT NULL
	BEGIN
		SELECT @gradeId = id_grado FROM omitama WHERE grado = 'Intermedio';
		INSERT INTO omitama_date(id_grado, grado_date, rut_user) VALUES (@gradeId, @grado_date_int, @rut_user);
	END

	IF @grado_date_sup IS NOT NULL
	BEGIN
		SELECT @gradeId = id_grado FROM omitama WHERE grado = 'Superior';
		INSERT INTO omitama_date(id_grado, grado_date, rut_user) VALUES (@gradeId, @grado_date_sup, @rut_user);
	END
END;




--Cod para reiniciar Contador

DELETE FROM omitama_date
DBCC CHECKIDENT ('omitama_date', RESEED, 0);

exec crearKenshuMiembro @rut_user = '15.152.111-8', @grado_date_ini = '2015-02-06', @grado_date_int = '2018-06-15';

select m.nombres, o.grado, od.grado_date from omitama_date as od join miembro as m on od.rut_user = m.rut_user join omitama as o on o.id_grado = od.id_grado;
