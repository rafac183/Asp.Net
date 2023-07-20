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

INSERT INTO region (name_region) VALUES 
('Arica y Parinacota'),
('Tarapacá'),
('Antofagasta'),
('Atacama'),
('Coquimbo'),
('Valparaíso'),
('Metropolitana de Santiago'),
('Bernardo OHiggins'),
('Maule'),
('Ñuble'),
('Biobío'),
('La Araucanía'),
('Los Ríos'),
('Los Lagos'),
('Aysén del General Carlos Ibáñez del Campo'),
('Magallanes y de la Antártica Chilena');

-- Insertar provincias para la Región de Arica y Parinacota (ID = 1)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Arica', 1),
('Parinacota', 1);

-- Insertar provincias para la Región de Tarapacá (ID = 2)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Iquique', 2),
('Tamarugal', 2);

-- Insertar provincias para la Región de Antofagasta (ID = 3)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Antofagasta', 3),
('El Loa', 3),
('Tocopilla', 3);

-- Insertar provincias para la Región de Atacama (ID = 4)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Copiapó', 4),
('Chañaral', 4),
('Huasco', 4);

-- Insertar provincias para la Región de Coquimbo (ID = 5)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Elqui', 5),
('Choapa', 5),
('Limarí', 5);

-- Insertar provincias para la Región de Valparaíso (ID = 6)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Valparaíso', 6),
('Isla de Pascua', 6),
('Los Andes', 6),
('Petorca', 6),
('Quillota', 6),
('San Antonio', 6),
('San Felipe de Aconcagua', 6),
('Marga Marga', 6);

-- Insertar provincias para la Región Metropolitana de Santiago (ID = 7)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Santiago', 7),
('Cordillera', 7),
('Chacabuco', 7),
('Maipo', 7),
('Melipilla', 7),
('Talagante', 7);

-- Insertar provincias para la Región del Libertador General Bernardo O'Higgins (ID = 8)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Cachapoal', 8),
('Cardenal Caro', 8),
('Colchagua', 8);

-- Insertar provincias para la Región del Maule (ID = 9)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Curicó', 9),
('Talca', 9),
('Linares', 9),
('Cauquenes', 9);

-- Insertar provincias para la Región de Ñuble (ID = 10)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Diguillín', 10),
('Itata', 10),
('Punilla', 10);

-- Insertar provincias para la Región del Biobío (ID = 11)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Concepción', 11),
('Arauco', 11),
('Biobío', 11);

-- Insertar provincias para la Región de La Araucanía (ID = 12)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Cautín', 12),
('Malleco', 12);

-- Insertar provincias para la Región de Los Ríos (ID = 13)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Valdivia', 13),
('Ranco', 13);

-- Insertar provincias para la Región de Los Lagos (ID = 14)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Llanquihue', 14),
('Chiloé', 14),
('Osorno', 14),
('Palena', 14);

-- Insertar provincias para la Región de Aysén del General Carlos Ibáñez del Campo (ID = 15)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Coyhaique', 15),
('Aysén', 15),
('Capitán Prat', 15),
('General Carrera', 15);

-- Insertar provincias para la Región de Magallanes y de la Antártica Chilena (ID = 16)
INSERT INTO ciudad (name_ciudad, id_region) VALUES 
('Magallanes', 16),
('Antártica Chilena', 16),
('Tierra del Fuego', 16),
('Última Esperanza', 16);

insert into comuna(name_comuna, id_ciudad) 
values ('Arica', '1'),
('Camarones', '1'),
('General Lagos', '1'),
('General Ramirez', '1');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Putre', '2');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Iquique', '3'),
('Alto Hospicio', '3');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Pozo Almonte', '4'),
('Camiña', '4'),
('Colchane', '4'),
('Huara', '4'),
('Pica', '4');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Antofagasta', '5'),
('Mejillones', '5'),
('Sierra Gorda', '5'),
('Taltal', '5'),
('Calama', '5'),
('Ollagüe', '5'),
('San Pedro de Atacama', '5'),
('Tocopilla', '5'),
('María Elena', '5');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Calama', '6'),
('Ollagüe', '6'),
('San Pedro de Atacama', '6');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Tocopilla', '7');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Copiapó', '8'),
('Caldera', '8'),
('Tierra Amarilla', '8'),
('Chañaral', '8');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Chañaral', '9');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Vallenar', '10'),
('Alto del Carmen', '10'),
('Freirina', '10');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('La Serena', '11'),
('Coquimbo', '11'),
('Andacollo', '11'),
('La Higuera', '11'),
('Paihuano', '11');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Illapel', '12'),
('Canela', '12'),
('Los Vilos', '12'),
('Salamanca', '12');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Ovalle', '13'),
('Combarbalá', '13'),
('Monte Patria', '13'),
('Punitaqui', '13'),
('Río Hurtado', '13');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Valparaíso', '14'),
('Viña del Mar', '14'),
('Concón', '14'),
('Quintero', '14'),
('Puchuncaví', '14'),
('Casablanca', '14'),
('Juan Fernández', '14');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Isla de Pascua', '15');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Los Andes', '16'),
('San Esteban', '16'),
('Calle Larga', '16');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('La Ligua', '17'),
('Cabildo', '17'),
('Papudo', '17'),
('Zapallar', '17'),
('Petorca', '17');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES ('Quillota', '18'),
('La Cruz', '18'),
('Nogales', '18'),
('Hijuelas', '18');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('San Antonio', '19'),
    ('Cartagena', '19'),
    ('El Tabo', '19'),
    ('El Quisco', '19'),
    ('Algarrobo', '19');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('San Felipe', '20'),
    ('Santa María', '20'),
    ('Panquehue', '20'),
    ('Putaendo', '20'),
    ('Catemu', '20');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Quilpué', '21'),
    ('Villa Alemana', '21'),
    ('Limache', '21'),
    ('Olmué', '21');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Santiago', 22),
    ('Cerrillos', 22),
    ('Cerro Navia', 22),
    ('Conchalí', 22),
    ('El Bosque', 22),
    ('Estación Central', 22),
    ('Huechuraba', 22),
    ('Independencia', 22),
    ('La Cisterna', 22),
    ('La Florida', 22),
    ('La Granja', 22),
    ('La Pintana', 22),
    ('La Reina', 22),
    ('Las Condes', 22),
    ('Lo Barnechea', 22),
    ('Lo Espejo', 22),
    ('Lo Prado', 22),
    ('Macul', 22),
    ('Maipú', 22),
    ('Ñuñoa', 22),
    ('Pedro Aguirre Cerda', 22),
    ('Peñalolén', 22),
    ('Providencia', 22),
    ('Pudahuel', 22),
    ('Quilicura', 22),
    ('Quinta Normal', 22),
    ('Recoleta', 22),
    ('Renca', 22),
    ('San Joaquín', 22),
    ('San Miguel', 22),
    ('San Ramón', 22),
    ('Vitacura', 22);
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Puente Alto', '23'),
    ('Pirque', '23'),
    ('San José de Maipo', '23');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Colina', '24'),
    ('Lampa', '24'),
    ('Tiltil', '24');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('San Bernardo', '25'),
    ('Buin', '25'),
    ('Paine', '25'),
    ('Calera de Tango', '25'),
    ('Melipilla', '25');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Melipilla', '26'),
    ('Alhué', '26'),
    ('Curacaví', '26'),
    ('María Pinto', '26'),
    ('San Pedro', '26');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Talagante', '27'),
    ('El Monte', '27'),
    ('Isla de Maipo', '27'),
    ('Padre Hurtado', '27'),
    ('Peñaflor', '27');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Rancagua', '28'),
    ('Codegua', '28'),
    ('Coinco', '28'),
    ('Coltauco', '28'),
    ('Doñihue', '28'),
    ('Graneros', '28'),
    ('Las Cabras', '28'),
    ('Machalí', '28'),
    ('Malloa', '28'),
    ('Mostazal', '28'),
    ('Olivar', '28'),
    ('Peumo', '28'),
    ('Pichidegua', '28'),
    ('Quinta de Tilcoco', '28'),
    ('Rengo', '28'),
    ('Requínoa', '28'),
    ('San Vicente', '28');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Pichilemu', '29'),
    ('La Estrella', '29'),
    ('Litueche', '29'),
    ('Marchihue', '29'),
    ('Navidad', '29');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('San Fernando', '30'),
    ('Chépica', '30'),
    ('Chimbarongo', '30'),
    ('Lolol', '30'),
    ('Nancagua', '30'),
    ('Palmilla', '30'),
    ('Peralillo', '30'),
    ('Placilla', '30'),
    ('Pumanque', '30'),
    ('Santa Cruz', '30');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Curicó', '31'),
    ('Hualañé', '31'),
    ('Licantén', '31'),
    ('Molina', '31'),
    ('Rauco', '31'),
    ('Romeral', '31'),
    ('Sagrada Familia', '31'),
    ('Teno', '31'),
    ('Vichuquén', '31');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Talca', '32'),
    ('Constitución', '32'),
    ('Curepto', '32'),
    ('Empedrado', '32'),
    ('Maule', '32'),
    ('Pelarco', '32'),
    ('Pencahue', '32'),
    ('Río Claro', '32'),
    ('San Clemente', '32'),
    ('San Rafael', '32');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Linares', '33'),
    ('Colbún', '33'),
    ('Longaví', '33'),
    ('Parral', '33'),
    ('Retiro', '33'),
    ('San Javier', '33'),
    ('Villa Alegre', '33'),
    ('Yerbas Buenas', '33');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Cauquenes', '34'),
    ('Chanco', '34'),
    ('Pelluhue', '34');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Bulnes', '35'),
    ('Chillán', '35'),
    ('Chillán Viejo', '35'),
    ('El Carmen', '35'),
    ('Pemuco', '35'),
    ('Pinto', '35'),
    ('Quillón', '35'),
    ('San Ignacio', '35'),
    ('Yungay', '35');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Coelemu', '36'),
    ('Ninhue', '36'),
    ('Portezuelo', '36'),
    ('Quirihue', '36'),
    ('Ránquil', '36'),
    ('Treguaco', '36');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Coihueco', '37'),
    ('Ñiquén', '37'),
    ('San Carlos', '37'),
    ('San Fabián', '37'),
    ('San Nicolás', '37');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Concepción', '38'),
    ('Coronel', '38'),
    ('Chiguayante', '38'),
    ('Florida', '38'),
    ('Hualpén', '38'),
    ('Hualqui', '38'),
    ('Lota', '38'),
    ('Penco', '38'),
    ('San Pedro de la Paz', '38'),
    ('Santa Juana', '38'),
    ('Talcahuano', '38'),
    ('Tomé', '38'),
    ('Hualañé', '38');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Lebu', '39'),
    ('Arauco', '39'),
    ('Cañete', '39'),
    ('Contulmo', '39'),
    ('Curanilahue', '39'),
    ('Los Álamos', '39'),
    ('Tirúa', '39');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Los Ángeles', '40'),
    ('Antuco', '40'),
    ('Cabrero', '40'),
    ('Laja', '40'),
    ('Mulchén', '40'),
    ('Nacimiento', '40'),
    ('Negrete', '40'),
    ('Quilaco', '40'),
    ('Quilleco', '40'),
    ('San Rosendo', '40'),
    ('Santa Bárbara', '40'),
    ('Tucapel', '40'),
    ('Yumbel', '40');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Temuco', '41'),
    ('Carahue', '41'),
    ('Cunco', '41'),
    ('Curarrehue', '41'),
    ('Freire', '41'),
    ('Galvarino', '41'),
    ('Gorbea', '41'),
    ('Lautaro', '41'),
    ('Loncoche', '41'),
    ('Melipeuco', '41'),
    ('Nueva Imperial', '41'),
    ('Padre Las Casas', '41'),
    ('Perquenco', '41'),
    ('Pitrufquén', '41'),
    ('Pucón', '41'),
    ('Saavedra', '41'),
    ('Teodoro Schmidt', '41'),
    ('Toltén', '41'),
    ('Vilcún', '41'),
    ('Villarrica', '41'),
    ('Cholchol', '41');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Angol', '42'),
    ('Collipulli', '42'),
    ('Curacautín', '42'),
    ('Ercilla', '42'),
    ('Lonquimay', '42'),
    ('Los Sauces', '42'),
    ('Lumaco', '42'),
    ('Purén', '42'),
    ('Renaico', '42'),
    ('Traiguén', '42'),
    ('Victoria', '42');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Valdivia', '43');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('La Unión', '44'),
    ('Futrono', '44'),
    ('Lago Ranco', '44'),
    ('Río Bueno', '44');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Puerto Montt', '45'),
    ('Calbuco', '45'),
    ('Cochamó', '45'),
    ('Fresia', '45'),
    ('Frutillar', '45'),
    ('Llanquihue', '45'),
    ('Los Muermos', '45'),
    ('Maullín', '45'),
    ('Puerto Varas', '45');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Castro', '46'),
    ('Ancud', '46'),
    ('Quemchi', '46'),
    ('Dalcahue', '46'),
    ('Quinchao', '46'),
    ('Curaco de Vélez', '46'),
    ('Puqueldón', '46'),
    ('Queilén', '46'),
    ('Quellón', '46'),
    ('Chonchi', '46'),
    ('Puerto Montt', '46');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Osorno', '47'),
    ('Puerto Octay', '47'),
    ('Puyehue', '47'),
    ('Río Negro', '47'),
    ('San Juan de la Costa', '47');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Chaitén', '48'),
    ('Futaleufú', '48'),
    ('Palena', '48');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Coyhaique', '49'),
    ('Lago Verde', '49');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Aysén', '50'),
    ('Cisnes', '50'),
    ('Guaitecas', '50');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Cochrane', '51'),
    ('OHiggins', '51'),
    ('Tortel', '51');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('General Carrera', '52'),
    ('Río Ibáñez', '52');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Magallanes', '53'),
    ('Punta Arenas', '53'),
    ('Laguna Blanca', '53'),
    ('San Gregorio', '53'),
    ('Río Verde', '53'),
    ('Timaukel', '53'),
    ('Cabo de Hornos (Navarino)', '53');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Cabo de Hornos', '54'),
    ('Antártica', '54');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Porvenir', '55'),
    ('Primavera', '55'),
    ('Timaukel', '55');
INSERT INTO comuna (name_comuna, id_ciudad)
VALUES 
    ('Natales', '56'),
    ('Torres del Paine', '56');







