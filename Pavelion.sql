USE [master]
GO
/****** Object:  Database [Pavelion]    Script Date: 13.02.2023 17:05:46 ******/
CREATE DATABASE [Pavelion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pavelion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\Pavelion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pavelion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\Pavelion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pavelion] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pavelion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pavelion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pavelion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pavelion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pavelion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pavelion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pavelion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pavelion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pavelion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pavelion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pavelion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pavelion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pavelion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pavelion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pavelion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pavelion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pavelion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pavelion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pavelion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pavelion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pavelion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pavelion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pavelion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pavelion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pavelion] SET  MULTI_USER 
GO
ALTER DATABASE [Pavelion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pavelion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pavelion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pavelion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pavelion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pavelion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Pavelion] SET QUERY_STORE = OFF
GO
USE [Pavelion]
GO
/****** Object:  Table [dbo].[arenda]    Script Date: 13.02.2023 17:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arenda](
	[Arenda_Id] [int] IDENTITY(1,1) NOT NULL,
	[Arendator_Id] [int] NULL,
	[Nazvanie_TC] [varchar](20) NULL,
	[Sotrudnil_Id] [int] NULL,
	[Pavilion] [varchar](max) NULL,
	[Status] [varchar](max) NULL,
	[nachalo_Arend] [date] NULL,
	[konec_Arend] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Arenda_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arendator]    Script Date: 13.02.2023 17:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arendator](
	[Arendator_Id] [int] IDENTITY(1,1) NOT NULL,
	[Arenda_Id] [int] NULL,
	[nazvanie] [varchar](max) NULL,
	[nomer] [varchar](max) NULL,
	[adres] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Arendator_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pavilion]    Script Date: 13.02.2023 17:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pavilion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nazvanie_Tc] [varchar](20) NULL,
	[nomer_paviliona] [varchar](max) NULL,
	[etaj] [int] NULL,
	[status] [varchar](max) NULL,
	[plochad] [float] NULL,
	[stoimost_za_kv] [float] NULL,
	[kof_dobav_stoimosti] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotrudniki]    Script Date: 13.02.2023 17:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotrudniki](
	[FIO] [varchar](max) NULL,
	[Login] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[Role] [varchar](max) NULL,
	[nomer_telefona] [varchar](max) NULL,
	[Pol] [varchar](max) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Foto] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TC1]    Script Date: 13.02.2023 17:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TC1](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nazvanie] [varchar](20) NOT NULL,
	[Status] [varchar](max) NULL,
	[Kol_Pavilionov] [int] NULL,
	[Gorod] [varchar](max) NULL,
	[Stoimost] [float] NULL,
	[Kof_Dobav_Stoimosti] [float] NULL,
	[Etajnost] [int] NULL,
	[Fhoto] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[Nazvanie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[arenda] ON 

INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (42, 2, N'Мега Белая Дача', 2, N'88А', N'Открыт', CAST(N'2019-01-24' AS Date), CAST(N'2020-11-17' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (43, 2, N'Авиапарк', 7, N'40А', N'Ожидание', CAST(N'2019-11-21' AS Date), CAST(N'2020-04-18' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (44, 5, N'Рио', 11, N'61А', N'Закрыт', CAST(N'2018-11-12' AS Date), CAST(N'2019-06-28' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (45, 1, N'Гранд', 2, N'58В', N'Закрыт', CAST(N'2018-10-18' AS Date), CAST(N'2019-09-16' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (46, 5, N'Лужайка', 7, N'7А', N'Ожидание', CAST(N'2019-12-19' AS Date), CAST(N'2020-06-26' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (47, 2, N'Кунцево Плаза', 11, N'13Б', N'Ожидание', CAST(N'2019-12-16' AS Date), CAST(N'2020-05-12' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (48, 4, N'Мозаика', 2, N'60В', N'Ожидание', CAST(N'2019-12-06' AS Date), CAST(N'2020-10-16' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (49, 2, N'Гранд', 11, N'56А', N'Закрыт', CAST(N'2018-09-03' AS Date), CAST(N'2019-02-10' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (50, 2, N'Гранд', 2, N'63Г', N'Ожидание', CAST(N'2019-11-04' AS Date), CAST(N'2020-06-27' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (51, 4, N'Бутово Молл', 7, N'8Г', N'Закрыт', CAST(N'2018-11-08' AS Date), CAST(N'2019-01-16' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (52, 1, N'Гранд', 2, N'94В', N'Открыт', CAST(N'2019-06-07' AS Date), CAST(N'2020-03-18' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (53, 1, N'Шоколад', 2, N'87Г', N'Ожидание', CAST(N'2019-11-15' AS Date), CAST(N'2020-06-20' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (54, 5, N'АфиМолл Сити', 11, N'93В', N'Закрыт', CAST(N'2018-10-09' AS Date), CAST(N'2019-09-22' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (55, 5, N'Европейский', 7, N'10А', N'Ожидание', CAST(N'2019-11-24' AS Date), CAST(N'2020-07-17' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (56, 1, N'Шереметьевский', 7, N'53Г', N'Закрыт', CAST(N'2018-07-20' AS Date), CAST(N'2019-06-07' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (57, 3, N'Шереметьевский', 11, N'73В', N'Открыт', CAST(N'2019-02-04' AS Date), CAST(N'2020-07-08' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (58, 2, N'Мега Химки', 2, N'89Б', N'Открыт', CAST(N'2019-08-06' AS Date), CAST(N'2020-08-20' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (60, 3, N'Шереметьевский', 2, N'34Б', N'Ожидание', CAST(N'2019-12-16' AS Date), CAST(N'2020-03-16' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (61, 3, N'Шереметьевский', 11, N'91Г', N'Закрыт', CAST(N'2018-08-24' AS Date), CAST(N'2019-08-04' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (62, 5, N'Ашан Сити Капитолий', 2, N'70Г', N'Ожидание', CAST(N'2019-11-09' AS Date), CAST(N'2020-08-17' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (63, 4, N'Черемушки', 7, N'10А', N'Ожидание', CAST(N'2019-12-02' AS Date), CAST(N'2020-07-24' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (64, 2, N'Филион', 11, N'80Г', N'Ожидание', CAST(N'2019-11-23' AS Date), CAST(N'2020-08-06' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (67, 3, N'Хорошо', 7, N'83Г', N'Закрыт', CAST(N'2018-11-14' AS Date), CAST(N'2019-04-19' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (68, 4, N'Щука', 11, N'9Г', N'Ожидание', CAST(N'2019-12-26' AS Date), CAST(N'2020-09-13' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (69, 1, N'Атриум', 2, N'49Г', N'Закрыт', CAST(N'2018-09-16' AS Date), CAST(N'2019-02-12' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (72, 3, N'Реутов Парк', 11, N'27В', N'Ожидание', CAST(N'2019-12-18' AS Date), CAST(N'2020-05-23' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (73, 5, N'ГУМ', 7, N'86Г', N'Открыт', CAST(N'2019-04-01' AS Date), CAST(N'2020-12-19' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (74, 4, N'Райкин Плаза', 11, N'98А', N'Ожидание', CAST(N'2019-11-22' AS Date), CAST(N'2020-08-15' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (75, 3, N'Новинский пассаж', 11, N'11Г', N'Закрыт', CAST(N'2018-10-08' AS Date), CAST(N'2019-07-21' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (76, 2, N'Фестиваль', 2, N'42В', N'Открыт', CAST(N'2019-04-07' AS Date), CAST(N'2020-03-05' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (77, 1, N'Красный Кит', 7, N'55А', N'Ожидание', CAST(N'2019-11-07' AS Date), CAST(N'2020-03-08' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (78, 3, N'Фестиваль', 2, N'6Б', N'Открыт', CAST(N'2019-07-15' AS Date), CAST(N'2020-04-25' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (79, 1, N'Отрада', 2, N'15А', N'Ожидание', CAST(N'2019-12-09' AS Date), CAST(N'2020-12-02' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (80, 4, N'Фестиваль', 11, N'27Б', N'Закрыт', CAST(N'2018-08-05' AS Date), CAST(N'2019-06-14' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (81, 2, N'Времена Года', 11, N'26А', N'Открыт', CAST(N'2019-08-19' AS Date), CAST(N'2020-09-02' AS Date))
INSERT [dbo].[arenda] ([Arenda_Id], [Arendator_Id], [Nazvanie_TC], [Sotrudnil_Id], [Pavilion], [Status], [nachalo_Arend], [konec_Arend]) VALUES (82, 4, N'Времена Года', 7, N'53В', N'Закрыт', CAST(N'2018-09-20' AS Date), CAST(N'2019-02-12' AS Date))
SET IDENTITY_INSERT [dbo].[arenda] OFF
GO
SET IDENTITY_INSERT [dbo].[Arendator] ON 

INSERT [dbo].[Arendator] ([Arendator_Id], [Arenda_Id], [nazvanie], [nomer], [adres]) VALUES (1, 1, N'AG Marine', N'+7(495)526-14-53', N'Москва, Бабаевская улица д.16')
INSERT [dbo].[Arendator] ([Arendator_Id], [Arenda_Id], [nazvanie], [nomer], [adres]) VALUES (2, 2, N'Art-elle', N'+7(495)250-58-94', N'Санкт-Петербург, Амбарная улица д.25 корп.1')
INSERT [dbo].[Arendator] ([Arendator_Id], [Arenda_Id], [nazvanie], [nomer], [adres]) VALUES (3, 3, N'Atlantis', N'+7(495)424-11-65', N'Новосибирск, Улица Каменская д.16')
INSERT [dbo].[Arendator] ([Arendator_Id], [Arenda_Id], [nazvanie], [nomer], [adres]) VALUES (4, 4, N'Corporate Travel', N'+7(495)245-39-05', N'Екатеринбург, Улица Антона Валека д.56')
INSERT [dbo].[Arendator] ([Arendator_Id], [Arenda_Id], [nazvanie], [nomer], [adres]) VALUES (5, 5, N'GallaDance', N'+7(495)316-77-94', N'Нижний Новгород, Улица Ларина д. 34')
SET IDENTITY_INSERT [dbo].[Arendator] OFF
GO
SET IDENTITY_INSERT [dbo].[pavilion] ON 

INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (1, N'Мега Белая Дача', N'88А', 1, N'Свободен', 75, 3307.7, 0.1)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (2, N'Авиапарк', N'40А', 3, N'Забронировано', 96, 690, 1.1)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (3, N'Мега Белая Дача', N'76Б', 2, N'Удален', 199, 4938, 0.9)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (4, N'Рио', N'61А', 1, N'Арендован', 186, 2115, 0.9)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (5, N'Гранд', N'58В', 4, N'Арендован', 98, 1306, 1.9)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (6, N'Лужайка', N'7А', 2, N'Забронировано', 187, 2046, 1)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (7, N'Кунцево Плаза', N'13Б', 1, N'Забронировано', 141, 1131, 0.1)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (8, N'Мозаика', N'60В', 2, N'Забронировано', 94, 361, 0.3)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (9, N'Гранд', N'56А', 1, N'Арендован', 148, 1163, 0.6)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (10, N'Гранд', N'63Г', 2, N'Забронировано', 153, 3486, 0.7)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (11, N'Бутово Молл', N'8Г', 1, N'Арендован', 122, 2451, 1.5)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (12, N'Гранд', N'94В', 3, N'Свободен', 132, 4825, 2)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (13, N'Шоколад', N'87Г', 1, N'Забронировано', 174, 793, 1.5)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (14, N'АфиМолл Сити', N'93В', 1, N'Арендован', 165, 4937, 0.8)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (15, N'Европейский', N'10А', 3, N'Забронировано', 168, 1353, 1.7)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (16, N'Шереметьевский', N'53Г', 1, N'Арендован', 99, 3924, 1)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (17, N'Шереметьевский', N'73В', 2, N'Свободен', 116, 3418, 0)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (18, N'Мега Химки', N'89Б', 1, N'Свободен', 92, 562, 0.4)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (19, N'Москва', N'44Г', 2, N'Забронирован', 66.6, 870.3, 1)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (20, N'Вегас Кунцево', N'65А', 2, N'Забронирован', 95, 1381, 1.7)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (21, N'Город Лефортово', N'16Г', 2, N'Удален', 150, 747, 0.8)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (23, N'Шереметьевский', N'34Б', 4, N'Забронировано', 102, 4715, 0.3)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (24, N'Шереметьевский', N'91Г', 3, N'Арендован', 171, 1021, 1.2)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (25, N'Ашан Сити Капитолий', N'70Г', 1, N'Забронировано', 83, 2246, 1.4)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (26, N'Черемушки', N'10А', 1, N'Забронирован', 187, 2067, 0)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (27, N'Филион', N'80Г', 1, N'Забронировано', 117, 1049, 1.3)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (30, N'Калейдоскоп', N'16Г', 2, N'Арендован', 125, 1037, 1.3)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (32, N'Хорошо', N'83Г', 2, N'Арендован', 85.5, 4584, 0.3)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (33, N'Щука', N'9Г', 1, N'Забронировано', 131, 2477, 1.5)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (34, N'Атриум', N'49Г', 1, N'Арендован', 164, 2728, 0.9)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (35, N'Принц Плаза', N'1Г', 1, N'Удален', 157, 1963, 1.6)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (38, N'Реутов Парк', N'27В', 1, N'Забронировано', 96, 3134, 0.1)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (39, N'ЕвроПарк', N'67Б', 1, N'Удален', 55, 4442, 0.8)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (40, N'ГУМ', N'86Г', 1, N'Свободен', 58, 3707, 0.5)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (41, N'Райкин Плаза', N'98А', 3, N'Забронировано', 172.5, 4951, 1.1)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (42, N'Новинский пассаж', N'11Г', 2, N'Арендован', 194, 827, 0.6)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (43, N'Фестиваль', N'42В', 1, N'Свободен', 166, 4216, 0.7)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (44, N'Красный Кит', N'55А', 2, N'Забронировано', 127, 703.1, 1)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (45, N'Фестиваль', N'6Б', 2, N'Свободен', 119, 3262, 1.9)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (46, N'Отрада', N'15А', 1, N'Забронировано', 90, 1569, 1.3)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (47, N'Фестиваль', N'27Б', 3, N'Арендован', 132, 627, 0.4)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (48, N'Фестиваль', N'65Б', 4, N'Удален', 60, 3052, 0.6)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (49, N'Времена Года', N'26А', 1, N'Свободен', 95, 670, 1.7)
INSERT [dbo].[pavilion] ([ID], [nazvanie_Tc], [nomer_paviliona], [etaj], [status], [plochad], [stoimost_za_kv], [kof_dobav_stoimosti]) VALUES (50, N'Времена Года', N'53В', 3, N'Арендован', 132, 510, 1.2)
SET IDENTITY_INSERT [dbo].[pavilion] OFF
GO
SET IDENTITY_INSERT [dbo].[Sotrudniki] ON 

INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Чашин Елизар Михеевич', N'Elizor@gmai,com', N'yntiRS', N'Администратор', N' +7(1070)628 29 16', N'Мужской', 1, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Филенкова Владлена Олеговна', N'Vladlena@gmai.com', N'07i7Lb', N'Менеджер А', N' +7(334)1460151', N'Женский', 2, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Ломовцев Адам Владимирович', N'Adam@gmai.com', N'7SP9CV', N'Менеджер С', N'+7(8560)519-32-99', N'Мужской', 3, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Тепляков Кир Федосиевич', N'Kar@gmai.com', N'6QF1WB', N'Удален', N'+7(824)893-24-03', N'Мужской', 4, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Рюриков Юлий Глебович', N'Yli@gmai.com', N'GwffgE', N'Администратор', N'+7(6402)701-31-09', N'Мужской', 5, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Беломестина Василиса Тимофеевна', N'Vasilisa@gmai.com', N'd7iKKV', N'Администратор', N'+7(92)920-74-47', N'Женский', 6, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Панькива Галина Якововна', N'Galina@gmai.com', N'8KC7wJ', N'Менеджер А', N' +7 (405) 088 73 89', N'Женский', 7, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Зарубин Мирон Мечиславович', N'Miron@@gmai,com', N'x58OAN', N'Администратор', N'+7(6010)195-02-09', N'Мужской', 8, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Веточкина Всеслава Андрияновна', N'Vseslava@gmai.com', N'fhDSBf', N'Менеджер С', N'+7(078)429-57-86', N'Женский', 9, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Рябова Виктория Елизаровна', N'Victoria@gmai.com', N'9mlPQJ', N'Удален', N'+7(6394)904-01-61', N'Женский', 10, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'Федотов Леон Фёдорович', N'Anisa@gmai.com', N'Wh4OYm', N'Менеджер А', N' +7(22)3264959', N'Мужской', 11, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (N'   ', N'Feafan@@gmai,com', N'Kc1PeS', N'Менеджер С', N'+7(789)762-30-28', N'Мужской', 12, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (NULL, N'1', N'1', N'Менеджер С', NULL, NULL, 13, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (NULL, N'2', N'2', N'Менеджер А', NULL, NULL, 14, NULL)
INSERT [dbo].[Sotrudniki] ([FIO], [Login], [Password], [Role], [nomer_telefona], [Pol], [ID], [Foto]) VALUES (NULL, N'3', N'3', N'Администратор', NULL, NULL, 15, NULL)
SET IDENTITY_INSERT [dbo].[Sotrudniki] OFF
GO
SET IDENTITY_INSERT [dbo].[TC1] ON 

INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (50, N' Армада', N'План', 0, N'Ростов-на-Дону ', 9172489, 0.9, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (28, N' Весна', N'Удален', 3, N'Нижний Новгород', 4687701, 0.8, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (29, N' Гудзон', N'Реализация', 3, N'Екатеринбург', 7414460, 0, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (2, N'Авиапарк', N'Строительсто', 9, N'Санкт-Петербург', 3297976, 0.1, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (34, N'Атриум', N'Реализация', 4, N'Казань', 5059779, 0.2, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (14, N'АфиМолл Сити', N'Реализация', 9, N'Санкт-Петербург', 8729160, 0.9, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (25, N'Ашан Сити Капитолий', N'Строительсто', 4, N'Екатеринбург', 5309117, 1.9, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (11, N'Бутово Молл', N'План', 0, N'Москва', 5327641, 1.7, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (5, N'Вегас', N'План', 0, N'Нижний Новгород', 7567411, 0.4, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (20, N'Вегас Кунцево', N'Реализация', 12, N'Москва', 3878254, 0.2, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (49, N'Времена Года', N'Реализация', 15, N'Екатеринбург', 2650484, 1.7, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (16, N'Гагаринский', N'План', 0, N'Екатеринбург', 1508807, 1.6, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (21, N'Город Лефортово', N'Удален', 12, N'Новосибирск', 1966214, 1.7, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (10, N'Гранд', N'Строительсто', 20, N'Ростов-на-Дону ', 2573981, 0.1, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (40, N'ГУМ', N'Реализация', 5, N'Санкт-Петербург', 6731491, 1.9, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (39, N'ЕвроПарк', N'Удален', 20, N'Новосибирск', 9391338, 0.7, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (15, N'Европейский', N'Строительсто', 9, N'Москва', 5690500, 0.7, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (30, N'Калейдоскоп', N'Реализация', 10, N'Новосибирск', 7847659, 0.7, 2, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (44, N'Красный Кит', N'Строительсто', 9, N'Казань', 1912149, 1.1, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (7, N'Кунцево Плаза', N'Строительсто', 8, N'Челябинск', 6797653, 1.1, 2, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (6, N'Лужайка', N'Строительсто', 10, N'Казань', 4603336, 0.8, 2, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (3, N'Мега Белая Дача', N'Удален', 16, N'Новосибирск', 9006645, 1.7, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (18, N'Мега Химки', N'Реализация', 3, N'Нижний Новгород', 3373234, 0.4, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (45, N'Мегаполис', N'План', 0, N'Челябинск', 2175218.5, 0.5, 2, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (17, N'Метрополис', N'План', 0, N'Санкт-Петербург', 8117913, 0, 2, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (8, N'Мозаика', N'Строительсто', 20, N'Самара', 1429419, 0, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (19, N'Москва', N'Реализация', 12, N'Москва', 4226505, 0.3, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (43, N'Наш Гипермаркет', N'План', 0, N'Ростов-на-Дону ', 1088735, 1.2, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (42, N'Новинский пассаж', N'Реализация', 8, N'Екатеринбург', 3158957, 1.7, 2, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (31, N'Новомосковский', N'План', 0, N'Казань', 7161962.85, 0.4, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (36, N'Облака', N'План', 0, N'Санкт-Петербург', 1688905, 0.6, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (9, N'Океания', N'План', 0, N'Самара', 5192089, 1.8, 2, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (46, N'Отрада', N'Строительсто', 4, N'Санкт-Петербург', 6760316, 0.9, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (35, N'Принц Плаза', N'Реализация', 8, N'Самара', 1786688, 1.5, 2, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (41, N'Райкин Плаза', N'Строительсто', 12, N'Санкт-Петербург', 8498470, 1.8, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (38, N'Реутов Парк', N'Строительсто', 4, N'Ростов-на-Дону ', 1995904, 1.5, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (1, N'Ривьера', N'План', 0, N'Москва', 8260042, 0.5, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (12, N'Рига Молл', N'План', 0, N'Ростов-на-Дону ', 9788316, 0.7, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (4, N'Рио', N'Реализация', 5, N'Екатеринбург', 1888653, 0.5, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (47, N'Твой дом', N'План', 0, N'Челябинск', 6810865, 1.7, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (37, N'Три Кита', N'План', 0, N'Казань', 3089700, 1.7, 1, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (48, N'Фестиваль', N'Удален', 16, N'Новосибирск', 1828013, 0.2, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (27, N'Филион', N'Строительсто', 8, N'Москва', 5343904, 0.3, 2, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (24, N'Ханой-Москва', N'План', 0, N'Самара', 9580221, 0.3, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (32, N'Хорошо', N'Реализация', 20, N'Ростов-на-Дону ', 8306576, 1.9, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (26, N'Черемушки', N'Реализация', 15, N'Новосибирск', 7344604, 1, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (23, N'Шереметьевский', N'Строительсто', 16, N'Новосибирск', 2941379, 1, 4, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (13, N'Шоколад', N'Строительсто', 12, N'Челябинск', 2217279, 1.1, 3, NULL)
INSERT [dbo].[TC1] ([id], [Nazvanie], [Status], [Kol_Pavilionov], [Gorod], [Stoimost], [Kof_Dobav_Stoimosti], [Etajnost], [Fhoto]) VALUES (33, N'Щука', N'Строительсто', 5, N'Нижний Новгород', 5428485, 0.4, 1, NULL)
SET IDENTITY_INSERT [dbo].[TC1] OFF
GO
ALTER TABLE [dbo].[arenda]  WITH CHECK ADD  CONSTRAINT [FK_arenda_Arendator] FOREIGN KEY([Arendator_Id])
REFERENCES [dbo].[Arendator] ([Arendator_Id])
GO
ALTER TABLE [dbo].[arenda] CHECK CONSTRAINT [FK_arenda_Arendator]
GO
ALTER TABLE [dbo].[arenda]  WITH CHECK ADD  CONSTRAINT [FK_arenda_Sotrudniki] FOREIGN KEY([Sotrudnil_Id])
REFERENCES [dbo].[Sotrudniki] ([ID])
GO
ALTER TABLE [dbo].[arenda] CHECK CONSTRAINT [FK_arenda_Sotrudniki]
GO
ALTER TABLE [dbo].[arenda]  WITH CHECK ADD  CONSTRAINT [FK_arenda_TC1] FOREIGN KEY([Nazvanie_TC])
REFERENCES [dbo].[TC1] ([Nazvanie])
GO
ALTER TABLE [dbo].[arenda] CHECK CONSTRAINT [FK_arenda_TC1]
GO
ALTER TABLE [dbo].[pavilion]  WITH CHECK ADD  CONSTRAINT [FK_pavilion_TC1] FOREIGN KEY([nazvanie_Tc])
REFERENCES [dbo].[TC1] ([Nazvanie])
GO
ALTER TABLE [dbo].[pavilion] CHECK CONSTRAINT [FK_pavilion_TC1]
GO
USE [master]
GO
ALTER DATABASE [Pavelion] SET  READ_WRITE 
GO
