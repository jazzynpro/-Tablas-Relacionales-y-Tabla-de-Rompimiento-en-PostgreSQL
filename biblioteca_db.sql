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

select
titulo,
nombre,
pais,
anio_publicacion
from libros
inner join libro_autor
on(
codigo = la_libro_codigo_fk
)
inner join autores
on(
la_autor_id_fk = id
);


select titulo,
nombre,
pais,
anio_publicacion
from libros lb
inner join libro_autor la
on(
codigo = la_libro_codigo_fk
)
inner join autores aut
on(
la_autor_id_fk = id
);


select
lb.*,
la.anio_publicacion
from libros lb
inner join libro_autor la
on(
lb.codigo = la.la_libro_codigo_fk
)
where la.anio_publicacion > 2020;


select * from autores
where pais = 'CO';


select
lb.*,
la.anio_publicacion
from libros lb
inner join libro_autor la
on(
lb.codigo = la.la_libro_codigo_fk
)
order by la.anio_publicacion desc;


select
au.id,
count(lb.codigo) as "cantidad_libros"
from libros lb
inner join libro_autor la
on(
lb.codigo = la.la_libro_codigo_fk
)
inner join autores au
on(
au.id = la.la_autor_id_fk
)
group by au.id, au.nombre; 


alter table libros
add column precio double precio;

select * from libros;

update libros set
precio = 29.99
where codigo = 'L001';

update libros set
precio = 9.99
where codigo = 'L002';

update libros set
precio = 39.99
where codigo = 'L003';

update libros set
precio = 39.99
where codigo = 'L004';

select * from libros;

