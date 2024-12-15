

create database DBVentaBlazor

go

use DBVentaBlazor

go

create table Rol(
idRol int primary key identity(1,1),
descripcion varchar(50),
esActivo bit,
fechaRegistro datetime default getdate()
)

go

create table Usuario(
idUsuario int primary key identity(1,1),
nombreApellidos varchar(100),
correo varchar(40),
idRol int references Rol(idRol),
clave varchar(40),
esActivo bit
)

go

create table Categoria(
idCategoria int primary key identity(1,1),
descripcion varchar(50),
esActivo bit,
fechaRegistro datetime default getdate()
)


go 
create table Producto (
idProducto int primary key identity(1,1),
nombre varchar(100),
idCategoria int references Categoria(idCategoria),
stock int,
precio decimal(10,2),
esActivo bit,
fechaRegistro datetime default getdate()
)

go

create table NumeroDocumento(
idNumeroDocumento int primary key identity(1,1),
ultimo_Numero int not null,
fechaRegistro datetime default getdate()
)
go

create table Venta(
idVenta int primary key identity(1,1),
numeroDocumento varchar(40),
tipoPago varchar(50),
fechaRegistro datetime default getdate(),
total decimal(10,2)
)
go

create table DetalleVenta(
idDetalleVenta int primary key identity(1,1),
idVenta int references Venta(idVenta),
idProducto int references Producto(idProducto),
cantidad int,
precio decimal(10,2),
total decimal(10,2)
)


--INSERTAR ROLES
insert into rol(descripcion,esActivo) values
('Administrador',1),
('Empleado',1)

go

--INSERTAR USUARIOS
insert into usuario(nombreApellidos,correo,idRol,Clave,esActivo) values
('Ramon Orochena','admin@example.com',1,'Batman',1),
('Marcelo','employe@example.com',2,'12345',1)

select * from usuario
go
--INSERTAR CATEGORIAS
insert into Categoria(descripcion,esActivo) values ('Zapatos',1)
insert into Categoria(descripcion,esActivo) values ('Camisas',1)
insert into Categoria(descripcion,esActivo) values ('Pantalon',1)
insert into Categoria(descripcion,esActivo) values ('Gorra',1)


go

--INSERTAR PRODUCTOS

insert into Producto(nombre,idCategoria,stock,precio,esActivo) values
('Zapato Converse',1,20,2500,1),
('Zapato ADOC',1,30,2200,1),
('Zapato NIKE',1,30,2100,1),
('Zapato VANS',1,25,1050,1),
('Camisa Adolfo Dominguez',2,15,1400,1),
('Camisa Calvin Klein',2,10,1350,1),
('Camisa Tommy Hilfiger',2,10,800,1),
('Camisa Tommy Jeans',2,10,1000,1),
('Camisa Timberland',2,10,1000,1),
('Camisa Dockers',2,15,800,1),
('Camisa Levi.s',2,20,680,1),
('Zapato Puma',1,25,950,1),
('Zapato Tommy Hilfiger',1,10,1500,1),
('Zapato Lacoste',1,20,2000,1),
('Pantalon Tommy Hilfiger',3,15,870,1),
('Pantalon Lloyd',3,30,950,1),
('Pantalon Calvin Klein Jeans',3,30,1200,1),
('Pantalon Tom Tailor',3,30,980,1),
('Gorra Lacoste',4,30,600,1),
('Gorra North Sails',4,30,450,1),
('Gorra Buff',4,30,250,1)


go

--INSERTAR NUMERO VENTA INICIAL
insert into NumeroDocumento(ultimo_Numero) values(0)
