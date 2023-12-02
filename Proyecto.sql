CREATE DATABASE Examen
GO

USE Examen
GO

CREATE TABLE Tecnicos 
(	
	TecnicoID int identity(1,1),
	Nombre varchar(50),
	Especialidad varchar(20)
	CONSTRAINT pk_TecnicosID PRIMARY KEY(TecnicoID) 
)
GO

CREATE TABLE Usuarios
(
	UsuarioID int identity(1,1),
	Nombre varchar(50) NOT NULL,
	Correo varchar(50),
	Telefono varchar(15) UNIQUE, 
	CONSTRAINT pk_UsuariosID PRIMARY KEY(UsuarioID)
)
GO

CREATE TABLE Equipos 
(	
	EquipoID int identity(1,1),
	UsuarioID int,
	TipoEquipo varchar(50) NOT NULL,
	Modelo varchar(50),
	CONSTRAINT pk_EquiposID PRIMARY KEY(EquipoID),
	CONSTRAINT fk_UsuarioID FOREIGN KEY(UsuarioID)REFERENCES Usuarios(UsuarioID)
)
GO 

CREATE TABLE Reparaciones 
(
	ReparacionID int identity(1,1),
	EquipoID int,
	FechaSolicitud datetime CONSTRAINT df_Fecha DEFAULT GETDATE(),
	Estado varchar(50)
	CONSTRAINT pk_ReparacionID PRIMARY KEY(ReparacionID),
	CONSTRAINT fk_EqupoID FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
)
GO
ALTER TABLE Reparaciones
ALTER COLUMN Estado varchar(50);
GO

CREATE TABLE DetallesRepacion
(	
	DetalleID int identity(1,1),
	ReparacionID int,
	Descripcion varchar(50),
	FechaInicio datetime,
	FechaFin datetime
	CONSTRAINT pk_DetalleID PRIMARY KEY(DetalleID),
	CONSTRAINT fk_ReparacionID FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID) 
)
GO

CREATE TABLE Asignaciones
(	
	AsignacionId int identity(1,1),
	ReparacionID int, 
	TecnicoID int,
	FechaAsignacion datetime
	CONSTRAINT pk_AsignacionID PRIMARY KEY(AsignacionID),
	CONSTRAINT fk_ReparacioID FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID), 
	CONSTRAINT fk_TecnicoID FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID) 
)
GO

INSERT INTO Tecnicos(Nombre,Especialidad) VALUES ('Fernanda','Base de datos'),('Maria','Redes')

CREATE PROCEDURE CONSULTARTECNICO
AS
	BEGIN
		SELECT * FROM Tecnicos
	END

CREATE PROCEDURE CONSULTARTECNICO_FILTRO
@Codigo int
AS 
	BEGIN 
		SELECT * FROM Tecnicos WHERE TecnicoID =@Codigo
	END 

	CREATE PROCEDURE BORRARTECNICO
@Codigo int
AS 
	BEGIN 
		DELETE Tecnicos WHERE TecnicoID = @Codigo
	END 


CREATE PROCEDURE AGREGARTECNICO
@Nombre varchar(50),
@Especialidad varchar(20)
AS 
	BEGIN 
		INSERT INTO Tecnicos (Nombre,Especialidad) VALUES (@Nombre,@Especialidad)
	END 

CREATE PROCEDURE MODIFICARTECNICO
@Codigo int,
@Nombre varchar(50),
@Especialidad varchar(20)
AS 
	BEGIN 
		UPDATE Tecnicos SET Nombre=@Nombre, Especialidad=@Especialidad WHERE TecnicoID=@Codigo
	END 



	EXEC AGREGARTECNICO 'Jimena','Base de datos' 
	EXEC CONSULTARTECNICO
	EXEC BORRARTECNICO 1
	EXEC MODIFICARTECNICO 4, 'Daniela','Base de datos'
	EXEC CONSULTARTECNICO
	EXEC CONSULTARTECNICO_FILTRO 1

CREATE PROCEDURE CONSULTARUSUARIO
AS
	BEGIN
		SELECT * FROM Usuarios
	END

INSERT INTO Usuarios(Nombre,Correo,Telefono) VALUES ('Fernanda','fer@gmail.com','0988090'),('Maria','mar@gmail,com','77663355')

CREATE PROCEDURE CONSULTARUSUARIO_FILTRO
@Codigo int
AS 
	BEGIN 
		SELECT * FROM Usuarios WHERE UsuarioID =@Codigo
	END 

CREATE PROCEDURE BORRARUSUARIO
@Codigo int
AS 
	BEGIN 
		DELETE Usuarios WHERE UsuarioID = @Codigo
	END 

CREATE PROCEDURE AGREGARUSUARIO
@Nombre varchar(50),
@Correo varchar(50),
@Telefono int
AS 
	BEGIN 
		INSERT INTO Usuarios(Nombre,Correo,Telefono) VALUES (@Nombre,@Correo,@Telefono)
	END 

CREATE PROCEDURE MODIFICARUSUARIO
@Codigo int,
@Nombre varchar(50),
@Correo varchar(50),
@Telefono int 
AS 
	BEGIN 
		UPDATE Usuarios SET Nombre=@Nombre,Correo=@Correo,Telefono=@Telefono WHERE UsuarioID=@Codigo
	END 



EXEC BORRARUSUARIO 1
EXEC AGREGARUSUARIO 'Jimena','jim@gmail.com','89403209'
EXEC MODIFICARUSUARIO 3,'Juan','J@gmail,com','90908800'
EXEC CONSULTARUSUARIO
EXEC CONSULTARUSUARIO_FILTRO 1

CREATE PROCEDURE CONSULTAREQUIPOS
AS
	BEGIN
		SELECT * FROM Equipos
	END

CREATE PROCEDURE CONSULTAREQUIPO_FILTRO
@Codigo int
AS 
	BEGIN 
		SELECT * FROM Equipos WHERE EquipoID =@Codigo
	END 

CREATE PROCEDURE BORRAREQUIPO
@Codigo int
AS 
	BEGIN 
		DELETE Equipos WHERE EquipoID = @Codigo
	END 


CREATE PROCEDURE AGREGAREQUIPO
@UsuarioID int,
@TipoEquipo varchar(50),
@Modelo varchar(50)
AS 
	BEGIN 
		INSERT INTO Equipos(UsuarioID,TipoEquipo,Modelo) VALUES (@UsuarioID,@TipoEquipo,@Modelo)
	END 


CREATE PROCEDURE MODIFICAREQUIPO
@Codigo int,
@UsuarioID int,
@TipoEquipo varchar(50),
@Modelo varchar(50)

AS 
	BEGIN 
		UPDATE Equipos SET UsuarioID=@UsuarioID,TipoEquipo=@TipoEquipo,Modelo=@Modelo WHERE EquipoID=@Codigo
	END 



EXEC AGREGAREQUIPO 1,'Impresora','Epson'
EXEC BORRAREQUIPO 4
EXEC MODIFICAREQUIPO 1,'3','Laptop','Huawei'
EXEC CONSULTAREQUIPOS
EXEC CONSULTAREQUIPO_FILTRO 5

CREATE PROCEDURE CONSULTARREPARACIONES
AS
	BEGIN
		SELECT * FROM Reparaciones
	END

CREATE PROCEDURE CONSULTARREPARACION_FILTRO
@Codigo int
AS 
	BEGIN 
		SELECT * FROM Reparaciones WHERE ReparacionID =@Codigo
	END 

CREATE PROCEDURE BORRARREPARACION
@Codigo int
AS 
	BEGIN 
		DELETE Reparaciones WHERE ReparacionID = @Codigo
	END 


CREATE PROCEDURE AGREGARREPARACION
@EquipoID int,
@FechaSolicitud datetime,
@Estado varchar(50)
AS 
	BEGIN 
		INSERT INTO Reparaciones(EquipoID,FechaSolicitud,Estado) VALUES (@EquipoID,@FechaSolicitud,@Estado)
	END 

CREATE PROCEDURE MODIFICAREPARACION
@Codigo int,
@EquipoID int,
@FechaSolicitud datetime,
@Estado varchar(50)

AS 
	BEGIN 
		UPDATE Reparaciones SET EquipoID=@EquipoID,FechaSolicitud=@FechaSolicitud,Estado=@Estado WHERE ReparacionID=@Codigo
	END 


	EXEC AGREGARREPARACION 5,'2023-11-23','pp'
	EXEC BORRARREPARACION 4
	EXEC MODIFICAREPARACION 6,5,'2021-09-08','en progreso'
	EXEC CONSULTARREPARACIONES
	EXEC CONSULTARREPARACION_FILTRO 6

	CREATE PROCEDURE CONSULTARDETALLES
AS
	BEGIN
		SELECT * FROM DetallesRepacion
	END

CREATE PROCEDURE CONSULTARDETALLE_FILTRO
@Codigo int
AS 
	BEGIN 
		SELECT * FROM DetallesRepacion WHERE DetalleID =@Codigo
	END 

CREATE PROCEDURE BORRARDETALLE
@Codigo int
AS 
	BEGIN 
		DELETE DetallesRepacion WHERE DetalleID = @Codigo
	END 


CREATE PROCEDURE AGREGARDETALLE
    @ReparacionID int,
	@Descripcion varchar(50),
	@FechaInicio datetime,
	@FechaFin datetime
AS 
	BEGIN 
		INSERT INTO DetallesRepacion(ReparacionID,Descripcion,FechaInicio,FechaFin) VALUES (@ReparacionID,@Descripcion,@FechaInicio,@FechaFin)
	END 

CREATE PROCEDURE MODIFICARDETALLE
@Codigo int,
@ReparacionID int,
@Descripcion varchar(50),
@FechaInicio datetime,
@FechaFin datetime

AS 
	BEGIN 
		UPDATE DetallesRepacion SET ReparacionID=@ReparacionID,Descripcion=@Descripcion,FechaInicio=@FechaInicio,FechaFin=@FechaFin WHERE DetalleID=@Codigo
	END 

	EXEC AGREGARDETALLE 6,'hhh','2021-11-22','2022-11-22'
	EXEC BORRARDETALLE 1
	EXEC MODIFICARDETALLE 2,6,'ss','2021-11-22','2022-11-22'
	EXEC CONSULTARDETALLES

	CREATE PROCEDURE CONSULTARASIGNACION
AS
	BEGIN
		SELECT * FROM Asignaciones
	END

CREATE PROCEDURE CONSULTARASIGNACION_FILTRO
@Codigo int
AS 
	BEGIN 
		SELECT * FROM Asignaciones WHERE AsignacionId =@Codigo
	END 

CREATE PROCEDURE BORRARASIGNACION
@Codigo int
AS 
	BEGIN 
		DELETE Asignaciones WHERE AsignacionId = @Codigo
	END 


CREATE PROCEDURE AGREGARASIGNACION
	@ReparacionID int, 
	@TecnicoID int,
	@FechaAsignacion datetime
AS 
	BEGIN 
		INSERT INTO Asignaciones(ReparacionID,TecnicoID,FechaAsignacion) VALUES (@ReparacionID,@TecnicoID,@FechaAsignacion)
	END 

CREATE PROCEDURE MODIFICARASIGNACION
@Codigo int,
@ReparacionID int, 
@TecnicoID int,
@FechaAsignacion datetime

AS 
	BEGIN 
		UPDATE Asignaciones SET ReparacionID=@ReparacionID,TecnicoID=@TecnicoID,FechaAsignacion=@FechaAsignacion WHERE AsignacionId=@Codigo
	END 

	EXEC AGREGARASIGNACION 6,'7','2022-2-22'
	EXEC CONSULTARASIGNACION

	CREATE TABLE USUARIO
	(
		Correo varchar(50) NOT NULL,
		Clave Varchar(50) NOT NULL
	)
	SELECT * FROM USUARIO	

	CREATE PROCEDURE validarusuario
@Correo varchar(50),
@Clave varchar(50)
AS 
	BEGIN 
	SELECT Correo,Clave FROM USUARIO WHERE Correo=@Correo AND CLAVE = @Clave 
END