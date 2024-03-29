USE [master]
GO
/****** Object:  Database [QLRCP]    Script Date: 8/15/2023 5:22:47 PM ******/
CREATE DATABASE [QLRCP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLRCP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLRCP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLRCP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLRCP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLRCP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLRCP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLRCP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLRCP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLRCP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLRCP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLRCP] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLRCP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLRCP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLRCP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLRCP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLRCP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLRCP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLRCP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLRCP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLRCP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLRCP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLRCP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLRCP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLRCP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLRCP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLRCP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLRCP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLRCP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLRCP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLRCP] SET  MULTI_USER 
GO
ALTER DATABASE [QLRCP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLRCP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLRCP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLRCP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLRCP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLRCP] SET QUERY_STORE = OFF
GO
USE [QLRCP]
GO
/****** Object:  User [movie]    Script Date: 8/15/2023 5:22:47 PM ******/
CREATE USER [movie] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [movie]
GO
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 8/15/2023 5:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SDT] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[DiaChi] [nvarchar](150) NOT NULL,
	[TrangThai] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHUYEN_MAI]    Script Date: 8/15/2023 5:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHUYEN_MAI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKM] [varchar](10) NULL,
	[TenKM] [nvarchar](50) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[MucGiamGia] [money] NULL,
	[MaTT] [int] NULL,
	[MoTa] [nvarchar](100) NULL,
	[Link] [varchar](999) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LICH_CHIEU]    Script Date: 8/15/2023 5:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICH_CHIEU](
	[MaSuatChieu] [int] IDENTITY(1,1) NOT NULL,
	[NgayChieu] [date] NOT NULL,
	[MaPhong] [varchar](10) NOT NULL,
	[MaPhim] [int] NOT NULL,
	[GioChieu] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIVE]    Script Date: 8/15/2023 5:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIVE](
	[MaLV] [varchar](10) NOT NULL,
	[TenLV] [varchar](50) NOT NULL,
	[Gia] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAN_VIEN]    Script Date: 8/15/2023 5:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAN_VIEN](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[CMND] [varchar](50) NULL,
	[SDT] [varchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[GioiTinh] [bit] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[TrangThai] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIM]    Script Date: 8/15/2023 5:22:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIM](
	[MaPhim] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](100) NOT NULL,
	[NuocSX] [nvarchar](50) NULL,
	[NgayKhoiChieu] [date] NOT NULL,
	[NamSX] [int] NOT NULL,
	[DaoDien] [nvarchar](50) NOT NULL,
	[ThoiLuong] [int] NOT NULL,
	[Link] [varchar](8000) NOT NULL,
	[MaTT] [int] NOT NULL,
	[MoTa] [nvarchar](1000) NULL,
	[LinkTrailer] [varchar](8000) NULL,
	[GiaVe] [money] NULL,
	[MaKM] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONG]    Script Date: 8/15/2023 5:22:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONG](
	[MaPhong] [varchar](10) NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[TongSoGhe] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUYEN]    Script Date: 8/15/2023 5:22:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUYEN](
	[MaQuyen] [varchar](50) NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 8/15/2023 5:22:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[Email] [varchar](50) NOT NULL,
	[MaQuyen] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THE_LOAI]    Script Date: 8/15/2023 5:22:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THE_LOAI](
	[MaTL] [varchar](10) NOT NULL,
	[TenTL] [nvarchar](45) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THE_LOAI_PHIM]    Script Date: 8/15/2023 5:22:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THE_LOAI_PHIM](
	[MaTL] [varchar](10) NOT NULL,
	[MaPhim] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VE]    Script Date: 8/15/2023 5:22:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[MaSuatChieu] [int] NOT NULL,
	[MaKH] [int] NULL,
	[SoGhe] [int] NOT NULL,
	[NgayBan] [date] NOT NULL,
	[MaLV] [varchar](10) NOT NULL,
	[MaNV] [nvarchar](10) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KHACH_HANG] ON 

INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SDT], [Email], [DiaChi], [TrangThai]) VALUES (1, N'Lê Văn Bắc', CAST(N'1999-04-13' AS Date), 0, N'0386240987', N'bac123@gmail.com', N'Hồ Chí Minh', 1)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SDT], [Email], [DiaChi], [TrangThai]) VALUES (2, N'Hồng Tiên Tử', CAST(N'2000-09-16' AS Date), 0, N'0386240986', N'hongtientu@gmail.com', N'Hồ Chí Minh', 1)
INSERT [dbo].[KHACH_HANG] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SDT], [Email], [DiaChi], [TrangThai]) VALUES (3, N'Trương Vô Kỵ', CAST(N'2006-10-17' AS Date), 1, N'0386240987', N'kh01@gmail.com', N'Hồ Chí Minh', 1)
SET IDENTITY_INSERT [dbo].[KHACH_HANG] OFF
SET IDENTITY_INSERT [dbo].[KHUYEN_MAI] ON 

INSERT [dbo].[KHUYEN_MAI] ([ID], [MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [MucGiamGia], [MaTT], [MoTa], [Link]) VALUES (13, N'KM01', N'aaa', CAST(N'2023-08-15' AS Date), CAST(N'2023-08-16' AS Date), 10000.0000, 0, N'aaaa', NULL)
INSERT [dbo].[KHUYEN_MAI] ([ID], [MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [MucGiamGia], [MaTT], [MoTa], [Link]) VALUES (16, N'KM02', N'aaa', CAST(N'2023-08-16' AS Date), CAST(N'2023-08-25' AS Date), 10000.0000, 1, N'aaaa', NULL)
SET IDENTITY_INSERT [dbo].[KHUYEN_MAI] OFF
SET IDENTITY_INSERT [dbo].[LICH_CHIEU] ON 

INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (1, CAST(N'2023-05-31' AS Date), N'P01', 3, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (2, CAST(N'2023-05-31' AS Date), N'P05', 3, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (3, CAST(N'2023-06-03' AS Date), N'P05', 4, 15)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (4, CAST(N'2023-06-04' AS Date), N'P06', 4, 21)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (6, CAST(N'2023-06-03' AS Date), N'P05', 5, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (10, CAST(N'2023-06-03' AS Date), N'P05', 4, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (11, CAST(N'2023-06-06' AS Date), N'P10', 16, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (12, CAST(N'2023-06-02' AS Date), N'P05', 18, 18)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (16, CAST(N'2023-06-02' AS Date), N'P05', 13, 21)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (18, CAST(N'2023-06-04' AS Date), N'P11', 13, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (19, CAST(N'2023-06-04' AS Date), N'P05', 4, 21)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (20, CAST(N'2023-06-10' AS Date), N'P05', 27, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (23, CAST(N'2023-06-13' AS Date), N'P05', 27, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (25, CAST(N'2023-06-16' AS Date), N'P05', 29, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (26, CAST(N'2023-06-22' AS Date), N'P10', 28, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (27, CAST(N'2023-06-15' AS Date), N'P08', 28, 18)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (28, CAST(N'2023-06-18' AS Date), N'P05', 28, 15)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (29, CAST(N'2023-12-08' AS Date), N'P05', 14, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (30, CAST(N'2023-08-15' AS Date), N'P09', 15, 9)
INSERT [dbo].[LICH_CHIEU] ([MaSuatChieu], [NgayChieu], [MaPhong], [MaPhim], [GioChieu]) VALUES (31, CAST(N'2023-08-16' AS Date), N'P05', 15, 9)
SET IDENTITY_INSERT [dbo].[LICH_CHIEU] OFF
INSERT [dbo].[LOAIVE] ([MaLV], [TenLV], [Gia]) VALUES (N'LV01', N'Normal', 100000.0000)
INSERT [dbo].[LOAIVE] ([MaLV], [TenLV], [Gia]) VALUES (N'LV02', N'Weekend', 150000.0000)
INSERT [dbo].[LOAIVE] ([MaLV], [TenLV], [Gia]) VALUES (N'VIP', N'VIP', 300000.0000)
SET IDENTITY_INSERT [dbo].[NHAN_VIEN] ON 

INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (1, N'Lê Văn Bắc', CAST(N'1999-05-05' AS Date), N'123456789', N'323232322', N'Hồ Chí Minh', 1, N'chungquex2@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (2, N'Bắc DZ', CAST(N'1999-05-07' AS Date), N'3423433434', N'2323232', N'HCM', 0, N'n18dcat007@student.ptithcm.edu.vn', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (3, N'Dương Quá', CAST(N'1999-05-09' AS Date), N'48488854543', N'2323232323', N'HCM', 0, N'duongqua@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (4, N'Cô Cô', CAST(N'2023-05-23' AS Date), N'54545454454', N'1232323234', N'HCM', 0, N'duyen.nguyentranbich@novaland.com.vn', 0)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (6, N'Hoàng Dung', CAST(N'2023-05-30' AS Date), N'1787823301', N'1787823301', N'HCM', 0, N'hoangdung1@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (7, N'Bắc Cái', CAST(N'2023-05-30' AS Date), N'178723302', N'1787823302', N'HCM', 0, N'baccai@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (8, N'Hồng Hà Nhi', CAST(N'2023-05-30' AS Date), N'1787823303', N'1787823303', N'HCM', 0, N'honghanhi@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (12, N'Bạch Cốt Tinh', CAST(N'1999-05-24' AS Date), N'1787823304', N'232323', N'HCM', 0, N'nv@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (16, N'Tiểu Long Nữ', CAST(N'1987-05-31' AS Date), N'1787823305', N'0386240986', N'Hồ Chí Minh', 0, N'nv01@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (17, N'Quách Tương', CAST(N'2005-05-31' AS Date), N'1787823306', N'0386240985', N'HCM', 0, N'nv02@gmail.com', 0)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (19, N'Quách Tương', CAST(N'2005-05-31' AS Date), N'1787823307', N'0386240988', N'HCM', 0, N'nv03@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (20, N'Độc Cô Cầu Bại', CAST(N'1998-05-31' AS Date), N'1787823308', N'0386240984', N'HCM', 0, N'nv04@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (21, N'Chu Chỉ Nhược', CAST(N'2004-06-09' AS Date), N'1787823309', N'0386240983', N'HCM', 0, N'nv05@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (22, N'Trương Vô Kỵ', CAST(N'2000-06-03' AS Date), N'178723310', N'0386240987', N'HCM', 1, N'nv06@gmail.com', 1)
INSERT [dbo].[NHAN_VIEN] ([MaNV], [TenNV], [NgaySinh], [CMND], [SDT], [DiaChi], [GioiTinh], [Email], [TrangThai]) VALUES (25, N'Dương Quá', CAST(N'1999-12-08' AS Date), N'48488858589', N'0386240987', N'HCM', 0, N'nv09@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[NHAN_VIEN] OFF
SET IDENTITY_INSERT [dbo].[PHIM] ON 

INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (3, N' Ant-Man & The Wasp: Quantumania', N'America', CAST(N'2023-05-31' AS Date), 2023, N'MCU', 120, N'https://afamilycdn.com/150157425591193600/2023/4/12/photo-3-16812657851281818401820-1681290436740-16812904370521114490602.jpg', 2, N'Theo đoạn trailer mới nhất của bộ phim này cho thấy, gia đình của Scott Lang sẽ vô tình bị cuốn vào và mắc kẹt trong thế giới lượng tử. Tại đây, họ chạm trán với Kang, kẻ đã âm thầm xây dựng một đế chế hùng hậu cho riêng mình để chuẩn bị cho cuộc chinh phạt toàn bộ thực tại trong đa vũ trụ.', NULL, 150000.0000, N'KM01')
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (4, N'Nhà Bà Nữ', N'Việt Nam', CAST(N'2023-06-07' AS Date), 2023, N'Trấn Thành', 150, N'https://upload.wikimedia.org/wikipedia/vi/6/6f/%C3%81p_ph%C3%ADch_phim_Nh%C3%A0_b%C3%A0_N%E1%BB%AF.jpg', 0, N'Gây tiếng vang lớn dịp Tết 2023, những câu chuyện rất ', N'https://www.youtube.com/watch?v=pg4L29p98Kw', 100000.0000, N'KM01')
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (5, N'Trận chiến thời tiền sử', N'England', CAST(N'2023-06-03' AS Date), 2023, N'Jurassic Park', 120, N'https://i1-giaitri.vnecdn.net/2023/04/21/image001-8627-1682066789.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=WG5nLHLqgZ5hvnv1Hn0ceA', 0, N'Lấy bối cảnh thời tiền sử, bộ phim khắc họa cuộc chiến sinh tồn khốc liệt của con người hiện đại khi ngược dòng thời gian về thời điểm loài khủng long còn thống trị Trái đất. Sau cú va chạm tàu vũ trụ, Mills (Adam Driver) nhận ra mình đang ở kỷ Cretaceous (Phấn Trắng), cách thực tại 65 triệu năm.', NULL, 150000.0000, N'KM01')
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (13, N'HẬU LÃNG', N'Trung Quốc', CAST(N'2023-06-03' AS Date), 2023, N'Ngô Cương, Triệu Lộ Tư', 200, N'https://i.mpcdn.top/poster/hau-lang-11236.jpg?1685458967', 0, N'Hậu Lãng kể về Tôn Đầu Đầu, ở tuổi hai mươi, không cha không mẹ, không nghĩ chuyện quá khứ, không tính chuyện tương lai. Trong một lần vô tình vì lên tiếng trước chuyện bất bình mà cô không may vướng vào chuyện rắc rối không mong muốn,Nhận Tâm Chính, một giáo sư Đại học Y học cổ truyền Trung Quốc, đã kịp thời giúp đỡ cô và phát hiện ra cậu chuyện cuộc đời của cô, vì vậy đưa ra quyết định đưa cô tham gia lớp học thừa kế Y học cổ truyền Trung Quốc để cô bắt đầu lại cuộc sống của mình. Kể từ đó, Tôn Đầu Đầu dấn thân vào côn đường học tập dưới sự dìu dắt của Nhậm Tân Chính và kế thừa sự học của gia đình, không ngờ cô và Nhậm Thiên Chân, con trai của Nhậm Tân Chính lại không ưa nhau trong lớp nên đã gây ra rất nhiều rắc rối.', NULL, 150000.0000, N'KM01')
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (14, N'HỘ TÂM', N'Trung Quốc', CAST(N'2023-06-03' AS Date), 2023, N'Hầu Minh Hạo, Châu Dã, Dương Dung', 250, N'https://i.mpcdn.top/c/yel556O/ho-tam.jpg', 1, N'Hộ Tâm kể về yêu long Thiên Diệu đem lòng yêu Tố Ảnh nhưng lại bị nàng ta phản bột, rút xương phong ấn ở nhiều nơi. Biết được ý đồ của Tố Ảnh, Thiên Diệu lột vảy hộ tâm, ném nội đan đi. Vảy hộ tâm và nội đan của Thiên Diệu rơi xuống trần gian, vô tình cứu giúp Nhạn Hồi. Nhạn Hồi cũng vô tình mà giúp hắn phá vỡ 1 phần phong ấn, giải thoát linh hồn. Thế rồi Nhạn Hồi và Thiên Diệu gặp nhau. Thiên Diệu biết được vảy hộ tâm và nội đan của hắn đang ở trên người Nhạn Hồi nên một mực bám lấy nàng, bày mưu tính kế để nàng giúp mình, coi nàng là quân cờ trong đại nghiệp phục thù. Nhưng hắn đâu ngờ, bản thân lại đánh rơi trái tim nơi nàng mất rồi. Câu chuyện giữa Nhạn Hồi và Thiên Diệu sẽ tiếp tục ra sao?', NULL, 100000.0000, N'KM01')
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (15, N'ẢNH HẬU BÁO THÙ', N'Trung Quốc', CAST(N'2023-06-03' AS Date), 2003, N'Lý Mộc Thần', 150, N'https://i.mpcdn.top/c/47xbLAQ/anh-hau-bao-thu.jpg', 1, N'Ảnh Hậu Báo Thù kể về Ảnh hậu Thẩm Vãn Ý vạch trần vụ gian tình giữa vị hôn phu Lục Minh Vũ và người bạn thân Quý Dao, cô bị hai người kia hại chết bằng một vụ dàn dựng tai nạn xe hơi. Khi Thẩm Vãn Ý một lần nữa tỉnh lại, cô phát hiện mình đang ở thời điểm trước khi xảy ra tai nạn. Cô đã bắt tay cùng ảnh đế Cố Ngôn Giác để lên kế hoạch trả thù, khiến đôi gian phu dâm phụ phải trả trả giá xứng đáng, còn bản thân gặt hái được tình cảm chân thành.', NULL, 100000.0000, N'KM01')
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (16, N'Tây Du Ký', N'Trung Quốc', CAST(N'2023-06-10' AS Date), 1986, N'Ngô Thừa Ân', 300, N'https://upload.wikimedia.org/wikipedia/vi/b/b9/T%C3%A2y_du_k%C3%BD_%28%C3%A1p_ph%C3%ADch%29.jpg', 0, N'Trong tiểu thuyết, Trần Huyền Trang (陳玄奘) được Quan Âm Bồ Tát bảo đến Tây Trúc (Ấn Độ) thỉnh kinh Phật giáo mang về Trung Quốc. Theo ông là 4 đệ tử - một khỉ đá tên Tôn Ngộ Không (孫悟空), một yêu quái nửa người nửa lợn tên Trư Ngộ Năng (豬悟能) và một thủy quái tên Sa Ngộ Tĩnh (沙悟淨) - họ đều đồng ý giúp ông thỉnh kinh để chuộc tội. Con ngựa Huyền Trang cưỡi cũng là một hoàng tử của Long Vương (Bạch Long Mã).', NULL, 100000.0000, N'KM01')
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (18, N'Thần Điêu Đại Hiệp', N'Trung Quốc', CAST(N'2023-06-01' AS Date), 2006, N'Vu Mẫn', 189, N'https://upload.wikimedia.org/wikipedia/vi/9/96/Thandieudaidiep20066nt.jpg', 1, N'Thần điêu đại hiệp là bộ phim do Đài truyền hình trung ương Trung Quốc phát hành năm 2006, dựa theo tiểu thuyết kiếm hiệp cùng tên của nhà văn Kim Dung. Đây là phần thứ hai trong Xạ điêu tam bộ khúc do Trương Kỉ Trung sản xuất, phần trước là Anh hùng xạ điêu và phần sau là Ỷ Thiên Đồ Long Ký.', NULL, 100000.0000, N'KM01')
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (27, N'Lăng Ba Vi Bộ', N'Trung Quốc', CAST(N'2023-06-10' AS Date), 2023, N'Scream', 120, N'https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien.jpeg', 0, N'updating...', N'https://www.youtube.com/watch?v=ECQywFhw6oc&list=PLvyeldVrrmim7aO9yQjirePVtG9Iwmn0g&index=17', 100000.0000, N'KM01')
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (28, N'Abc', N'Trung Quốc', CAST(N'2023-06-30' AS Date), 2023, N'Jurassic Park', 150, N'https://play-lh.googleusercontent.com/rbMu3OFnD48ncSHY0r-B_wF3PxbLozpj17aSyFbEdmejQoM_nwVs9dGALFBn1mk8o77fO8WMZ0MLgAAt11kS=w240-h480-rw', 0, N'updating...', N'https://www.youtube.com/watch?v=ECQywFhw6oc&list=PLvyeldVrrmim7aO9yQjirePVtG9Iwmn0g&index=17', 300000.0000, N'KM01')
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [NuocSX], [NgayKhoiChieu], [NamSX], [DaoDien], [ThoiLuong], [Link], [MaTT], [MoTa], [LinkTrailer], [GiaVe], [MaKM]) VALUES (29, N'a1', N'America', CAST(N'2023-06-23' AS Date), 2023, N'Jurassic Park', 125, N'https://upload.wikimedia.org/wikipedia/vi/0/00/%E1%BB%B6_Thi%C3%AAn_%C4%90%E1%BB%93_Long_K%C3%BD_%28phim_truy%E1%BB%81n_h%C3%ACnh_2019%29_poster.jpg', 0, N'updating...', N'https://www.youtube.com/watch?v=ECQywFhw6oc&list=PLvyeldVrrmim7aO9yQjirePVtG9Iwmn0g&index=17', 150000.0000, N'KM01')
SET IDENTITY_INSERT [dbo].[PHIM] OFF
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P01', 1, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P02', 1, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P03', 1, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P04', 1, 1)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P05', 0, 48)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P06', 0, 48)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P07', 0, 48)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P08', 0, 48)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P09', 0, 48)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P10', 0, 48)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P11', 0, 48)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P12', 0, 48)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P13', 0, 48)
INSERT [dbo].[PHONG] ([MaPhong], [TrangThai], [TongSoGhe]) VALUES (N'P14', 0, 48)
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (N'KH', N'Khách Hàng')
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (N'NV', N'Nhân Viên')
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (N'QL', N'Quản Lý')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'bac123@gmail.com', N'KH', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'baccai@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'chungquex2@gmail.com', N'QL', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'duongqua@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'duyen.nguyentranbich@novaland.com.vn', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'hoangdung@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'hoangdung1@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'honghanhi@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'hongtientu@gmail.com', N'KH', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'kh01@gmail.com', N'KH', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'n18dcat007@student.ptithcm.edu.vn', N'NV', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nv@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nv01@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nv02@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nv03@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nv04@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nv05@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nv06@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[TAIKHOAN] ([Email], [MaQuyen], [Password]) VALUES (N'nv09@gmail.com', N'NV', N'2e9ec317e197819358fbc43afca7d837')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (N'TL01', N'Marvel')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (N'TL02', N'Funny')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (N'TL03', N'Romantic')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (N'TL04', N'Phim Việt, Tâm lý, Hài')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (N'TL05', N'Hành Ðộng')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (N'TL06', N'Kinh Dị')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (N'TL07', N'Hoạt Hình')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (N'TL08', N'Phim Tài Liệu')
INSERT [dbo].[THE_LOAI] ([MaTL], [TenTL]) VALUES (N'TL09', N'Cổ Trang - Kiếm Hiệp')
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL01', 3)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL01', 28)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL03', 13)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL03', 15)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL03', 29)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL04', 4)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL05', 5)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL05', 15)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL05', 16)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL05', 18)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL05', 29)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL07', 29)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL09', 14)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL09', 16)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL09', 18)
INSERT [dbo].[THE_LOAI_PHIM] ([MaTL], [MaPhim]) VALUES (N'TL09', 27)
SET IDENTITY_INSERT [dbo].[VE] ON 

INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (1, 1, 1, 1, CAST(N'2023-05-30' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (2, 2, 1, 29, CAST(N'2023-05-30' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (3, 6, NULL, 11, CAST(N'2023-05-30' AS Date), N'LV02', N'2')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (4, 6, NULL, 22, CAST(N'2023-05-30' AS Date), N'LV02', N'2')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (5, 3, 1, 1, CAST(N'2023-05-31' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (6, 6, 1, 1, CAST(N'2023-05-31' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (7, 11, 1, 12, CAST(N'2023-06-01' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (8, 12, 1, 10, CAST(N'2023-06-01' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (9, 12, 1, 48, CAST(N'2023-06-01' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (10, 12, 1, 28, CAST(N'2023-06-01' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (11, 12, 1, 21, CAST(N'2023-06-01' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (12, 12, 1, 30, CAST(N'2023-06-01' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (13, 12, NULL, 6, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (14, 12, NULL, 14, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (15, 12, NULL, 15, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (16, 12, NULL, 3, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (17, 12, NULL, 2, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (18, 12, NULL, 18, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (19, 12, NULL, 37, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (20, 12, NULL, 13, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (21, 12, NULL, 36, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (22, 12, NULL, 29, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (23, 12, NULL, 39, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (24, 12, NULL, 40, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (25, 12, 2, 20, CAST(N'2023-06-02' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (26, 12, NULL, 7, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (27, 11, 1, 13, CAST(N'2023-06-02' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (29, 12, NULL, 12, CAST(N'2023-06-02' AS Date), N'LV02', N'16')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (30, 11, 1, 21, CAST(N'2023-06-02' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (31, 3, 1, 4, CAST(N'2023-06-02' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (32, 3, 1, 11, CAST(N'2023-06-02' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (33, 12, 1, 22, CAST(N'2023-06-02' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (34, 12, 1, 19, CAST(N'2023-06-02' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (35, 12, 1, 11, CAST(N'2023-06-02' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (36, 12, 1, 1, CAST(N'2023-06-02' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (37, 11, 1, 15, CAST(N'2023-06-02' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (40, 16, NULL, 24, CAST(N'2023-06-02' AS Date), N'LV02', N'2')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (41, 16, NULL, 22, CAST(N'2023-06-02' AS Date), N'LV02', N'2')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (42, 16, NULL, 20, CAST(N'2023-06-02' AS Date), N'LV02', N'2')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (43, 3, NULL, 5, CAST(N'2023-06-03' AS Date), N'LV02', N'2')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (44, 3, NULL, 23, CAST(N'2023-06-03' AS Date), N'LV02', N'2')
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (45, 3, 1, 21, CAST(N'2023-06-03' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (46, 20, 1, 4, CAST(N'2023-06-06' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (49, 20, 1, 1, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (50, 20, 1, 9, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (51, 20, 1, 2, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (52, 20, 1, 10, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (53, 20, 1, 7, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (54, 20, 1, 15, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (55, 20, 1, 23, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (56, 20, 1, 31, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (57, 20, 1, 39, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (58, 20, 1, 40, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (59, 20, 1, 32, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (60, 20, 1, 24, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (61, 20, 1, 16, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (62, 20, 1, 8, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (63, 20, 1, 17, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (64, 20, 1, 25, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (65, 20, 1, 33, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (66, 20, 1, 41, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (67, 20, 1, 26, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (68, 20, 1, 18, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (69, 20, 1, 42, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (70, 20, 1, 34, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (71, 20, 1, 35, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (72, 20, 1, 43, CAST(N'2023-06-08' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (73, 25, 1, 27, CAST(N'2023-06-13' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (74, 25, 1, 35, CAST(N'2023-06-13' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (75, 25, 1, 36, CAST(N'2023-06-13' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (77, 25, 1, 28, CAST(N'2023-06-13' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (78, 25, 1, 29, CAST(N'2023-06-13' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (79, 25, 1, 37, CAST(N'2023-06-13' AS Date), N'LV02', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (80, 26, 1, 44, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (81, 26, 1, 36, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (82, 26, 1, 37, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (83, 26, 1, 29, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (84, 26, 1, 21, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (85, 26, 1, 20, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (86, 26, 1, 19, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (87, 26, 1, 27, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (88, 26, 1, 35, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (89, 26, 1, 28, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (90, 26, 1, 38, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (91, 26, 1, 46, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (92, 26, 1, 45, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (93, 26, 1, 43, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (94, 26, 1, 14, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (95, 26, 1, 22, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (96, 26, 1, 16, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (97, 26, 1, 23, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (98, 26, 1, 15, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (99, 26, 1, 31, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (100, 26, 1, 32, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (101, 26, 1, 40, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (102, 26, 1, 48, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (103, 26, 1, 18, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (104, 26, 1, 10, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (105, 26, 1, 2, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
GO
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (106, 26, 1, 1, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (107, 26, 1, 9, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (108, 26, 1, 17, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (109, 26, 1, 25, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (110, 26, 1, 33, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (111, 26, 1, 42, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (112, 26, 1, 41, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (113, 26, 1, 34, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (114, 26, 1, 26, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (115, 26, 1, 3, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (116, 26, 1, 4, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (117, 26, 1, 5, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (118, 26, 1, 6, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (119, 26, 1, 13, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (120, 26, 1, 11, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (121, 26, 1, 12, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (122, 26, 1, 30, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (123, 26, 1, 39, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (124, 26, 1, 47, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (125, 26, 1, 24, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (126, 26, 1, 8, CAST(N'2023-06-13' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (127, 31, 1, 3, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (128, 31, 1, 11, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (129, 31, 1, 12, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (130, 31, 1, 20, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (131, 31, 1, 19, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (132, 31, 1, 27, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (133, 31, 1, 28, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (134, 31, 1, 29, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (135, 31, 1, 21, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (136, 31, 1, 13, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (137, 31, 1, 5, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
INSERT [dbo].[VE] ([MaVe], [MaSuatChieu], [MaKH], [SoGhe], [NgayBan], [MaLV], [MaNV]) VALUES (138, 31, 1, 4, CAST(N'2023-08-15' AS Date), N'LV01', NULL)
SET IDENTITY_INSERT [dbo].[VE] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_CMND]    Script Date: 8/15/2023 5:22:48 PM ******/
ALTER TABLE [dbo].[NHAN_VIEN] ADD  CONSTRAINT [UK_CMND] UNIQUE NONCLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [QLRCP] SET  READ_WRITE 
GO
