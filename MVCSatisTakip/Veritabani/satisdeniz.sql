USE [master]
GO
/****** Object:  Database [satistakip]    Script Date: 30.12.2022 20:06:44 ******/
CREATE DATABASE [satistakip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'satistakip', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\satistakip.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'satistakip_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\satistakip_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [satistakip] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [satistakip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [satistakip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [satistakip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [satistakip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [satistakip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [satistakip] SET ARITHABORT OFF 
GO
ALTER DATABASE [satistakip] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [satistakip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [satistakip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [satistakip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [satistakip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [satistakip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [satistakip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [satistakip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [satistakip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [satistakip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [satistakip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [satistakip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [satistakip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [satistakip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [satistakip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [satistakip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [satistakip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [satistakip] SET RECOVERY FULL 
GO
ALTER DATABASE [satistakip] SET  MULTI_USER 
GO
ALTER DATABASE [satistakip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [satistakip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [satistakip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [satistakip] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [satistakip] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [satistakip] SET QUERY_STORE = OFF
GO
USE [satistakip]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [satistakip]
GO
/****** Object:  Table [dbo].[tbl_kategori]    Script Date: 30.12.2022 20:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_kategori](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAd] [varchar](30) NULL,
 CONSTRAINT [PK_tbl_kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[kategori]    Script Date: 30.12.2022 20:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[kategori] as
Select * from tbl_kategori 
GO
/****** Object:  Table [dbo].[tbl_login]    Script Date: 30.12.2022 20:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_login](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kuladi] [varchar](30) NULL,
	[Sifre] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_musteri]    Script Date: 30.12.2022 20:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_musteri](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAdsoyad] [varchar](50) NULL,
	[Telno] [varchar](20) NULL,
	[TC] [varchar](11) NULL,
	[Adres] [text] NULL,
	[Meslek] [varchar](30) NULL,
	[Sehir] [varchar](20) NULL,
 CONSTRAINT [PK_tbl_musteri] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_satis]    Script Date: 30.12.2022 20:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_satis](
	[SatisID] [int] IDENTITY(1,1) NOT NULL,
	[SatisFiyat] [decimal](18, 2) NULL,
	[Satisadet] [int] NULL,
	[Satistarih] [smalldatetime] NULL,
	[Urun] [int] NULL,
	[Musteri] [int] NULL,
 CONSTRAINT [PK_tbl_satis] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_urun]    Script Date: 30.12.2022 20:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_urun](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[Urunad] [varchar](50) NULL,
	[Marka] [varchar](30) NULL,
	[UrunFiyat] [decimal](18, 2) NULL,
	[UrunStok] [int] NULL,
	[Kategori] [int] NULL,
 CONSTRAINT [PK_tbl_urun] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_kategori] ON 

INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (1, N'Kıyafet')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (2, N'Cep telefonu')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (3, N'Bilgisayar')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (4, N'Beyaz Eşya')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (5, N'Küçük Ev. Alt.')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (7, N'yemek')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (8, N'Oyun Konsol')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (13, N'Kamera/Video Kamera')
SET IDENTITY_INSERT [dbo].[tbl_kategori] OFF
SET IDENTITY_INSERT [dbo].[tbl_login] ON 

INSERT [dbo].[tbl_login] ([ID], [Kuladi], [Sifre]) VALUES (1, N'Aydintu', N'1234')
SET IDENTITY_INSERT [dbo].[tbl_login] OFF
SET IDENTITY_INSERT [dbo].[tbl_musteri] ON 

INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Meslek], [Sehir]) VALUES (1, N'Mehmet Emin KESMEN', N'05423221542', N'12354312547', N'Kayabaşı/Başakşehir', N'Çaycı', N'İstanbul')
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Meslek], [Sehir]) VALUES (2, N'Ahmet Enes ORUÇ', N'05369529989', N'29138024436', N'Altın Tepsi Mah./Bayrampaşa', N'Serbest', N'Kırlareli')
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Meslek], [Sehir]) VALUES (5, N'Deniz', N'(535) 352-5352', N'12534533262', N'Ünalan Mah.', N'Değnekçi', N'İstanbul')
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Meslek], [Sehir]) VALUES (12, N'Bruce Wayne', N'911', N'1111111111', N'Gotham, BatSokak', N'Torbacı', N'Houston')
SET IDENTITY_INSERT [dbo].[tbl_musteri] OFF
SET IDENTITY_INSERT [dbo].[tbl_satis] ON 

INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (3, CAST(13000.00 AS Decimal(18, 2)), 3, CAST(N'2022-05-22T00:00:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (5, CAST(17999.00 AS Decimal(18, 2)), 1, CAST(N'2022-12-30T00:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (6, CAST(17999.00 AS Decimal(18, 2)), 95, CAST(N'2022-12-30T00:00:00' AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_satis] OFF
SET IDENTITY_INSERT [dbo].[tbl_urun] ON 

INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (1, N'İphone 14 Pro', N'Apple', CAST(57000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (2, N'Sweattshirt', N'Mavi', CAST(459.00 AS Decimal(18, 2)), 250, 1)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (3, N'Thinkbook', N'Lenovo', CAST(15999.00 AS Decimal(18, 2)), 150, 4)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (4, N'Buzdolabı', N'Arçelik', CAST(17999.00 AS Decimal(18, 2)), 20, 4)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (5, N'Ütü', N'Fakir', CAST(2799.00 AS Decimal(18, 2)), 100, 5)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (6, N'Red Mi Note 10 Pro', N'Xaomi', CAST(7999.00 AS Decimal(18, 2)), 500, 2)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (9, N'Macbook', N'Apple', CAST(21999.00 AS Decimal(18, 2)), 100, 3)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (10, N'Ütü', N'Rowenta', CAST(2599.00 AS Decimal(18, 2)), 100, 5)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (11, N'Mi Band 10', N'Xiaomi', CAST(1000.00 AS Decimal(18, 2)), 15, 2)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (12, N'Laptop', N'Lenova', CAST(17999.00 AS Decimal(18, 2)), 10, 3)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (13, N'Domates', N'Enflasyon %200', CAST(50.00 AS Decimal(18, 2)), 100, 7)
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori]) VALUES (14, N'Golf GTI', N'Volkswagen', CAST(2100000.00 AS Decimal(18, 2)), 10, 8)
SET IDENTITY_INSERT [dbo].[tbl_urun] OFF
ALTER TABLE [dbo].[tbl_satis]  WITH CHECK ADD  CONSTRAINT [FK_tbl_satis_tbl_musteri] FOREIGN KEY([Musteri])
REFERENCES [dbo].[tbl_musteri] ([MusteriID])
GO
ALTER TABLE [dbo].[tbl_satis] CHECK CONSTRAINT [FK_tbl_satis_tbl_musteri]
GO
ALTER TABLE [dbo].[tbl_satis]  WITH CHECK ADD  CONSTRAINT [FK_tbl_satis_tbl_urun] FOREIGN KEY([Urun])
REFERENCES [dbo].[tbl_urun] ([UrunID])
GO
ALTER TABLE [dbo].[tbl_satis] CHECK CONSTRAINT [FK_tbl_satis_tbl_urun]
GO
ALTER TABLE [dbo].[tbl_urun]  WITH CHECK ADD  CONSTRAINT [FK_tbl_urun_tbl_kategori] FOREIGN KEY([Kategori])
REFERENCES [dbo].[tbl_kategori] ([KategoriID])
GO
ALTER TABLE [dbo].[tbl_urun] CHECK CONSTRAINT [FK_tbl_urun_tbl_kategori]
GO
/****** Object:  StoredProcedure [dbo].[Urungetir]    Script Date: 30.12.2022 20:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Urungetir]
As
Select top 1 Marka from tbl_urun group by Marka Order By
COUNT(*) desc
GO
USE [master]
GO
ALTER DATABASE [satistakip] SET  READ_WRITE 
GO
