create database diagnostico;
select * from votacion;
create table votacion (
id int auto_increment primary key,
nombre_apellido varchar(255),
alias varchar(100),
rut varchar(12),
email varchar(255),
region varchar(255),
comuna varchar(255),
candidato varchar(255),
web varchar(255),
tv varchar(255),
redes varchar(255),
amigo varchar(255));

create table Region (
id_region int auto_increment primary key,
nombre varchar(255),
numero varchar(5)
);

create table Comuna (
id_comuna int auto_increment primary key,
nombre varchar(255),
id_region int,
foreign key (id_region) references region(id_region)
);

create table Candidatos(
id_candidatos int auto_increment primary key,
nombre varchar(255)
);

insert into Region values (1,"Arica y Parinacota", "XV");
insert into Region values (2,"Iquique", "I");
insert into Region values (3,"Antofagasta", "II");
insert into Region values (4,"Atacama", "III");
insert into Region values (5,"Coquimbo", "IV");
insert into Region values (6,"Valparaiso", "V");
insert into Region values (7,"Libertador Bernardo O'Higgins", "VI");
insert into Region values (8,"Maule", "VII");
insert into Region values (9,"Bío-Bío", "VIII");
insert into Region values (10,"La Araucanía", "IX");
insert into Region values (11,"Los Ríos", "XIV");
insert into Region values (12,"Lagos", "X");
insert into Region values (13,"Aysén del Gral Carlos Ibañez del Campo", "XI");
insert into Region values (14,"Magallanes y la Antártica Chilena", "XII");
insert into Region values (15,"Metropolitana", "RM");

INSERT INTO comuna (nombre, id_region) VALUES
('Arica', 1),
('Camarones', 1),
('Putre', 1),
('General Lagos', 1);

INSERT INTO comuna (nombre, id_region) VALUES
('Iquique', 2),('Alto Hospicio', 2),('Pozo Almonte', 2),('Camiña', 2),('Colchane', 2),('Huara', 2),('Pica', 2),('Antofagasta', 3),
('Mejillones', 3),('Sierra Gorda', 3),('Taltal', 3),('Calama', 3),('Ollagüe', 3),('San Pedro de Atacama', 3),('Tocopilla', 3),
('María Elena', 3),('Copiapó', 4),('Caldera', 4),('Tierra Amarilla', 4),('Chañaral', 4),('Diego de Almagro', 4),('Vallenar', 4),
('Alto del Carmen', 4),('Freirina', 4),('Huasco', 4),('La Serena', 5),('Coquimbo', 5),('Andacollo', 5),('La Higuera', 5),('Paihuano', 5),
('Vicuña', 5),('Illapel', 5),('Canela', 5),('Los Vilos', 5),('Salamanca', 5),('Ovalle', 5),('Combarbalá', 5),('Monte Patria', 5),
('Punitaqui', 5),('Río Hurtado', 5),('Valparaíso', 6),('Casablanca', 6),('Concón', 6),('Juan Fernández', 6),('Puchuncaví', 6),('Quintero', 6),
('Viña del Mar', 6),('Isla de Pascua', 6),('Los Andes', 6),('Calle Larga', 6),('Rinconada', 6),('San Esteban', 6),('La Ligua', 6),
('Cabildo', 6),('Papudo', 6),('Petorca', 6),('Zapallar', 6),('Quillota', 6),('Calera', 6),('Hijuelas', 6),('La Cruz', 6),('Nogales', 6),
('San Antonio', 6),('Algarrobo', 6),('Cartagena', 6),('El Quisco', 6),('El Tabo', 6),('Santo Domingo', 6),('San Felipe', 6),('Catemu', 6),
('Llaillay', 6),('Panquehue', 6),('Putaendo', 6),('Santa María', 6),('Limache', 6),('Olmué', 6),('Quilpué', 6),('Villa Alemana', 6);


INSERT INTO comuna (nombre, id_region) VALUES
('Rancagua', 7),('Codegua', 7),('Coinco', 7),('Coltauco', 7),('Doñihue', 7),('Graneros', 7),('Las Cabras', 7),('Machalí', 7),('Malloa', 7),
('Mostazal', 7),('Olivar', 7),('Peumo', 7),('Pichidegua', 7),('Quinta de Tilcoco', 7),('Rengo', 7),('Requínoa', 7),('San Vicente', 7),
('La Estrella', 7),('Litueche', 7),('Marchihue', 7),('Navidad', 7),('Paredones', 7),('San Fernando', 7),('Chépica', 7),('Chimbarongo', 7),
('Lolol', 7),('Nancagua', 7),('Palmilla', 7),('Peralillo', 7),('Placilla', 7),('Pumanque', 7),('Santa Cruz', 7),('Talca', 8),('Constitución', 8),
('Curepto', 8),('Empedrado', 8),('Maule', 8),('Pelarco', 8),('Pencahue', 8),('Río Claro', 8),('San Clemente', 8),('San Rafael', 8),('Cauquenes', 8),
('Chanco', 8),('Pelluhue', 8),('Curicó', 8),('Hualañé', 8),('Licantén', 8),('Molina', 8),('Rauco', 8),('Romeral', 8),('Sagrada Familia', 8),
('Teno', 8),('Vichuquén', 8),('Linares', 8),('Colbún', 8),('Longaví', 8),('Parral', 8),('Retiro', 8),('San Javier', 8),('Villa Alegre', 8),
('Yerbas Buenas', 8),('Concepción', 9),('Coronel', 9),('Chiguayante', 9),('Florida', 9),('Hualqui', 9),('Lota', 9),('Penco', 9),('San Pedro de la Paz', 9),
('Santa Juana', 9),('Talcahuano', 9),('Tomé', 9),('Hualpén', 9),('Lebu', 9),('Arauco', 9),('Cañete', 9),('Contulmo', 9),('Curanilahue', 9),
('Los Álamos', 9),('Tirúa', 9),('Los Ángeles', 9),('Antuco', 9),('Cabrero', 9),('Laja', 9),('Mulchén', 9),('Nacimiento', 9),('Negrete', 9),
('Quilaco', 9),('Quilleco', 9),('San Rosendo', 9),('Santa Bárbara', 9),('Tucapel', 9),('Yumbel', 9),('Alto Biobío', 9),('Chillán', 9),
('Bulnes', 9),('Cobquecura', 9),('Coelemu', 9),('Coihueco', 9),('Chillán Viejo', 9),('El Carmen', 9),('Ninhue', 9),('Ñiquén', 9),
('Pemuco', 9),('Pinto', 9),('Portezuelo', 9),('Quillón', 9),('Quirihue', 9),('Ránquil', 9),('San Carlos', 9),('San Fabián', 9),
('San Ignacio', 9),('San Nicolás', 9),('Treguaco', 9),('Yungay', 9),('Temuco', 10),('Carahue', 10),('Cunco', 10),('Curarrehue', 10),
('Freire', 10),('Galvarino', 10),('Gorbea', 10),('Lautaro', 10),('Loncoche', 10),('Melipeuco', 10),('Nueva Imperial', 10),
('Padre las Casas', 10),('Perquenco', 10),('Pitrufquén', 10),('Pucón', 10),('Saavedra', 10),('Teodoro Schmidt', 10),('Toltén', 10),
('Vilcún', 10),('Villarrica', 10),('Cholchol', 10),('Angol', 10),('Collipulli', 10),('Curacautín', 10),('Ercilla', 10),('Lonquimay', 10),
('Los Sauces', 10),('Lumaco', 10),('Purén', 10),('Renaico', 10),('Traiguén', 10),('Victoria', 10);

INSERT INTO comuna (nombre, id_region) VALUES
('Valdivia', 11), ('Corral', 11), ('Lanco', 11), ('Los Lagos', 11),('Máfil', 11), ('Mariquina', 11), ('Paillaco', 11), ('Panguipulli', 11),
('La Unión', 11), ('Futrono', 11), ('Lago Ranco', 11), ('Río Bueno', 11),('Puerto Montt', 12), ('Calbuco', 12), ('Cochamó', 12), ('Fresia', 12),
('Frutillar', 12), ('Los Muermos', 12), ('Llanquihue', 12), ('Maullín', 12),('Puerto Varas', 12), ('Castro', 12), ('Ancud', 12), ('Chonchi', 12),
('Curaco de Vélez', 12), ('Dalcahue', 12), ('Puqueldón', 12), ('Queilén', 12),('Quellón', 12), ('Quemchi', 12), ('Quinchao', 12),
('Coyhaique', 13), ('Lago Verde', 13), ('Aysén', 13), ('Cisnes', 13),('Guaitecas', 13), ('Cochrane', 13), ('O''Higgins', 13), ('Tortel', 13),
('Punta Arenas', 14), ('Laguna Blanca', 14), ('Río Verde', 14),('San Gregorio', 14), ('Cabo de Hornos (Ex Navarino)', 14),('Antártica', 14),
('Porvenir', 14), ('Primavera', 14), ('Timaukel', 14),('Natales', 14), ('Torres del Paine', 14),('Santiago', 15),('Cerrillos', 15),
('Cerro Navia', 15),('Conchalí', 15), ('El Bosque', 15), ('Estación Central', 15),('Huechuraba', 15),('Independencia', 15),('La Cisterna', 15),
('La Florida', 15), ('La Granja', 15), ('La Pintana', 15),('La Reina', 15), ('Las Condes', 15), ('Lo Barnechea', 15),('Lo Espejo', 15),
('Lo Prado', 15), ('Macul', 15), ('Maipú', 15),('Ñuñoa', 15),('Pedro Aguirre Cerda', 15),('Peñalolén', 15),('Providencia', 15),('Pudahuel', 15),
('Quilicura', 15),('Quinta Normal', 15), ('Recoleta', 15), ('Renca', 15),('San Joaquín', 15), ('San Miguel', 15), ('San Ramón', 15),
('Vitacura', 15),('Puente Alto', 15),('Pirque', 15),('San José de Maipo', 15),('Colina', 15),('Lampa', 15),('Tiltil', 15),('San Bernardo', 15),
('Buin', 15),('Calera de Tango', 15), ('Paine', 15), ('Melipilla', 15),('Alhué', 15),('Curacaví', 15),('María Pinto', 15),('San Pedro', 15),
('Talagante', 15), ('El Monte', 15),('Isla de Maipo', 15),('Padre Hurtado', 15), ('Peñaflor', 15);

insert into candidatos (nombre) values
('Sebastian Piñera'), ('Michel Jordan'), ('Tom Holand')
;
