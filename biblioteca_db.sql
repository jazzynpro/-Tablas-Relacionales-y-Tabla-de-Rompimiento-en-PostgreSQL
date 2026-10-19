create database biblioteca_db;

drop table libros;

create table libros(
codigo varchar(5) primary key,
titulo varchar(50),
paginas int not null
);

select * from libros;

create table autores(
id int Primary Key,
nombre varchar(50) NOT NULL,
pais varchar(30) NOT NULL
);

select * from autores;

--Rompimiento
create table libro_autor(
la_libro_id_fk varchar(5) NOT NULL,
la_autor_id_fk int NOT NULL,
anio_publicacion int NOT NULL,

primary key(la_libro_codigo_fk,la_autor_id_fk),
constraint fk_libros foreign key (la_libro_codigo_fk) references libros(codigo),
constraint fk_autores foreign key (la_autor_id_fk) references autores(id)
);

select * from libro_autor;

insert into libros
(codigo, titulo, paginas)
values
('L001', 'lorem 1', 10),
('L002', 'lorem 2', 11),
('L003', 'lorem 3', 12),
('L004', 'lorem 4', 13);


insert into autores
(id, nombre, pais)
values
(1, 'Juan', 'EC'),
(2, 'Pedro', 'CO'),
(3, 'Pablo', 'PA');

insert into libro_autor
(la_libro_codigo_fk,la_autor_id_fk, anio_publicacion)
values
('L001', 1, 2015),
('L002', 2, 2016),
('L003', 1, 2017),
('L004', 2, 2018),
('L005', 3, 2019);

select * from libro_autor;




