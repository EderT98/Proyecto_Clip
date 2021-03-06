USE [master]
GO
/****** Object:  Database [Wallet]    Script Date: 2/10/2020 10:34:59 ******/
CREATE DATABASE [Wallet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wallet', FILENAME = N'F:\Programas\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Wallet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Wallet_log', FILENAME = N'F:\Programas\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Wallet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Wallet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wallet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wallet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wallet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wallet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wallet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wallet] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wallet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wallet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wallet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wallet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wallet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wallet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wallet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wallet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wallet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wallet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Wallet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wallet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wallet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wallet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wallet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wallet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wallet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wallet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wallet] SET  MULTI_USER 
GO
ALTER DATABASE [Wallet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wallet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wallet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wallet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wallet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Wallet] SET QUERY_STORE = OFF
GO
USE [Wallet]
GO
/****** Object:  Table [dbo].[cuenta]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nro_cuenta] [bigint] NOT NULL,
	[cvu] [bigint] NOT NULL,
	[saldo] [float] NOT NULL,
	[moneda_id] [int] NOT NULL,
	[usuario_id] [bigint] NOT NULL,
 CONSTRAINT [PK_cuenta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_cuenta_cvu] UNIQUE NONCLUSTERED 
(
	[cvu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_cuenta_nro_cuenta] UNIQUE NONCLUSTERED 
(
	[nro_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datos_usuarios]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datos_usuarios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[dni] [int] NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[codigo_postal] [varchar](10) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[dato_biometrico] [varchar](50) NULL,
	[usuario_id] [bigint] NOT NULL,
	[localidad_id] [int] NOT NULL,
 CONSTRAINT [PK_datos_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_datos_usuarios_dni] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deposito]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deposito](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[monto] [float] NOT NULL,
	[fecha] [timestamp] NOT NULL,
	[cuenta_destino] [bigint] NOT NULL,
 CONSTRAINT [PK_deposito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado_factura]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_factura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_estado_factura] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nro_factura] [bigint] NOT NULL,
	[monto] [float] NOT NULL,
	[fecha_primer_vencimiento] [date] NOT NULL,
	[fecha_segundo_vencimiento] [date] NULL,
	[monto_primer_vencimineto] [float] NOT NULL,
	[monto_segundo_vencimiento] [float] NULL,
	[servicio_id] [bigint] NOT NULL,
	[estado_factura_id] [int] NOT NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_localidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[moneda]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[moneda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[valor_dolares] [float] NOT NULL,
 CONSTRAINT [PK_moneda] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pago_servicio]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago_servicio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [timestamp] NOT NULL,
	[monto] [float] NOT NULL,
	[factura_id] [bigint] NOT NULL,
	[cuenta_id] [bigint] NOT NULL,
 CONSTRAINT [PK_pago_servicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plazo_fijo]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plazo_fijo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha_creacion] [timestamp] NOT NULL,
	[fecha_inicio_plazo] [date] NOT NULL,
	[fecha_fin_plazo] [date] NOT NULL,
	[interes] [float] NOT NULL,
	[monto] [float] NOT NULL,
	[cuenta_id] [bigint] NOT NULL,
	[moneda_id] [int] NOT NULL,
	[tipo_plazo_fijo_id] [int] NOT NULL,
 CONSTRAINT [PK_plazo_fijo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rubro]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rubro](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[tipo_servicio_id] [bigint] NOT NULL,
 CONSTRAINT [PK_rubro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicio]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](100) NOT NULL,
	[cuit] [bigint] NOT NULL,
	[rubro_id] [bigint] NOT NULL,
 CONSTRAINT [PK_servicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_servicio] UNIQUE NONCLUSTERED 
(
	[cuit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_plazo_fijo]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_plazo_fijo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[interes] [float] NOT NULL,
 CONSTRAINT [PK_tipo_plazo_fijo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_servicio]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_servicio](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_servicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transferencia]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transferencia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[monto] [float] NOT NULL,
	[fecha] [timestamp] NOT NULL,
	[cuenta_origen] [bigint] NOT NULL,
	[cuenta_destino] [bigint] NOT NULL,
 CONSTRAINT [PK_transferencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 2/10/2020 10:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nick] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_usuario] UNIQUE NONCLUSTERED 
(
	[nick] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_moneda] FOREIGN KEY([moneda_id])
REFERENCES [dbo].[moneda] ([id])
GO
ALTER TABLE [dbo].[cuenta] CHECK CONSTRAINT [FK_cuenta_moneda]
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[cuenta] CHECK CONSTRAINT [FK_cuenta_usuario]
GO
ALTER TABLE [dbo].[datos_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_datos_usuarios_localidad] FOREIGN KEY([localidad_id])
REFERENCES [dbo].[localidad] ([id])
GO
ALTER TABLE [dbo].[datos_usuarios] CHECK CONSTRAINT [FK_datos_usuarios_localidad]
GO
ALTER TABLE [dbo].[datos_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_datos_usuarios_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[datos_usuarios] CHECK CONSTRAINT [FK_datos_usuarios_usuario]
GO
ALTER TABLE [dbo].[deposito]  WITH CHECK ADD  CONSTRAINT [FK_deposito_deposito] FOREIGN KEY([cuenta_destino])
REFERENCES [dbo].[cuenta] ([id])
GO
ALTER TABLE [dbo].[deposito] CHECK CONSTRAINT [FK_deposito_deposito]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_estado_factura] FOREIGN KEY([estado_factura_id])
REFERENCES [dbo].[estado_factura] ([id])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_estado_factura]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_servicio] FOREIGN KEY([servicio_id])
REFERENCES [dbo].[servicio] ([id])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_servicio]
GO
ALTER TABLE [dbo].[pago_servicio]  WITH CHECK ADD  CONSTRAINT [FK_pago_servicio_cuenta] FOREIGN KEY([cuenta_id])
REFERENCES [dbo].[cuenta] ([id])
GO
ALTER TABLE [dbo].[pago_servicio] CHECK CONSTRAINT [FK_pago_servicio_cuenta]
GO
ALTER TABLE [dbo].[pago_servicio]  WITH CHECK ADD  CONSTRAINT [FK_pago_servicio_factura] FOREIGN KEY([factura_id])
REFERENCES [dbo].[factura] ([id])
GO
ALTER TABLE [dbo].[pago_servicio] CHECK CONSTRAINT [FK_pago_servicio_factura]
GO
ALTER TABLE [dbo].[plazo_fijo]  WITH CHECK ADD  CONSTRAINT [FK_plazo_fijo_cuenta] FOREIGN KEY([cuenta_id])
REFERENCES [dbo].[cuenta] ([id])
GO
ALTER TABLE [dbo].[plazo_fijo] CHECK CONSTRAINT [FK_plazo_fijo_cuenta]
GO
ALTER TABLE [dbo].[plazo_fijo]  WITH CHECK ADD  CONSTRAINT [FK_plazo_fijo_moneda] FOREIGN KEY([moneda_id])
REFERENCES [dbo].[moneda] ([id])
GO
ALTER TABLE [dbo].[plazo_fijo] CHECK CONSTRAINT [FK_plazo_fijo_moneda]
GO
ALTER TABLE [dbo].[plazo_fijo]  WITH CHECK ADD  CONSTRAINT [FK_plazo_fijo_tipo_plazo_fijo] FOREIGN KEY([tipo_plazo_fijo_id])
REFERENCES [dbo].[tipo_plazo_fijo] ([id])
GO
ALTER TABLE [dbo].[plazo_fijo] CHECK CONSTRAINT [FK_plazo_fijo_tipo_plazo_fijo]
GO
ALTER TABLE [dbo].[rubro]  WITH CHECK ADD  CONSTRAINT [FK_rubro_tipo_servicio] FOREIGN KEY([tipo_servicio_id])
REFERENCES [dbo].[tipo_servicio] ([id])
GO
ALTER TABLE [dbo].[rubro] CHECK CONSTRAINT [FK_rubro_tipo_servicio]
GO
ALTER TABLE [dbo].[servicio]  WITH CHECK ADD  CONSTRAINT [FK_servicio_rubro] FOREIGN KEY([rubro_id])
REFERENCES [dbo].[rubro] ([id])
GO
ALTER TABLE [dbo].[servicio] CHECK CONSTRAINT [FK_servicio_rubro]
GO
ALTER TABLE [dbo].[transferencia]  WITH CHECK ADD  CONSTRAINT [FK_transferencia_cuenta] FOREIGN KEY([cuenta_origen])
REFERENCES [dbo].[cuenta] ([id])
GO
ALTER TABLE [dbo].[transferencia] CHECK CONSTRAINT [FK_transferencia_cuenta]
GO
ALTER TABLE [dbo].[transferencia]  WITH CHECK ADD  CONSTRAINT [FK_transferencia_cuenta1] FOREIGN KEY([cuenta_destino])
REFERENCES [dbo].[cuenta] ([id])
GO
ALTER TABLE [dbo].[transferencia] CHECK CONSTRAINT [FK_transferencia_cuenta1]
GO
USE [master]
GO
ALTER DATABASE [Wallet] SET  READ_WRITE 
GO
