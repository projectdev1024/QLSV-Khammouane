USE [master]
GO
/****** Object:  Database [QLSV]    Script Date: 2018-05-13 16:26:58 ******/
CREATE DATABASE [QLSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLSV.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLSV_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLSV] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLSV] SET  MULTI_USER 
GO
ALTER DATABASE [QLSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLSV] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLSV]
GO
/****** Object:  Table [dbo].[CTDT]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDT](
	[IDCTDT] [int] IDENTITY(1,1) NOT NULL,
	[IDNganhHoc] [int] NULL,
	[IDMonHoc] [int] NULL,
	[KyHoc] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_CTDT] PRIMARY KEY CLUSTERED 
(
	[IDCTDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[IDGiaoVien] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Avatar] [nvarchar](500) NULL,
	[Adress] [nvarchar](50) NULL,
	[CMND] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Male] [bit] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK_GiaoVien] PRIMARY KEY CLUSTERED 
(
	[IDGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocPhi]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocPhi](
	[IDHocPhi] [int] IDENTITY(1,1) NOT NULL,
	[IDInfoKyHoc] [int] NULL,
	[IDSinhVien] [int] NULL,
	[Total] [int] NULL,
	[Paid] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_HocPhi] PRIMARY KEY CLUSTERED 
(
	[IDHocPhi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoKyHoc]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoKyHoc](
	[IDInfoKyHoc] [int] IDENTITY(1,1) NOT NULL,
	[IDNamHoc] [int] NULL,
	[IDKyHoc] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[PhiTC] [int] NULL,
 CONSTRAINT [PK_InfoKyHoc] PRIMARY KEY CLUSTERED 
(
	[IDInfoKyHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoiHoc]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoiHoc](
	[IDKhoiHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenKhoiHoc] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhoiHoc] PRIMARY KEY CLUSTERED 
(
	[IDKhoiHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KQHT]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KQHT](
	[IDKQHT] [int] IDENTITY(1,1) NOT NULL,
	[IDSinhVien] [int] NULL,
	[IDLopDT] [int] NULL,
	[DTP] [float] NULL,
	[DT] [float] NULL,
	[DTK] [float] NULL,
	[Pass] [bit] NULL,
 CONSTRAINT [PK_KQHT] PRIMARY KEY CLUSTERED 
(
	[IDKQHT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KyHoc]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyHoc](
	[IDKyHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenHocKy] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_KyHoc] PRIMARY KEY CLUSTERED 
(
	[IDKyHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LopDT]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopDT](
	[IDLopDT] [int] IDENTITY(1,1) NOT NULL,
	[IDInfoKyHoc] [int] NULL,
	[IDCTDT] [int] NULL,
	[IDGiaoVien] [int] NULL,
	[TimeStart] [date] NULL,
	[TimeEnd] [date] NULL,
	[Date] [int] NULL,
	[Tiet] [int] NULL,
	[IDLopHoc] [int] NULL,
	[IDPhongHoc] [int] NULL,
 CONSTRAINT [PK_LopDT] PRIMARY KEY CLUSTERED 
(
	[IDLopDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LopHoc]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHoc](
	[IDLopHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenLopHoc] [nvarchar](50) NULL,
	[SiSo] [int] NULL,
	[Active] [bit] NULL,
	[Code] [nvarchar](50) NULL,
	[IDNganhHoc] [int] NULL,
 CONSTRAINT [PK_LopHoc] PRIMARY KEY CLUSTERED 
(
	[IDLopHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[IDMonHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenMonHoc] [nvarchar](500) NULL,
	[SoTC] [int] NULL,
	[SoTiet] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[IDMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NamHoc]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamHoc](
	[IDNamHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenNamHoc] [nvarchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_NamHoc] PRIMARY KEY CLUSTERED 
(
	[IDNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NganhHoc]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NganhHoc](
	[IDNganhHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenNganh] [nvarchar](50) NULL,
	[IDKhoiHoc] [int] NULL,
	[NamDT] [int] NULL,
	[SoKiHoc] [int] NULL,
	[Code] [nvarchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_NganhHoc] PRIMARY KEY CLUSTERED 
(
	[IDNganhHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhongHoc]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongHoc](
	[IDPhongHoc] [int] IDENTITY(1,1) NOT NULL,
	[MaPhongHoc] [nvarchar](50) NULL,
	[TenPhongHoc] [nvarchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_PhongHoc] PRIMARY KEY CLUSTERED 
(
	[IDPhongHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[IDSinhVien] [int] IDENTITY(1,1) NOT NULL,
	[IDLopHoc] [int] NULL,
	[FullName] [nvarchar](50) NULL,
	[Avatar] [nvarchar](500) NULL,
	[Adress] [nvarchar](50) NULL,
	[CMND] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Male] [bit] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Born] [nvarchar](50) NULL,
	[YearJoin] [int] NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[IDSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 2018-05-13 16:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[IDTinTuc] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[TomTat] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[LinkFile] [nvarchar](max) NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [int] NULL,
	[Active] [bit] NULL,
	[Image] [nvarchar](max) NULL,
	[ThongBao] [bit] NULL,
	[CountView] [int] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[IDTinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CTDT] ON 

INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (23, 10, 147, 1, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (24, 10, 148, 1, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (25, 10, 149, 1, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (26, 10, 150, 1, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (27, 10, 151, 1, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (28, 10, 152, 2, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (29, 10, 153, 2, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (30, 10, 154, 2, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (31, 10, 155, 2, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (32, 10, 156, 3, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (33, 10, 157, 3, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (34, 10, 158, 3, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (35, 10, 159, 3, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (36, 10, 160, 4, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (37, 10, 161, 4, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (38, 10, 162, 4, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (39, 10, 163, 4, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (40, 10, 164, 5, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (41, 10, 165, 5, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (42, 10, 166, 5, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (43, 10, 167, 5, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (44, 11, 147, 1, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (45, 11, 148, 1, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (46, 11, 149, 2, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (47, 11, 150, 2, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (48, 11, 151, 3, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (49, 11, 152, 3, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (50, 11, 153, 3, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (51, 11, 154, 4, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (52, 11, 155, 4, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (53, 11, 156, 5, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (54, 11, 157, 5, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (55, 11, 158, 5, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (56, 11, 159, 6, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (57, 11, 160, 6, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (58, 11, 161, 6, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (59, 11, 162, 7, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (60, 11, 163, 7, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (61, 11, 164, 7, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (62, 11, 165, 8, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (63, 11, 166, 8, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (64, 11, 167, 9, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (65, 12, 147, 1, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (66, 12, 148, 1, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (67, 12, 149, 1, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (68, 12, 150, 2, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (69, 12, 151, 2, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (70, 12, 152, 2, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (71, 12, 153, 3, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (72, 12, 154, 3, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (73, 12, 155, 3, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (74, 12, 156, 4, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (75, 12, 157, 4, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (76, 12, 158, 4, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (77, 12, 159, 5, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (78, 12, 160, 5, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (79, 12, 161, 5, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (80, 12, 162, 6, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (81, 12, 163, 6, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (82, 12, 164, 7, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (83, 12, 165, 7, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (84, 12, 166, 8, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (85, 12, 167, 8, 1)
INSERT [dbo].[CTDT] ([IDCTDT], [IDNganhHoc], [IDMonHoc], [KyHoc], [Active]) VALUES (86, 13, 167, 1, 1)
SET IDENTITY_INSERT [dbo].[CTDT] OFF
SET IDENTITY_INSERT [dbo].[GiaoVien] ON 

INSERT [dbo].[GiaoVien] ([IDGiaoVien], [Username], [Password], [FullName], [Avatar], [Adress], [CMND], [Birthday], [Male], [Phone], [Email], [Active], [Position]) VALUES (4, N'admin', N'admin', N'admin', N'/Content/Upload/img/03243913052018_chia-se-stock-bo-anh-chan-dung-binh-di-cua-nhiep-anh-gia-quang-tu-2.jpg', N'Lào', N'0987654321', CAST(N'1989-01-01' AS Date), 1, N'0987654321', N'admin@gmail.com', 1, N'ADMIN')
INSERT [dbo].[GiaoVien] ([IDGiaoVien], [Username], [Password], [FullName], [Avatar], [Adress], [CMND], [Birthday], [Male], [Phone], [Email], [Active], [Position]) VALUES (5, N'nva', N'admin', N'Nguyễn Văn A', N'/Content/Upload/img/03244513052018_cach-tao-dang-dep-khi-chup-anh-chan-dung-thoi-trang-phu-nu5.jpg', N'Lào', N'0123456789', CAST(N'1989-01-01' AS Date), 1, N'0987654321', N'nva@gmail.com', NULL, N'GIAOVIEN')
INSERT [dbo].[GiaoVien] ([IDGiaoVien], [Username], [Password], [FullName], [Avatar], [Adress], [CMND], [Birthday], [Male], [Phone], [Email], [Active], [Position]) VALUES (6, N'nvb', N'admin', N'Nguyễn Văn B', N'/Content/Upload/img/03245013052018_images.jpg', N'HN', N'0123456789', CAST(N'2018-04-19' AS Date), 1, N'0987654321', N'abc@gmail.com', NULL, N'GIAOVIEN')
SET IDENTITY_INSERT [dbo].[GiaoVien] OFF
SET IDENTITY_INSERT [dbo].[HocPhi] ON 

INSERT [dbo].[HocPhi] ([IDHocPhi], [IDInfoKyHoc], [IDSinhVien], [Total], [Paid], [Status]) VALUES (3, 8, 3, 12400000, 0, N'0')
SET IDENTITY_INSERT [dbo].[HocPhi] OFF
SET IDENTITY_INSERT [dbo].[InfoKyHoc] ON 

INSERT [dbo].[InfoKyHoc] ([IDInfoKyHoc], [IDNamHoc], [IDKyHoc], [Status], [PhiTC]) VALUES (3, 1007, 1004, N'CLOSED', 270000)
INSERT [dbo].[InfoKyHoc] ([IDInfoKyHoc], [IDNamHoc], [IDKyHoc], [Status], [PhiTC]) VALUES (4, 1007, 1005, N'CLOSED', 270000)
INSERT [dbo].[InfoKyHoc] ([IDInfoKyHoc], [IDNamHoc], [IDKyHoc], [Status], [PhiTC]) VALUES (5, 1008, 1004, N'CLOSED', 270000)
INSERT [dbo].[InfoKyHoc] ([IDInfoKyHoc], [IDNamHoc], [IDKyHoc], [Status], [PhiTC]) VALUES (6, 1008, 1005, N'CLOSED', 270000)
INSERT [dbo].[InfoKyHoc] ([IDInfoKyHoc], [IDNamHoc], [IDKyHoc], [Status], [PhiTC]) VALUES (7, 1009, 1004, N'CLOSED', 300000)
INSERT [dbo].[InfoKyHoc] ([IDInfoKyHoc], [IDNamHoc], [IDKyHoc], [Status], [PhiTC]) VALUES (8, 1009, 1005, N'RUNNING', 300000)
SET IDENTITY_INSERT [dbo].[InfoKyHoc] OFF
SET IDENTITY_INSERT [dbo].[KhoiHoc] ON 

INSERT [dbo].[KhoiHoc] ([IDKhoiHoc], [TenKhoiHoc], [Active], [Code]) VALUES (14, N'khoa học kỹ thuật', 1, N'KHKT')
INSERT [dbo].[KhoiHoc] ([IDKhoiHoc], [TenKhoiHoc], [Active], [Code]) VALUES (15, N'công nghệ thông tin', 1, N'CNTT')
INSERT [dbo].[KhoiHoc] ([IDKhoiHoc], [TenKhoiHoc], [Active], [Code]) VALUES (16, N'điện tử viễn thông ', 1, N'DTVT')
INSERT [dbo].[KhoiHoc] ([IDKhoiHoc], [TenKhoiHoc], [Active], [Code]) VALUES (17, N'Kinh tế', 1, N'KT')
INSERT [dbo].[KhoiHoc] ([IDKhoiHoc], [TenKhoiHoc], [Active], [Code]) VALUES (18, N'Quản lý', 1, N'QL')
SET IDENTITY_INSERT [dbo].[KhoiHoc] OFF
SET IDENTITY_INSERT [dbo].[KQHT] ON 

INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (8, 3, 30, 8, 8, 8, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (9, 3, 31, 8, 8, 8, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (10, 3, 32, 8, 6, 6.6, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (11, 3, 33, 8, 7, 7.3, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (12, 3, 34, 8, 9, 8.7, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (13, 3, 35, 8, 5, 5.9, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (14, 3, 36, 8, 7, 7.3, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (15, 3, 37, 8, 6, 6.6, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (16, 3, 38, 8, 8, 8, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (17, 3, 39, 8, 9, 8.7, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (18, 3, 40, 8, 0, 2.4, 0)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (19, 3, 41, 8, 8, 8, 1)
INSERT [dbo].[KQHT] ([IDKQHT], [IDSinhVien], [IDLopDT], [DTP], [DT], [DTK], [Pass]) VALUES (20, 3, 42, 8, 9, 8.7, 1)
SET IDENTITY_INSERT [dbo].[KQHT] OFF
SET IDENTITY_INSERT [dbo].[KyHoc] ON 

INSERT [dbo].[KyHoc] ([IDKyHoc], [TenHocKy], [Active]) VALUES (1004, 1, NULL)
INSERT [dbo].[KyHoc] ([IDKyHoc], [TenHocKy], [Active]) VALUES (1005, 2, NULL)
SET IDENTITY_INSERT [dbo].[KyHoc] OFF
SET IDENTITY_INSERT [dbo].[LopDT] ON 

INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (30, 8, 23, 5, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 2, 1, 4, 3)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (31, 8, 24, 6, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 3, 1, 4, 4)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (32, 8, 25, 6, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 4, 1, 4, 5)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (33, 8, 26, 5, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 5, 1, 4, 6)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (34, 8, 27, 5, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 6, 1, 4, 7)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (35, 8, 32, 6, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 7, 1, 4, 5)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (36, 8, 33, 5, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 2, 1, 4, 4)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (37, 8, 34, 5, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 3, 1, 4, 3)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (38, 8, 35, 6, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 4, 1, 4, 4)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (39, 8, 40, 5, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 5, 1, 4, 5)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (40, 8, 41, 6, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 6, 1, 4, 4)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (41, 8, 42, 5, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 7, 1, 4, 5)
INSERT [dbo].[LopDT] ([IDLopDT], [IDInfoKyHoc], [IDCTDT], [IDGiaoVien], [TimeStart], [TimeEnd], [Date], [Tiet], [IDLopHoc], [IDPhongHoc]) VALUES (42, 8, 43, 5, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-29' AS Date), 2, 1, 4, 6)
SET IDENTITY_INSERT [dbo].[LopDT] OFF
SET IDENTITY_INSERT [dbo].[LopHoc] ON 

INSERT [dbo].[LopHoc] ([IDLopHoc], [TenLopHoc], [SiSo], [Active], [Code], [IDNganhHoc]) VALUES (4, N'D9CNPM', 100, NULL, N'D9CNPM', 10)
INSERT [dbo].[LopHoc] ([IDLopHoc], [TenLopHoc], [SiSo], [Active], [Code], [IDNganhHoc]) VALUES (5, N'D9QTM', 100, NULL, N'D9QTM', 11)
INSERT [dbo].[LopHoc] ([IDLopHoc], [TenLopHoc], [SiSo], [Active], [Code], [IDNganhHoc]) VALUES (6, N'D9TMDT', 50, NULL, N'D9TMDT', 12)
SET IDENTITY_INSERT [dbo].[LopHoc] OFF
SET IDENTITY_INSERT [dbo].[MonHoc] ON 

INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (147, N'Nhập môn tin học', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (148, N'	Toán cao cấp 1', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (149, N'	Những Nguyên lý cơ bản của chủ nghĩa Mác – Lênin 1', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (150, N'	Pháp luật đại cương', 3, 45, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (151, N'	Toán cao cấp 2', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (152, N'Vật lý', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (153, N'Tiếng Anh 1', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (154, N'Giáo dục thể chất 1', 3, 45, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (155, N'	Tiếng Anh 2', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (156, N'	Giáo dục thể chất 2', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (157, N'	Giáo dục quốc phòng 3', 3, 45, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (158, N'	Giáo dục quốc phòng 2', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (159, N'Giáo dục quốc phòng 1', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (160, N'	Toán cao cấp 3', 5, 75, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (161, N'02	Những Nguyên lý cơ bản của chủ nghĩa Mác – Lênin 2', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (162, N'	Ngôn ngữ lập trình C++', 5, 75, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (163, N'Toán rời rạc', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (164, N'	Kỹ thuật điện đại cương', 5, 75, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (165, N'	Cơ sở dữ liệu', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (166, N'	Kiến trúc máy tính', 2, 30, 1)
INSERT [dbo].[MonHoc] ([IDMonHoc], [TenMonHoc], [SoTC], [SoTiet], [Active]) VALUES (167, N'Mạng máy tính', 2, 30, 1)
SET IDENTITY_INSERT [dbo].[MonHoc] OFF
SET IDENTITY_INSERT [dbo].[NamHoc] ON 

INSERT [dbo].[NamHoc] ([IDNamHoc], [TenNamHoc], [Active]) VALUES (1007, N'Năm học 2016 - 2017', NULL)
INSERT [dbo].[NamHoc] ([IDNamHoc], [TenNamHoc], [Active]) VALUES (1008, N'Năm học 2017 - 2018', NULL)
INSERT [dbo].[NamHoc] ([IDNamHoc], [TenNamHoc], [Active]) VALUES (1009, N'Năm học 2018 - 2019', NULL)
SET IDENTITY_INSERT [dbo].[NamHoc] OFF
SET IDENTITY_INSERT [dbo].[NganhHoc] ON 

INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (7, N'Kĩ thuật điện', 14, 5, 10, N'KTD', 1)
INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (8, N'Kĩ thuật Công trình', 14, 5, 10, N'KTCT', 1)
INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (9, N'Khoa học mỏ', 14, 4, 8, N'KHM', 1)
INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (10, N'Công nghệ phần mềm', 15, 5, 9, N'CNPM', 1)
INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (11, N'Quản trị mảng', 15, 4, 8, N'QTM', 1)
INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (12, N'Thương mại diện tử', 15, 4, 8, N'TMDT', 1)
INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (13, N'Điện tử viễn thông A', 16, 4, 8, N'DTVTA', 1)
INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (14, N'Điện tử viễn thông B', 16, 5, 4, N'DTVTB', 1)
INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (15, N'Kinh tế A', 17, 5, 10, N'KTA', 1)
INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (16, N'Kinh tế B', 17, 5, 10, N'KTB', 1)
INSERT [dbo].[NganhHoc] ([IDNganhHoc], [TenNganh], [IDKhoiHoc], [NamDT], [SoKiHoc], [Code], [Active]) VALUES (17, N'Quản lý năng lượng', 18, 5, 10, N'QLNL', 1)
SET IDENTITY_INSERT [dbo].[NganhHoc] OFF
SET IDENTITY_INSERT [dbo].[PhongHoc] ON 

INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (3, N'A101', N'Phòng A101', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (4, N'A102', N'Phòng A102', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (5, N'A103', N'Phòng A103', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (6, N'A104', N'Phòng A104', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (7, N'A105', N'Phòng A105', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (8, N'A106', N'Phòng A106', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (9, N'A107', N'Phòng A102', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (10, N'A108', N'Phòng A102', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (11, N'A109', N'Phòng A102', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (12, N'A110', N'Phòng A102', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (13, N'A111', N'Phòng A102', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (14, N'A112', N'Phòng A102', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (15, N'A113', N'Phòng A102', NULL)
INSERT [dbo].[PhongHoc] ([IDPhongHoc], [MaPhongHoc], [TenPhongHoc], [Active]) VALUES (16, N'A114', N'Phòng A102', NULL)
SET IDENTITY_INSERT [dbo].[PhongHoc] OFF
SET IDENTITY_INSERT [dbo].[SinhVien] ON 

INSERT [dbo].[SinhVien] ([IDSinhVien], [IDLopHoc], [FullName], [Avatar], [Adress], [CMND], [Birthday], [Male], [Phone], [Email], [Active], [Username], [Password], [Born], [YearJoin]) VALUES (3, 4, N'Trần Văn A', NULL, N'HN', N'0123456789', CAST(N'2018-04-05' AS Date), NULL, N'0987654321', N'tva@gmail.com', NULL, N'4D9CNPM0', N'11223311', N'HN', 2018)
SET IDENTITY_INSERT [dbo].[SinhVien] OFF
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (1, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.000' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1001)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (2, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (3, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (4, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (5, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (6, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (7, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (8, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (9, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (10, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (11, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (12, N'Trung tâm Nghiên cứu Công nghệ hàn hàng đầu Đông Nam Á sẽ đặt tại Trường Cao đẳng Khammouane Lào', N'Việt Nam và Nhật Bản chính thức liên kết về đào tạo nhân lực trình độ cao, nghiên cứu và chuyển giao công nghệ (CGCN) trong lĩnh vực công nghệ hàn thông qua Lễ ký kết văn bản hợp tác giữa Viện Cơ khí (Trường ĐHBK Hà Nội), Viện Hàn và Ghép nối (ĐH Osaka) và Công ty khí Việt Nhật (Tập đoàn Taiyo Nippon Sanso) vào ngày 13/04/2018 tại Hà Nội. Đặc biệt, ba bên sẽ xúc tiến kế hoạch xây dựng Trung tâm Nghiên cứu Công nghệ hàn Việt Nam có chất lượng hàng đầu Đông Nam Á tại Trường Cao đẳng Khammouane Lào, hứa hẹn mở ra bước phát triển mới cho ngành công nghiệp Việt Nam.', N'<p style="text-align:justify"><strong>Việt Nam v&agrave; Nhật Bản ch&iacute;nh thức li&ecirc;n kết về đ&agrave;o tạo nh&acirc;n lực tr&igrave;nh độ cao, nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ (CGCN) trong lĩnh vực c&ocirc;ng nghệ h&agrave;n th&ocirc;ng qua Lễ k&yacute; kết văn bản hợp t&aacute;c giữa Viện Cơ kh&iacute; (Trường Cao đẳng Khammouane L&agrave;o), Viện H&agrave;n v&agrave; Gh&eacute;p nối (ĐH Osaka) v&agrave; C&ocirc;ng ty kh&iacute; Việt Nhật (Tập đo&agrave;n Taiyo Nippon Sanso) v&agrave;o ng&agrave;y 13/04/2018 tại H&agrave; Nội. Đặc biệt, ba b&ecirc;n sẽ x&uacute;c tiến kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam c&oacute; chất lượng h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o, hứa hẹn mở ra bước ph&aacute;t triển mới cho ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</strong></p>

<p style="text-align:justify">Bước đầu ti&ecirc;n của thỏa thuận k&yacute; kết giữa ba b&ecirc;n n&ecirc;u r&otilde; c&aacute;c nội dung hợp t&aacute;c trong thực hiện c&aacute;c hoạt động nghi&ecirc;n cứu chung, trao đổi sinh vi&ecirc;n, giảng vi&ecirc;n cũng như c&aacute;c t&agrave;i liệu nghi&ecirc;n cứu, thiết bị; tổ chức c&aacute;c hội thảo, hội nghị quốc tế. Đặc biệt, th&ocirc;ng qua hợp t&aacute;c, Việt Nam v&agrave; Nhật Bản sẽ x&uacute;c tiến x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute; tại Trường Cao đẳng Khammouane L&agrave;o. Đ&acirc;y l&agrave; nội dung quan trọng trong &ldquo;Dự &aacute;n nghi&ecirc;n cứu chung quốc tế gắn đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu với ng&agrave;nh c&ocirc;ng nghiệp&rdquo; giữa Trường Cao đẳng Khammouane L&agrave;o v&agrave; c&aacute;c đối t&aacute;c của Nhật Bản. Trong đ&oacute;, GS Tanaka từ ĐH Osaka ch&iacute;nh l&agrave; người dồn t&acirc;m huyết cho dự &aacute;n n&agrave;y với mong muốn &ldquo;đ&agrave;o tạo kỹ sư h&agrave;n c&oacute; năng lực nghi&ecirc;n cứu cống hiến cho sự ph&aacute;t triển của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam&rdquo; v&agrave; nhận được sự ủng hộ của Tập đo&agrave;n Taiyo Nippon Sanso (dẫn đầu Nhật Bản v&agrave; đứng thứ 5 thế giới trong lĩnh vực c&ocirc;ng nghiệp kh&iacute; gas).</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412_Ky+ket+Osaka_1.jpg/1ccbd690-75b6-4bf7-a095-0de97a8ff83f?t=1524013927340" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify">Tại Lễ k&yacute; kết, Ng&agrave;i Kunio Umeda - Đại sứ đặc mệnh to&agrave;n quyền Nhật Bản tại Việt Nam, GS Manabu Tanaka - Ph&oacute; Gi&aacute;m đốc Viện H&agrave;n v&agrave; Gh&eacute;p nối v&agrave; &ocirc;ng Haruhiko Yasuga - Tổng Gi&aacute;m đốc C&ocirc;ng ty kh&iacute; Việt Nhật đ&atilde; c&oacute; cuộc trao đổi nhanh với ph&oacute;ng vi&ecirc;n ĐHBK H&agrave; Nội.</p>

<p style="text-align:justify"><em>PV: Ng&agrave;i Kunio Umeda c&oacute; thể cho biết về triển vọng của hợp t&aacute;c k&yacute; kết h&ocirc;m nay?</em></p>

<p style="text-align:justify"><em><strong>Ng&agrave;i Kunio Umeda:</strong>&nbsp;</em>T&ocirc;i được biết đầu tư trực tiếp của c&aacute;c doanh nghiệp Nhật Bản v&agrave;o Việt Nam năm 2017 tăng gấp 2 lần so với năm 2015, đạt kỷ lục 9,1 tỷ USD. Th&aacute;ng 2/2018, số lượng doanh nghiệp gia nhập Hiệp hội DN Việt Nam &ndash; Nhật Bản đứng số 1 Đ&ocirc;ng Nam &Aacute;. Để đ&aacute;p ứng m&ocirc; h&igrave;nh tăng trưởng mới trong bối cảnh to&agrave;n cầu h&oacute;a, Việt Nam cần nu&ocirc;i dưỡng nền c&ocirc;ng nghiệp nước c&oacute; sức cạnh tranh, tư nh&acirc;n h&oacute;a doanh nghiệp, n&acirc;ng cao năng suất lao động v&agrave; nguồn nh&acirc;n lực. T&ocirc;i hi vọng với thỏa thuận k&yacute; kết lần n&agrave;y, Trường Cao đẳng Khammouane L&agrave;o sẽ c&oacute; thể tiếp nối kỹ thuật chuyển giao ti&ecirc;n tiến h&agrave;ng đầu thế giới của c&aacute;c trường ĐH v&agrave; doanh nghiệp Nhật Bản để đ&agrave;o tạo nguồn nh&acirc;n lực tr&igrave;nh độ cao cho c&ocirc;ng nghiệp. Đặc biệt, nếu kế hoạch x&acirc;y dựng Trung t&acirc;m Nghi&ecirc;n cứu C&ocirc;ng nghệ h&agrave;n Việt Nam th&agrave;nh c&ocirc;ng sẽ g&oacute;p phần cho sự ph&aacute;t triển bền vững của đất nước c&aacute;c bạn.</p>

<p style="text-align:justify"><em>PV: Tại sao ĐH Osaka quyết định li&ecirc;n kết với Trường Cao đẳng Khammouane L&agrave;o để x&acirc;y dựng Trung t&acirc;m n&agrave;y, thưa GS Tanaka?</em></p>

<p style="text-align:justify"><em><strong>GS Tanaka:</strong>&nbsp;</em>ĐHBK H&agrave; Nội l&agrave; một trong những trường ĐH đ&agrave;o tạo c&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute;, đặc biệt c&oacute; những thế mạnh trong đ&agrave;o tạo nguồn nh&acirc;n lực chất lượng cao trong lĩnh vực n&agrave;y. Sự kết hợp giữa Trường với ĐH Osaka v&agrave; Tập đo&agrave;n Taiyo Nippon Sanso trong việc th&agrave;nh lập một trung t&acirc;m nghi&ecirc;n cứu sẽ trở th&agrave;nh m&ocirc; h&igrave;nh ti&ecirc;n phong giữa những viện nghi&ecirc;n cứu về c&aacute;c ng&agrave;nh nghề tr&ecirc;n to&agrave;n quốc.</p>

<p style="text-align:center"><img alt="" src="https://www.hust.edu.vn/documents/52727/320326/20180412-DSC_9533.JPG/2ed586de-51e6-4a1b-90c1-60548e277eb2?t=1524013991617" style="border:0px; height:auto !important; max-width:100%; vertical-align:middle" /></p>

<p style="text-align:justify"><em>PV: Đ&acirc;u l&agrave; cơ hội cho sự ph&aacute;t triển lĩnh vực C&ocirc;ng nghệ h&agrave;n tại Việt Nam, thưa &ocirc;ng Haruhiko Yasuga?</em></p>

<p style="text-align:justify"><em><strong>&Ocirc;ng Haruhiko Yasuga:</strong>&nbsp;</em>Đ&acirc;y l&agrave; trung t&acirc;m nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n h&agrave;ng đầu Đ&ocirc;ng Nam &Aacute;, đồng thời x&acirc;y dựng năng lực ph&aacute;t triển dựa tr&ecirc;n cơ sở nghi&ecirc;n cứu, n&acirc;ng cao kiến thức cho nh&acirc;n sự doanh nghiệp dựa v&agrave;o việc tham gia s&aacute;t hạch chứng chỉ kỹ sư h&agrave;n quốc tế (Kh&oacute;a học IWE) v&agrave; chứng chỉ kỹ sư quản l&yacute; ng&agrave;nh h&agrave;n (Kh&oacute;a học JIS). Trong đ&oacute;, Trường Cao đẳng Khammouane L&agrave;o sẽ thực hiện c&aacute;c nghi&ecirc;n cứu về C&ocirc;ng nghệ h&agrave;n tại Việt Nam v&agrave; đ&agrave;o tạo kỹ sư h&agrave;n. Dựa v&agrave;o việc cung cấp dịch vụ đ&agrave;o tạo v&agrave; nghi&ecirc;n cứu, Trung t&acirc;m sẽ g&oacute;p phần n&acirc;ng cao chất lượng v&agrave; hiệu suất chất lượng h&agrave;n của ng&agrave;nh sản xuất chế tạo Việt Nam với những sản phẩm chất lượng cao đẩy mạnh xuất khẩu ra thế giới, l&agrave; nền tảng cơ bản tạo sự kh&aacute;c biệt so với c&aacute;c nước l&acirc;n cận.</p>
', NULL, CAST(N'2018-04-19 11:13:48.580' AS DateTime), 4, 1, N'/Content/Upload/img/11153819042018_20180412_Ky ket Osaka_1.jpg', NULL, 1000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (13, N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<h3>Th&ocirc;ng b&aacute;o tuyển sinh kh&oacute;a 3 chương tr&igrave;nh MBA hợp t&aacute;c với ĐH Northampton, Vương quốc Anh</h3>
</div>

<div class="asset-full-content show-asset-title" style="font-family: Calibri; font-size: 15px;">
<div class="asset-content" id="_101_INSTANCE_AKFI5qRls1e8_323031" style="clear: right; margin-bottom: 10px; margin-left: 0px !important; margin-right: 10px;">
<div class="journal-content-article" style="font-size: 16px !important;">
<p style="text-align:justify">Trong khu&ocirc;n khổ chương tr&igrave;nh hợp t&aacute;c đ&agrave;o tạo giữa&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o </span>v&agrave; Đại học Northampton, Trường ĐHBK H&agrave; Nội&nbsp;tr&acirc;n trọng th&ocirc;ng b&aacute;o tuyển sinh năm 2018 chương tr&igrave;nh đ&agrave;o tạo Thạc sĩ Quản trị Kinh doanh (MBA) do Đại học Northampton, Vương qu&ocirc;́c Anh cấp bằng.</p>

<p style="text-align:justify"><strong>1. Đối tượng tuyển sinh:</strong></p>

<ul>
	<li style="text-align:justify">L&agrave; c&ocirc;ng d&acirc;n Việt Nam hoặc người nước ngo&agrave;i đang sinh sống tại Việt Nam, tốt nghiệp đại học tại Việt Nam hoặc nước ngo&agrave;i được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo c&ocirc;ng nhận.</li>
	<li style="text-align:justify">C&oacute; tr&igrave;nh độ tiếng Anh tương đương chuẩn B2 của ch&acirc;u &Acirc;u như IELTS 5.5 hoặc iBT TOEFL 61/PBT, TOEFL 500.</li>
</ul>

<p style="text-align:justify"><strong>2. Phương thức tuyển sinh:</strong>&nbsp;Trường Đại học Northampton x&eacute;t hồ sơ v&agrave; trực tiếp phỏng vấn. Đối với th&iacute; sinh chưa c&oacute; chứng chỉ tiếng Anh đạt chu&acirc;̉n sẽ phải tham gia kh&oacute;a dự bị Pre-MBA v&agrave; l&agrave;m b&agrave;i kiểm tra tiếng Anh đầu v&agrave;o.</p>

<p style="text-align:justify"><strong>3. Chương tr&igrave;nh đ&agrave;o tạo v&agrave; bằng cấp:</strong></p>

<ul>
	<li style="text-align:justify">Đ&agrave;o tạo trong 18 th&aacute;ng tại trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>&nbsp;theo chương tr&igrave;nh thống nhất giữa trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>. Chương tr&igrave;nh được giảng dạy bằng tiếng Anh bởi giảng vi&ecirc;n của trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>.</li>
	<li style="text-align:justify">Học vi&ecirc;n phải đạt tr&igrave;nh độ tiếng Anh tương đương IELTS 6.5 để được tiếp tục học kỳ II.</li>
	<li style="text-align:justify">Bằng cấp: Thạc sỹ của Đại học Northampton sau khi tốt nghiệp.</li>
</ul>

<p style="text-align:justify"><strong>4. Kinh ph&iacute; đ&agrave;o tạo:</strong>&nbsp;Học ph&iacute; cho to&agrave;n bộ kh&oacute;a học khoảng 205.000.000 VNĐ/học vi&ecirc;n/kh&oacute;a (Hai trăm linh năm triệu đồng chẵn). Học ph&iacute; được thu l&agrave;m 3 kỳ. Học ph&iacute; c&oacute; thể điều chỉnh nhưng kh&ocirc;ng vượt qu&aacute; mức thay đổi tỷ gi&aacute; hối đo&aacute;i của Ng&acirc;n h&agrave;ng Ngoại thương Việt Nam (Vietcombank).</p>

<p style="text-align:justify"><strong>5. Hồ sơ tuyển sinh:</strong>&nbsp;Nhận hồ sơ đăng k&yacute; dự tuyển tại Văn ph&ograve;ng Viện Đ&agrave;o tạo Quốc tế từ th&aacute;ng 01/3/2018 đến hết ng&agrave;y 30/6/2018.</p>

<p style="text-align:justify"><strong>6. Khai giảng:</strong>&nbsp;Kh&oacute;a học dự kiến khai giảng v&agrave;o th&aacute;ng 8/2018.</p>

<p style="text-align:justify">Th&ocirc;ng tin chi tiết xem tại&nbsp;<a href="http://sie.hust.edu.vn/" style="color: rgb(51, 51, 51); text-decoration-line: none;">http://sie.edu.vn/</a></p>
</div>
</div>
</div>
</div>
', NULL, CAST(N'2018-04-19 11:26:12.283' AS DateTime), 4, 1, N'/Content/Upload/img/11261219042018_article.jpg', 1, 3000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (14, N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<h3>Th&ocirc;ng b&aacute;o tuyển sinh kh&oacute;a 3 chương tr&igrave;nh MBA hợp t&aacute;c với ĐH Northampton, Vương quốc Anh</h3>
</div>

<div class="asset-full-content show-asset-title" style="font-family: Calibri; font-size: 15px;">
<div class="asset-content" id="_101_INSTANCE_AKFI5qRls1e8_323031" style="clear: right; margin-bottom: 10px; margin-left: 0px !important; margin-right: 10px;">
<div class="journal-content-article" style="font-size: 16px !important;">
<p style="text-align:justify">Trong khu&ocirc;n khổ chương tr&igrave;nh hợp t&aacute;c đ&agrave;o tạo giữa&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o </span>v&agrave; Đại học Northampton, Trường ĐHBK H&agrave; Nội&nbsp;tr&acirc;n trọng th&ocirc;ng b&aacute;o tuyển sinh năm 2018 chương tr&igrave;nh đ&agrave;o tạo Thạc sĩ Quản trị Kinh doanh (MBA) do Đại học Northampton, Vương qu&ocirc;́c Anh cấp bằng.</p>

<p style="text-align:justify"><strong>1. Đối tượng tuyển sinh:</strong></p>

<ul>
	<li style="text-align:justify">L&agrave; c&ocirc;ng d&acirc;n Việt Nam hoặc người nước ngo&agrave;i đang sinh sống tại Việt Nam, tốt nghiệp đại học tại Việt Nam hoặc nước ngo&agrave;i được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo c&ocirc;ng nhận.</li>
	<li style="text-align:justify">C&oacute; tr&igrave;nh độ tiếng Anh tương đương chuẩn B2 của ch&acirc;u &Acirc;u như IELTS 5.5 hoặc iBT TOEFL 61/PBT, TOEFL 500.</li>
</ul>

<p style="text-align:justify"><strong>2. Phương thức tuyển sinh:</strong>&nbsp;Trường Đại học Northampton x&eacute;t hồ sơ v&agrave; trực tiếp phỏng vấn. Đối với th&iacute; sinh chưa c&oacute; chứng chỉ tiếng Anh đạt chu&acirc;̉n sẽ phải tham gia kh&oacute;a dự bị Pre-MBA v&agrave; l&agrave;m b&agrave;i kiểm tra tiếng Anh đầu v&agrave;o.</p>

<p style="text-align:justify"><strong>3. Chương tr&igrave;nh đ&agrave;o tạo v&agrave; bằng cấp:</strong></p>

<ul>
	<li style="text-align:justify">Đ&agrave;o tạo trong 18 th&aacute;ng tại trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>&nbsp;theo chương tr&igrave;nh thống nhất giữa trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>. Chương tr&igrave;nh được giảng dạy bằng tiếng Anh bởi giảng vi&ecirc;n của trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>.</li>
	<li style="text-align:justify">Học vi&ecirc;n phải đạt tr&igrave;nh độ tiếng Anh tương đương IELTS 6.5 để được tiếp tục học kỳ II.</li>
	<li style="text-align:justify">Bằng cấp: Thạc sỹ của Đại học Northampton sau khi tốt nghiệp.</li>
</ul>

<p style="text-align:justify"><strong>4. Kinh ph&iacute; đ&agrave;o tạo:</strong>&nbsp;Học ph&iacute; cho to&agrave;n bộ kh&oacute;a học khoảng 205.000.000 VNĐ/học vi&ecirc;n/kh&oacute;a (Hai trăm linh năm triệu đồng chẵn). Học ph&iacute; được thu l&agrave;m 3 kỳ. Học ph&iacute; c&oacute; thể điều chỉnh nhưng kh&ocirc;ng vượt qu&aacute; mức thay đổi tỷ gi&aacute; hối đo&aacute;i của Ng&acirc;n h&agrave;ng Ngoại thương Việt Nam (Vietcombank).</p>

<p style="text-align:justify"><strong>5. Hồ sơ tuyển sinh:</strong>&nbsp;Nhận hồ sơ đăng k&yacute; dự tuyển tại Văn ph&ograve;ng Viện Đ&agrave;o tạo Quốc tế từ th&aacute;ng 01/3/2018 đến hết ng&agrave;y 30/6/2018.</p>

<p style="text-align:justify"><strong>6. Khai giảng:</strong>&nbsp;Kh&oacute;a học dự kiến khai giảng v&agrave;o th&aacute;ng 8/2018.</p>

<p style="text-align:justify">Th&ocirc;ng tin chi tiết xem tại&nbsp;<a href="http://sie.hust.edu.vn/" style="color: rgb(51, 51, 51); text-decoration-line: none;">http://sie.edu.vn/</a></p>
</div>
</div>
</div>
</div>
', NULL, CAST(N'2018-04-19 11:26:12.283' AS DateTime), 4, 1, N'/Content/Upload/img/11261219042018_article.jpg', 1, 3000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (15, N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<h3>Th&ocirc;ng b&aacute;o tuyển sinh kh&oacute;a 3 chương tr&igrave;nh MBA hợp t&aacute;c với ĐH Northampton, Vương quốc Anh</h3>
</div>

<div class="asset-full-content show-asset-title" style="font-family: Calibri; font-size: 15px;">
<div class="asset-content" id="_101_INSTANCE_AKFI5qRls1e8_323031" style="clear: right; margin-bottom: 10px; margin-left: 0px !important; margin-right: 10px;">
<div class="journal-content-article" style="font-size: 16px !important;">
<p style="text-align:justify">Trong khu&ocirc;n khổ chương tr&igrave;nh hợp t&aacute;c đ&agrave;o tạo giữa&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o </span>v&agrave; Đại học Northampton, Trường ĐHBK H&agrave; Nội&nbsp;tr&acirc;n trọng th&ocirc;ng b&aacute;o tuyển sinh năm 2018 chương tr&igrave;nh đ&agrave;o tạo Thạc sĩ Quản trị Kinh doanh (MBA) do Đại học Northampton, Vương qu&ocirc;́c Anh cấp bằng.</p>

<p style="text-align:justify"><strong>1. Đối tượng tuyển sinh:</strong></p>

<ul>
	<li style="text-align:justify">L&agrave; c&ocirc;ng d&acirc;n Việt Nam hoặc người nước ngo&agrave;i đang sinh sống tại Việt Nam, tốt nghiệp đại học tại Việt Nam hoặc nước ngo&agrave;i được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo c&ocirc;ng nhận.</li>
	<li style="text-align:justify">C&oacute; tr&igrave;nh độ tiếng Anh tương đương chuẩn B2 của ch&acirc;u &Acirc;u như IELTS 5.5 hoặc iBT TOEFL 61/PBT, TOEFL 500.</li>
</ul>

<p style="text-align:justify"><strong>2. Phương thức tuyển sinh:</strong>&nbsp;Trường Đại học Northampton x&eacute;t hồ sơ v&agrave; trực tiếp phỏng vấn. Đối với th&iacute; sinh chưa c&oacute; chứng chỉ tiếng Anh đạt chu&acirc;̉n sẽ phải tham gia kh&oacute;a dự bị Pre-MBA v&agrave; l&agrave;m b&agrave;i kiểm tra tiếng Anh đầu v&agrave;o.</p>

<p style="text-align:justify"><strong>3. Chương tr&igrave;nh đ&agrave;o tạo v&agrave; bằng cấp:</strong></p>

<ul>
	<li style="text-align:justify">Đ&agrave;o tạo trong 18 th&aacute;ng tại trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>&nbsp;theo chương tr&igrave;nh thống nhất giữa trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>. Chương tr&igrave;nh được giảng dạy bằng tiếng Anh bởi giảng vi&ecirc;n của trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>.</li>
	<li style="text-align:justify">Học vi&ecirc;n phải đạt tr&igrave;nh độ tiếng Anh tương đương IELTS 6.5 để được tiếp tục học kỳ II.</li>
	<li style="text-align:justify">Bằng cấp: Thạc sỹ của Đại học Northampton sau khi tốt nghiệp.</li>
</ul>

<p style="text-align:justify"><strong>4. Kinh ph&iacute; đ&agrave;o tạo:</strong>&nbsp;Học ph&iacute; cho to&agrave;n bộ kh&oacute;a học khoảng 205.000.000 VNĐ/học vi&ecirc;n/kh&oacute;a (Hai trăm linh năm triệu đồng chẵn). Học ph&iacute; được thu l&agrave;m 3 kỳ. Học ph&iacute; c&oacute; thể điều chỉnh nhưng kh&ocirc;ng vượt qu&aacute; mức thay đổi tỷ gi&aacute; hối đo&aacute;i của Ng&acirc;n h&agrave;ng Ngoại thương Việt Nam (Vietcombank).</p>

<p style="text-align:justify"><strong>5. Hồ sơ tuyển sinh:</strong>&nbsp;Nhận hồ sơ đăng k&yacute; dự tuyển tại Văn ph&ograve;ng Viện Đ&agrave;o tạo Quốc tế từ th&aacute;ng 01/3/2018 đến hết ng&agrave;y 30/6/2018.</p>

<p style="text-align:justify"><strong>6. Khai giảng:</strong>&nbsp;Kh&oacute;a học dự kiến khai giảng v&agrave;o th&aacute;ng 8/2018.</p>

<p style="text-align:justify">Th&ocirc;ng tin chi tiết xem tại&nbsp;<a href="http://sie.hust.edu.vn/" style="color: rgb(51, 51, 51); text-decoration-line: none;">http://sie.edu.vn/</a></p>
</div>
</div>
</div>
</div>
', NULL, CAST(N'2018-04-19 11:26:12.283' AS DateTime), 4, 1, N'/Content/Upload/img/11261219042018_article.jpg', 1, 3000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (16, N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<h3>Th&ocirc;ng b&aacute;o tuyển sinh kh&oacute;a 3 chương tr&igrave;nh MBA hợp t&aacute;c với ĐH Northampton, Vương quốc Anh</h3>
</div>

<div class="asset-full-content show-asset-title" style="font-family: Calibri; font-size: 15px;">
<div class="asset-content" id="_101_INSTANCE_AKFI5qRls1e8_323031" style="clear: right; margin-bottom: 10px; margin-left: 0px !important; margin-right: 10px;">
<div class="journal-content-article" style="font-size: 16px !important;">
<p style="text-align:justify">Trong khu&ocirc;n khổ chương tr&igrave;nh hợp t&aacute;c đ&agrave;o tạo giữa&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o </span>v&agrave; Đại học Northampton, Trường ĐHBK H&agrave; Nội&nbsp;tr&acirc;n trọng th&ocirc;ng b&aacute;o tuyển sinh năm 2018 chương tr&igrave;nh đ&agrave;o tạo Thạc sĩ Quản trị Kinh doanh (MBA) do Đại học Northampton, Vương qu&ocirc;́c Anh cấp bằng.</p>

<p style="text-align:justify"><strong>1. Đối tượng tuyển sinh:</strong></p>

<ul>
	<li style="text-align:justify">L&agrave; c&ocirc;ng d&acirc;n Việt Nam hoặc người nước ngo&agrave;i đang sinh sống tại Việt Nam, tốt nghiệp đại học tại Việt Nam hoặc nước ngo&agrave;i được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo c&ocirc;ng nhận.</li>
	<li style="text-align:justify">C&oacute; tr&igrave;nh độ tiếng Anh tương đương chuẩn B2 của ch&acirc;u &Acirc;u như IELTS 5.5 hoặc iBT TOEFL 61/PBT, TOEFL 500.</li>
</ul>

<p style="text-align:justify"><strong>2. Phương thức tuyển sinh:</strong>&nbsp;Trường Đại học Northampton x&eacute;t hồ sơ v&agrave; trực tiếp phỏng vấn. Đối với th&iacute; sinh chưa c&oacute; chứng chỉ tiếng Anh đạt chu&acirc;̉n sẽ phải tham gia kh&oacute;a dự bị Pre-MBA v&agrave; l&agrave;m b&agrave;i kiểm tra tiếng Anh đầu v&agrave;o.</p>

<p style="text-align:justify"><strong>3. Chương tr&igrave;nh đ&agrave;o tạo v&agrave; bằng cấp:</strong></p>

<ul>
	<li style="text-align:justify">Đ&agrave;o tạo trong 18 th&aacute;ng tại trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>&nbsp;theo chương tr&igrave;nh thống nhất giữa trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>. Chương tr&igrave;nh được giảng dạy bằng tiếng Anh bởi giảng vi&ecirc;n của trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>.</li>
	<li style="text-align:justify">Học vi&ecirc;n phải đạt tr&igrave;nh độ tiếng Anh tương đương IELTS 6.5 để được tiếp tục học kỳ II.</li>
	<li style="text-align:justify">Bằng cấp: Thạc sỹ của Đại học Northampton sau khi tốt nghiệp.</li>
</ul>

<p style="text-align:justify"><strong>4. Kinh ph&iacute; đ&agrave;o tạo:</strong>&nbsp;Học ph&iacute; cho to&agrave;n bộ kh&oacute;a học khoảng 205.000.000 VNĐ/học vi&ecirc;n/kh&oacute;a (Hai trăm linh năm triệu đồng chẵn). Học ph&iacute; được thu l&agrave;m 3 kỳ. Học ph&iacute; c&oacute; thể điều chỉnh nhưng kh&ocirc;ng vượt qu&aacute; mức thay đổi tỷ gi&aacute; hối đo&aacute;i của Ng&acirc;n h&agrave;ng Ngoại thương Việt Nam (Vietcombank).</p>

<p style="text-align:justify"><strong>5. Hồ sơ tuyển sinh:</strong>&nbsp;Nhận hồ sơ đăng k&yacute; dự tuyển tại Văn ph&ograve;ng Viện Đ&agrave;o tạo Quốc tế từ th&aacute;ng 01/3/2018 đến hết ng&agrave;y 30/6/2018.</p>

<p style="text-align:justify"><strong>6. Khai giảng:</strong>&nbsp;Kh&oacute;a học dự kiến khai giảng v&agrave;o th&aacute;ng 8/2018.</p>

<p style="text-align:justify">Th&ocirc;ng tin chi tiết xem tại&nbsp;<a href="http://sie.hust.edu.vn/" style="color: rgb(51, 51, 51); text-decoration-line: none;">http://sie.edu.vn/</a></p>
</div>
</div>
</div>
</div>
', NULL, CAST(N'2018-04-19 11:26:12.283' AS DateTime), 4, 1, N'/Content/Upload/img/11261219042018_article.jpg', 1, 3000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (17, N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<h3>Th&ocirc;ng b&aacute;o tuyển sinh kh&oacute;a 3 chương tr&igrave;nh MBA hợp t&aacute;c với ĐH Northampton, Vương quốc Anh</h3>
</div>

<div class="asset-full-content show-asset-title" style="font-family: Calibri; font-size: 15px;">
<div class="asset-content" id="_101_INSTANCE_AKFI5qRls1e8_323031" style="clear: right; margin-bottom: 10px; margin-left: 0px !important; margin-right: 10px;">
<div class="journal-content-article" style="font-size: 16px !important;">
<p style="text-align:justify">Trong khu&ocirc;n khổ chương tr&igrave;nh hợp t&aacute;c đ&agrave;o tạo giữa&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o </span>v&agrave; Đại học Northampton, Trường ĐHBK H&agrave; Nội&nbsp;tr&acirc;n trọng th&ocirc;ng b&aacute;o tuyển sinh năm 2018 chương tr&igrave;nh đ&agrave;o tạo Thạc sĩ Quản trị Kinh doanh (MBA) do Đại học Northampton, Vương qu&ocirc;́c Anh cấp bằng.</p>

<p style="text-align:justify"><strong>1. Đối tượng tuyển sinh:</strong></p>

<ul>
	<li style="text-align:justify">L&agrave; c&ocirc;ng d&acirc;n Việt Nam hoặc người nước ngo&agrave;i đang sinh sống tại Việt Nam, tốt nghiệp đại học tại Việt Nam hoặc nước ngo&agrave;i được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo c&ocirc;ng nhận.</li>
	<li style="text-align:justify">C&oacute; tr&igrave;nh độ tiếng Anh tương đương chuẩn B2 của ch&acirc;u &Acirc;u như IELTS 5.5 hoặc iBT TOEFL 61/PBT, TOEFL 500.</li>
</ul>

<p style="text-align:justify"><strong>2. Phương thức tuyển sinh:</strong>&nbsp;Trường Đại học Northampton x&eacute;t hồ sơ v&agrave; trực tiếp phỏng vấn. Đối với th&iacute; sinh chưa c&oacute; chứng chỉ tiếng Anh đạt chu&acirc;̉n sẽ phải tham gia kh&oacute;a dự bị Pre-MBA v&agrave; l&agrave;m b&agrave;i kiểm tra tiếng Anh đầu v&agrave;o.</p>

<p style="text-align:justify"><strong>3. Chương tr&igrave;nh đ&agrave;o tạo v&agrave; bằng cấp:</strong></p>

<ul>
	<li style="text-align:justify">Đ&agrave;o tạo trong 18 th&aacute;ng tại trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>&nbsp;theo chương tr&igrave;nh thống nhất giữa trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>. Chương tr&igrave;nh được giảng dạy bằng tiếng Anh bởi giảng vi&ecirc;n của trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>.</li>
	<li style="text-align:justify">Học vi&ecirc;n phải đạt tr&igrave;nh độ tiếng Anh tương đương IELTS 6.5 để được tiếp tục học kỳ II.</li>
	<li style="text-align:justify">Bằng cấp: Thạc sỹ của Đại học Northampton sau khi tốt nghiệp.</li>
</ul>

<p style="text-align:justify"><strong>4. Kinh ph&iacute; đ&agrave;o tạo:</strong>&nbsp;Học ph&iacute; cho to&agrave;n bộ kh&oacute;a học khoảng 205.000.000 VNĐ/học vi&ecirc;n/kh&oacute;a (Hai trăm linh năm triệu đồng chẵn). Học ph&iacute; được thu l&agrave;m 3 kỳ. Học ph&iacute; c&oacute; thể điều chỉnh nhưng kh&ocirc;ng vượt qu&aacute; mức thay đổi tỷ gi&aacute; hối đo&aacute;i của Ng&acirc;n h&agrave;ng Ngoại thương Việt Nam (Vietcombank).</p>

<p style="text-align:justify"><strong>5. Hồ sơ tuyển sinh:</strong>&nbsp;Nhận hồ sơ đăng k&yacute; dự tuyển tại Văn ph&ograve;ng Viện Đ&agrave;o tạo Quốc tế từ th&aacute;ng 01/3/2018 đến hết ng&agrave;y 30/6/2018.</p>

<p style="text-align:justify"><strong>6. Khai giảng:</strong>&nbsp;Kh&oacute;a học dự kiến khai giảng v&agrave;o th&aacute;ng 8/2018.</p>

<p style="text-align:justify">Th&ocirc;ng tin chi tiết xem tại&nbsp;<a href="http://sie.hust.edu.vn/" style="color: rgb(51, 51, 51); text-decoration-line: none;">http://sie.edu.vn/</a></p>
</div>
</div>
</div>
</div>
', NULL, CAST(N'2018-04-19 11:26:12.283' AS DateTime), 4, 1, N'/Content/Upload/img/11261219042018_article.jpg', 1, 3000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (18, N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<h3>Th&ocirc;ng b&aacute;o tuyển sinh kh&oacute;a 3 chương tr&igrave;nh MBA hợp t&aacute;c với ĐH Northampton, Vương quốc Anh</h3>
</div>

<div class="asset-full-content show-asset-title" style="font-family: Calibri; font-size: 15px;">
<div class="asset-content" id="_101_INSTANCE_AKFI5qRls1e8_323031" style="clear: right; margin-bottom: 10px; margin-left: 0px !important; margin-right: 10px;">
<div class="journal-content-article" style="font-size: 16px !important;">
<p style="text-align:justify">Trong khu&ocirc;n khổ chương tr&igrave;nh hợp t&aacute;c đ&agrave;o tạo giữa&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o </span>v&agrave; Đại học Northampton, Trường ĐHBK H&agrave; Nội&nbsp;tr&acirc;n trọng th&ocirc;ng b&aacute;o tuyển sinh năm 2018 chương tr&igrave;nh đ&agrave;o tạo Thạc sĩ Quản trị Kinh doanh (MBA) do Đại học Northampton, Vương qu&ocirc;́c Anh cấp bằng.</p>

<p style="text-align:justify"><strong>1. Đối tượng tuyển sinh:</strong></p>

<ul>
	<li style="text-align:justify">L&agrave; c&ocirc;ng d&acirc;n Việt Nam hoặc người nước ngo&agrave;i đang sinh sống tại Việt Nam, tốt nghiệp đại học tại Việt Nam hoặc nước ngo&agrave;i được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo c&ocirc;ng nhận.</li>
	<li style="text-align:justify">C&oacute; tr&igrave;nh độ tiếng Anh tương đương chuẩn B2 của ch&acirc;u &Acirc;u như IELTS 5.5 hoặc iBT TOEFL 61/PBT, TOEFL 500.</li>
</ul>

<p style="text-align:justify"><strong>2. Phương thức tuyển sinh:</strong>&nbsp;Trường Đại học Northampton x&eacute;t hồ sơ v&agrave; trực tiếp phỏng vấn. Đối với th&iacute; sinh chưa c&oacute; chứng chỉ tiếng Anh đạt chu&acirc;̉n sẽ phải tham gia kh&oacute;a dự bị Pre-MBA v&agrave; l&agrave;m b&agrave;i kiểm tra tiếng Anh đầu v&agrave;o.</p>

<p style="text-align:justify"><strong>3. Chương tr&igrave;nh đ&agrave;o tạo v&agrave; bằng cấp:</strong></p>

<ul>
	<li style="text-align:justify">Đ&agrave;o tạo trong 18 th&aacute;ng tại trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>&nbsp;theo chương tr&igrave;nh thống nhất giữa trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>. Chương tr&igrave;nh được giảng dạy bằng tiếng Anh bởi giảng vi&ecirc;n của trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>.</li>
	<li style="text-align:justify">Học vi&ecirc;n phải đạt tr&igrave;nh độ tiếng Anh tương đương IELTS 6.5 để được tiếp tục học kỳ II.</li>
	<li style="text-align:justify">Bằng cấp: Thạc sỹ của Đại học Northampton sau khi tốt nghiệp.</li>
</ul>

<p style="text-align:justify"><strong>4. Kinh ph&iacute; đ&agrave;o tạo:</strong>&nbsp;Học ph&iacute; cho to&agrave;n bộ kh&oacute;a học khoảng 205.000.000 VNĐ/học vi&ecirc;n/kh&oacute;a (Hai trăm linh năm triệu đồng chẵn). Học ph&iacute; được thu l&agrave;m 3 kỳ. Học ph&iacute; c&oacute; thể điều chỉnh nhưng kh&ocirc;ng vượt qu&aacute; mức thay đổi tỷ gi&aacute; hối đo&aacute;i của Ng&acirc;n h&agrave;ng Ngoại thương Việt Nam (Vietcombank).</p>

<p style="text-align:justify"><strong>5. Hồ sơ tuyển sinh:</strong>&nbsp;Nhận hồ sơ đăng k&yacute; dự tuyển tại Văn ph&ograve;ng Viện Đ&agrave;o tạo Quốc tế từ th&aacute;ng 01/3/2018 đến hết ng&agrave;y 30/6/2018.</p>

<p style="text-align:justify"><strong>6. Khai giảng:</strong>&nbsp;Kh&oacute;a học dự kiến khai giảng v&agrave;o th&aacute;ng 8/2018.</p>

<p style="text-align:justify">Th&ocirc;ng tin chi tiết xem tại&nbsp;<a href="http://sie.hust.edu.vn/" style="color: rgb(51, 51, 51); text-decoration-line: none;">http://sie.edu.vn/</a></p>
</div>
</div>
</div>
</div>
', NULL, CAST(N'2018-04-19 11:26:12.283' AS DateTime), 4, 1, N'/Content/Upload/img/11261219042018_article.jpg', 1, 3000)
INSERT [dbo].[TinTuc] ([IDTinTuc], [TieuDe], [TomTat], [NoiDung], [LinkFile], [CreateTime], [CreateBy], [Active], [Image], [ThongBao], [CountView]) VALUES (19, N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'Thông báo tuyển sinh khóa 3 chương trình MBA hợp tác với ĐH Northampton, Vương quốc Anh', N'<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<div class="taglib-header " style="border-bottom: 1px solid rgb(200, 201, 202); margin-bottom: 1em; color: rgb(85, 85, 85); font-family: Calibri; font-size: 15px;">
<h3>Th&ocirc;ng b&aacute;o tuyển sinh kh&oacute;a 3 chương tr&igrave;nh MBA hợp t&aacute;c với ĐH Northampton, Vương quốc Anh</h3>
</div>

<div class="asset-full-content show-asset-title" style="font-family: Calibri; font-size: 15px;">
<div class="asset-content" id="_101_INSTANCE_AKFI5qRls1e8_323031" style="clear: right; margin-bottom: 10px; margin-left: 0px !important; margin-right: 10px;">
<div class="journal-content-article" style="font-size: 16px !important;">
<p style="text-align:justify">Trong khu&ocirc;n khổ chương tr&igrave;nh hợp t&aacute;c đ&agrave;o tạo giữa&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o </span>v&agrave; Đại học Northampton, Trường ĐHBK H&agrave; Nội&nbsp;tr&acirc;n trọng th&ocirc;ng b&aacute;o tuyển sinh năm 2018 chương tr&igrave;nh đ&agrave;o tạo Thạc sĩ Quản trị Kinh doanh (MBA) do Đại học Northampton, Vương qu&ocirc;́c Anh cấp bằng.</p>

<p style="text-align:justify"><strong>1. Đối tượng tuyển sinh:</strong></p>

<ul>
	<li style="text-align:justify">L&agrave; c&ocirc;ng d&acirc;n Việt Nam hoặc người nước ngo&agrave;i đang sinh sống tại Việt Nam, tốt nghiệp đại học tại Việt Nam hoặc nước ngo&agrave;i được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo c&ocirc;ng nhận.</li>
	<li style="text-align:justify">C&oacute; tr&igrave;nh độ tiếng Anh tương đương chuẩn B2 của ch&acirc;u &Acirc;u như IELTS 5.5 hoặc iBT TOEFL 61/PBT, TOEFL 500.</li>
</ul>

<p style="text-align:justify"><strong>2. Phương thức tuyển sinh:</strong>&nbsp;Trường Đại học Northampton x&eacute;t hồ sơ v&agrave; trực tiếp phỏng vấn. Đối với th&iacute; sinh chưa c&oacute; chứng chỉ tiếng Anh đạt chu&acirc;̉n sẽ phải tham gia kh&oacute;a dự bị Pre-MBA v&agrave; l&agrave;m b&agrave;i kiểm tra tiếng Anh đầu v&agrave;o.</p>

<p style="text-align:justify"><strong>3. Chương tr&igrave;nh đ&agrave;o tạo v&agrave; bằng cấp:</strong></p>

<ul>
	<li style="text-align:justify">Đ&agrave;o tạo trong 18 th&aacute;ng tại trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>&nbsp;theo chương tr&igrave;nh thống nhất giữa trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>. Chương tr&igrave;nh được giảng dạy bằng tiếng Anh bởi giảng vi&ecirc;n của trường Đại học Northampton v&agrave; trường&nbsp;<span style="color:rgb(0, 0, 0); font-family:monospace; font-size:medium">Trường Cao đẳng Khammouane L&agrave;o</span>.</li>
	<li style="text-align:justify">Học vi&ecirc;n phải đạt tr&igrave;nh độ tiếng Anh tương đương IELTS 6.5 để được tiếp tục học kỳ II.</li>
	<li style="text-align:justify">Bằng cấp: Thạc sỹ của Đại học Northampton sau khi tốt nghiệp.</li>
</ul>

<p style="text-align:justify"><strong>4. Kinh ph&iacute; đ&agrave;o tạo:</strong>&nbsp;Học ph&iacute; cho to&agrave;n bộ kh&oacute;a học khoảng 205.000.000 VNĐ/học vi&ecirc;n/kh&oacute;a (Hai trăm linh năm triệu đồng chẵn). Học ph&iacute; được thu l&agrave;m 3 kỳ. Học ph&iacute; c&oacute; thể điều chỉnh nhưng kh&ocirc;ng vượt qu&aacute; mức thay đổi tỷ gi&aacute; hối đo&aacute;i của Ng&acirc;n h&agrave;ng Ngoại thương Việt Nam (Vietcombank).</p>

<p style="text-align:justify"><strong>5. Hồ sơ tuyển sinh:</strong>&nbsp;Nhận hồ sơ đăng k&yacute; dự tuyển tại Văn ph&ograve;ng Viện Đ&agrave;o tạo Quốc tế từ th&aacute;ng 01/3/2018 đến hết ng&agrave;y 30/6/2018.</p>

<p style="text-align:justify"><strong>6. Khai giảng:</strong>&nbsp;Kh&oacute;a học dự kiến khai giảng v&agrave;o th&aacute;ng 8/2018.</p>

<p style="text-align:justify">Th&ocirc;ng tin chi tiết xem tại&nbsp;<a href="http://sie.hust.edu.vn/" style="color: rgb(51, 51, 51); text-decoration-line: none;">http://sie.edu.vn/</a></p>
</div>
</div>
</div>
</div>
', NULL, CAST(N'2018-04-19 11:26:12.283' AS DateTime), 4, 1, N'/Content/Upload/img/11261219042018_article.jpg', 1, 3000)
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
ALTER TABLE [dbo].[CTDT]  WITH CHECK ADD  CONSTRAINT [FK_CTDT_MonHoc] FOREIGN KEY([IDMonHoc])
REFERENCES [dbo].[MonHoc] ([IDMonHoc])
GO
ALTER TABLE [dbo].[CTDT] CHECK CONSTRAINT [FK_CTDT_MonHoc]
GO
ALTER TABLE [dbo].[CTDT]  WITH CHECK ADD  CONSTRAINT [FK_CTDT_NganhHoc] FOREIGN KEY([IDNganhHoc])
REFERENCES [dbo].[NganhHoc] ([IDNganhHoc])
GO
ALTER TABLE [dbo].[CTDT] CHECK CONSTRAINT [FK_CTDT_NganhHoc]
GO
ALTER TABLE [dbo].[HocPhi]  WITH CHECK ADD  CONSTRAINT [FK_HocPhi_InfoKyHoc] FOREIGN KEY([IDInfoKyHoc])
REFERENCES [dbo].[InfoKyHoc] ([IDInfoKyHoc])
GO
ALTER TABLE [dbo].[HocPhi] CHECK CONSTRAINT [FK_HocPhi_InfoKyHoc]
GO
ALTER TABLE [dbo].[HocPhi]  WITH CHECK ADD  CONSTRAINT [FK_HocPhi_SinhVien] FOREIGN KEY([IDSinhVien])
REFERENCES [dbo].[SinhVien] ([IDSinhVien])
GO
ALTER TABLE [dbo].[HocPhi] CHECK CONSTRAINT [FK_HocPhi_SinhVien]
GO
ALTER TABLE [dbo].[InfoKyHoc]  WITH CHECK ADD  CONSTRAINT [FK_InfoKyHoc_KyHoc] FOREIGN KEY([IDKyHoc])
REFERENCES [dbo].[KyHoc] ([IDKyHoc])
GO
ALTER TABLE [dbo].[InfoKyHoc] CHECK CONSTRAINT [FK_InfoKyHoc_KyHoc]
GO
ALTER TABLE [dbo].[InfoKyHoc]  WITH CHECK ADD  CONSTRAINT [FK_InfoKyHoc_NamHoc] FOREIGN KEY([IDNamHoc])
REFERENCES [dbo].[NamHoc] ([IDNamHoc])
GO
ALTER TABLE [dbo].[InfoKyHoc] CHECK CONSTRAINT [FK_InfoKyHoc_NamHoc]
GO
ALTER TABLE [dbo].[KQHT]  WITH CHECK ADD  CONSTRAINT [FK_KQHT_LopDT] FOREIGN KEY([IDLopDT])
REFERENCES [dbo].[LopDT] ([IDLopDT])
GO
ALTER TABLE [dbo].[KQHT] CHECK CONSTRAINT [FK_KQHT_LopDT]
GO
ALTER TABLE [dbo].[KQHT]  WITH CHECK ADD  CONSTRAINT [FK_KQHT_SinhVien] FOREIGN KEY([IDSinhVien])
REFERENCES [dbo].[SinhVien] ([IDSinhVien])
GO
ALTER TABLE [dbo].[KQHT] CHECK CONSTRAINT [FK_KQHT_SinhVien]
GO
ALTER TABLE [dbo].[LopDT]  WITH CHECK ADD  CONSTRAINT [FK_LopDT_CTDT] FOREIGN KEY([IDCTDT])
REFERENCES [dbo].[CTDT] ([IDCTDT])
GO
ALTER TABLE [dbo].[LopDT] CHECK CONSTRAINT [FK_LopDT_CTDT]
GO
ALTER TABLE [dbo].[LopDT]  WITH CHECK ADD  CONSTRAINT [FK_LopDT_GiaoVien] FOREIGN KEY([IDGiaoVien])
REFERENCES [dbo].[GiaoVien] ([IDGiaoVien])
GO
ALTER TABLE [dbo].[LopDT] CHECK CONSTRAINT [FK_LopDT_GiaoVien]
GO
ALTER TABLE [dbo].[LopDT]  WITH CHECK ADD  CONSTRAINT [FK_LopDT_InfoKyHoc] FOREIGN KEY([IDInfoKyHoc])
REFERENCES [dbo].[InfoKyHoc] ([IDInfoKyHoc])
GO
ALTER TABLE [dbo].[LopDT] CHECK CONSTRAINT [FK_LopDT_InfoKyHoc]
GO
ALTER TABLE [dbo].[LopDT]  WITH CHECK ADD  CONSTRAINT [FK_LopDT_LopHoc] FOREIGN KEY([IDLopHoc])
REFERENCES [dbo].[LopHoc] ([IDLopHoc])
GO
ALTER TABLE [dbo].[LopDT] CHECK CONSTRAINT [FK_LopDT_LopHoc]
GO
ALTER TABLE [dbo].[LopDT]  WITH CHECK ADD  CONSTRAINT [FK_LopDT_PhongHoc] FOREIGN KEY([IDPhongHoc])
REFERENCES [dbo].[PhongHoc] ([IDPhongHoc])
GO
ALTER TABLE [dbo].[LopDT] CHECK CONSTRAINT [FK_LopDT_PhongHoc]
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_NganhHoc] FOREIGN KEY([IDNganhHoc])
REFERENCES [dbo].[NganhHoc] ([IDNganhHoc])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_NganhHoc]
GO
ALTER TABLE [dbo].[NganhHoc]  WITH CHECK ADD  CONSTRAINT [FK_NganhHoc_KhoiHoc] FOREIGN KEY([IDKhoiHoc])
REFERENCES [dbo].[KhoiHoc] ([IDKhoiHoc])
GO
ALTER TABLE [dbo].[NganhHoc] CHECK CONSTRAINT [FK_NganhHoc_KhoiHoc]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_LopHoc] FOREIGN KEY([IDLopHoc])
REFERENCES [dbo].[LopHoc] ([IDLopHoc])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_LopHoc]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_GiaoVien] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[GiaoVien] ([IDGiaoVien])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_GiaoVien]
GO
USE [master]
GO
ALTER DATABASE [QLSV] SET  READ_WRITE 
GO
