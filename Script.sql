USE [master]
GO
/****** Object:  Database [PARCIAL]    Script Date: 18/10/2022 22:35:27 ******/
CREATE DATABASE [PARCIAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PARCIAL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PARCIAL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PARCIAL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PARCIAL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PARCIAL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PARCIAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PARCIAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PARCIAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PARCIAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PARCIAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PARCIAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [PARCIAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PARCIAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PARCIAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PARCIAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PARCIAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PARCIAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PARCIAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PARCIAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PARCIAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PARCIAL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PARCIAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PARCIAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PARCIAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PARCIAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PARCIAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PARCIAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PARCIAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PARCIAL] SET RECOVERY FULL 
GO
ALTER DATABASE [PARCIAL] SET  MULTI_USER 
GO
ALTER DATABASE [PARCIAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PARCIAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PARCIAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PARCIAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PARCIAL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PARCIAL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PARCIAL] SET QUERY_STORE = OFF
GO
USE [PARCIAL]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 18/10/2022 22:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[ID_CLIENTE] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Borrado] [int] NOT NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 18/10/2022 22:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[ID_COMPRA] [int] NOT NULL,
	[ID_CLIENTE] [int] NOT NULL,
	[ID_PRODUCTO] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_COMPRA] PRIMARY KEY CLUSTERED 
(
	[ID_COMPRA] ASC,
	[ID_CLIENTE] ASC,
	[ID_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 18/10/2022 22:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[ID_PRODUCTO] [int] NOT NULL,
	[Producto] [varchar](50) NOT NULL,
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_PRODUCTO] PRIMARY KEY CLUSTERED 
(
	[ID_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_COMPRA_CLIENTE] FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTE] ([ID_CLIENTE])
GO
ALTER TABLE [dbo].[COMPRA] CHECK CONSTRAINT [FK_COMPRA_CLIENTE]
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_COMPRA_PRODUCTO] FOREIGN KEY([ID_PRODUCTO])
REFERENCES [dbo].[PRODUCTO] ([ID_PRODUCTO])
GO
ALTER TABLE [dbo].[COMPRA] CHECK CONSTRAINT [FK_COMPRA_PRODUCTO]
GO
/****** Object:  StoredProcedure [dbo].[cliente_editar]    Script Date: 18/10/2022 22:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cliente_editar]
@id int, @b int, @nom varchar(50), @ape varchar(50)
as 
begin 
update CLIENTE set 
Nombre = @nom,
Apellido = @ape,
Borrado = @b
where ID_CLIENTE = @id
end
GO
/****** Object:  StoredProcedure [dbo].[cliente_insertar]    Script Date: 18/10/2022 22:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cliente_insertar]
@nom varchar(50), @ape varchar(50)
as 
begin 
insert into CLIENTE values (@nom, @ape, 0)
end
GO
/****** Object:  StoredProcedure [dbo].[cliente_listar]    Script Date: 18/10/2022 22:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[cliente_listar]
as 
begin 
select * from CLIENTE where Borrado = 0
end
GO
/****** Object:  StoredProcedure [dbo].[InsertarCompra]    Script Date: 18/10/2022 22:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertarCompra]
@id int, @id_c int, @id_p int, @c int
as 
begin
	insert into compra values (@id,@id_c,@id_p, @c)

end
GO
/****** Object:  StoredProcedure [dbo].[producto_listar]    Script Date: 18/10/2022 22:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[producto_listar]
as 
begin 
select * from producto
end
GO
/****** Object:  StoredProcedure [dbo].[SiguienteCompra]    Script Date: 18/10/2022 22:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SiguienteCompra]
as 
begin
	select isnull(max(id_compra),0) +1 from compra

end
GO
USE [master]
GO
ALTER DATABASE [PARCIAL] SET  READ_WRITE 
GO
