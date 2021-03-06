USE [master]
GO
/****** Object:  Database [Gas Turbines]    Script Date: 21.04.2019 20:27:54 ******/
CREATE DATABASE [Gas Turbines]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gas Turbines', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Gas Turbines.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Gas Turbines_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Gas Turbines_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Gas Turbines] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gas Turbines].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gas Turbines] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gas Turbines] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gas Turbines] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gas Turbines] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gas Turbines] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gas Turbines] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gas Turbines] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gas Turbines] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gas Turbines] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gas Turbines] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gas Turbines] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gas Turbines] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gas Turbines] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gas Turbines] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gas Turbines] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gas Turbines] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gas Turbines] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gas Turbines] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gas Turbines] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gas Turbines] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gas Turbines] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gas Turbines] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gas Turbines] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gas Turbines] SET  MULTI_USER 
GO
ALTER DATABASE [Gas Turbines] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gas Turbines] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gas Turbines] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gas Turbines] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Gas Turbines] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Gas Turbines]
GO
/****** Object:  Table [dbo].[FlowAndTemperatureGasFromTemperature]    Script Date: 21.04.2019 20:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FlowAndTemperatureGasFromTemperature](
	[FlowGas] [real] NOT NULL,
	[TemperatureGas] [real] NOT NULL,
	[Temperature] [int] NOT NULL,
	[GasTurbine] [varchar](65) NOT NULL,
 CONSTRAINT [PK_FlowAndTemperatureGasFromTemperature] PRIMARY KEY CLUSTERED 
(
	[Temperature] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GasConsumptionFromTemperature]    Script Date: 21.04.2019 20:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GasConsumptionFromTemperature](
	[GasConsumption] [real] NOT NULL,
	[GasConsumptionGTD] [real] NOT NULL,
	[Temperature] [int] NOT NULL,
	[GasTurbine] [varchar](65) NOT NULL,
 CONSTRAINT [PK_GasConsumptionFromTemperature] PRIMARY KEY CLUSTERED 
(
	[Temperature] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GasTurine]    Script Date: 21.04.2019 20:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GasTurine](
	[name] [varchar](65) NOT NULL,
 CONSTRAINT [PK_GasTurine] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PowerAndEfficiencyFromTemperature]    Script Date: 21.04.2019 20:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PowerAndEfficiencyFromTemperature](
	[Power] [real] NOT NULL,
	[Efficiency] [real] NOT NULL,
	[Temperature] [int] NOT NULL,
	[GasTurbine] [varchar](65) NOT NULL,
 CONSTRAINT [PK_PowerAndEfficiencyFromTemperature] PRIMARY KEY CLUSTERED 
(
	[Temperature] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FlowAndTemperatureGasFromTemperature]  WITH CHECK ADD  CONSTRAINT [FK_FlowAndTemperatureGasFromTemperature_GasTurine] FOREIGN KEY([GasTurbine])
REFERENCES [dbo].[GasTurine] ([name])
GO
ALTER TABLE [dbo].[FlowAndTemperatureGasFromTemperature] CHECK CONSTRAINT [FK_FlowAndTemperatureGasFromTemperature_GasTurine]
GO
ALTER TABLE [dbo].[GasConsumptionFromTemperature]  WITH CHECK ADD  CONSTRAINT [FK_GasConsumptionFromTemperature_GasTurine] FOREIGN KEY([GasTurbine])
REFERENCES [dbo].[GasTurine] ([name])
GO
ALTER TABLE [dbo].[GasConsumptionFromTemperature] CHECK CONSTRAINT [FK_GasConsumptionFromTemperature_GasTurine]
GO
ALTER TABLE [dbo].[PowerAndEfficiencyFromTemperature]  WITH CHECK ADD  CONSTRAINT [FK_PowerAndEfficiencyFromTemperature_GasTurine] FOREIGN KEY([GasTurbine])
REFERENCES [dbo].[GasTurine] ([name])
GO
ALTER TABLE [dbo].[PowerAndEfficiencyFromTemperature] CHECK CONSTRAINT [FK_PowerAndEfficiencyFromTemperature_GasTurine]
GO
USE [master]
GO
ALTER DATABASE [Gas Turbines] SET  READ_WRITE 
GO
