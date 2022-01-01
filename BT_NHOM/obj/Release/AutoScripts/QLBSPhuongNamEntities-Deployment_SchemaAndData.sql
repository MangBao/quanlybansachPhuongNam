SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaHD] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[MaSach] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[SoLuongSach] [int] NOT NULL,
	[GiaBan] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPN](
	[MaPN] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[MaSach] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[SoLuongNhap] [int] NOT NULL,
	[GiaNhap] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[TinhTrang] [int] NOT NULL,
	[NgayXuatKho] [date] NULL,
	[NgayGiao] [date] NULL,
	[MaKH] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[MaNV] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[Ho] [nvarchar](20) COLLATE Vietnamese_CI_AS NOT NULL,
	[Holot] [nvarchar](20) COLLATE Vietnamese_CI_AS NOT NULL,
	[Ten] [nvarchar](20) COLLATE Vietnamese_CI_AS NOT NULL,
	[DiaChi] [nvarchar](100) COLLATE Vietnamese_CI_AS NULL,
	[SoDTKH] [varchar](20) COLLATE Vietnamese_CI_AS NULL,
	[Email] [varchar](50) COLLATE Vietnamese_CI_AS NOT NULL,
	[Matkhau] [varchar](20) COLLATE Vietnamese_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgonNgu](
	[MaNN] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[TenNN] [nvarchar](100) COLLATE Vietnamese_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[TenNCC] [nvarchar](50) COLLATE Vietnamese_CI_AS NOT NULL,
	[DiaChiNCC] [nvarchar](100) COLLATE Vietnamese_CI_AS NOT NULL,
	[SDTNCC] [varchar](20) COLLATE Vietnamese_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[Ho] [nvarchar](20) COLLATE Vietnamese_CI_AS NOT NULL,
	[Holot] [nvarchar](20) COLLATE Vietnamese_CI_AS NOT NULL,
	[Ten] [nvarchar](20) COLLATE Vietnamese_CI_AS NOT NULL,
	[DiaChi] [nvarchar](100) COLLATE Vietnamese_CI_AS NULL,
	[SoDTNV] [varchar](20) COLLATE Vietnamese_CI_AS NULL,
	[Email] [varchar](50) COLLATE Vietnamese_CI_AS NOT NULL,
	[Matkhau] [varchar](20) COLLATE Vietnamese_CI_AS NOT NULL,
	[PhanQuyen] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[MaNXB] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[TenNXB] [nvarchar](50) COLLATE Vietnamese_CI_AS NOT NULL,
	[DiaChiNXB] [nvarchar](100) COLLATE Vietnamese_CI_AS NOT NULL,
	[DienThoai] [varchar](20) COLLATE Vietnamese_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[MaNCC] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[TenSach] [nvarchar](100) COLLATE Vietnamese_CI_AS NOT NULL,
	[TenTG] [nvarchar](100) COLLATE Vietnamese_CI_AS NOT NULL,
	[NgayXB] [date] NOT NULL,
	[SoLuongTon] [int] NOT NULL,
	[MoTa] [nvarchar](500) COLLATE Vietnamese_CI_AS NOT NULL,
	[AnhBia] [varchar](50) COLLATE Vietnamese_CI_AS NOT NULL,
	[GiaSach] [decimal](18, 2) NOT NULL,
	[MaTL] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[MaNXB] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[MaNN] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach_TG](
	[MaSach] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[MaTG] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[VaiTro] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTG] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[TenTG] [nvarchar](100) COLLATE Vietnamese_CI_AS NOT NULL,
	[DiaChi] [nvarchar](100) COLLATE Vietnamese_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTL] [varchar](10) COLLATE Vietnamese_CI_AS NOT NULL,
	[TenTL] [nvarchar](50) COLLATE Vietnamese_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD001', N'S007', 10, CAST(20000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD002', N'S006', 5, CAST(34000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD003', N'S005', 15, CAST(15000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD004', N'S004', 7, CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD005', N'S001', 40, CAST(45000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD006', N'S028', 3, CAST(27000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD007', N'S003', 25, CAST(25000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD008', N'S005', 9, CAST(25000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD009', N'S008', 28, CAST(95000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD010', N'S012', 34, CAST(12000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD011', N'S022', 2, CAST(14000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD012', N'S026', 1, CAST(65000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD013', N'S017', 6, CAST(11000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD014', N'S014', 9, CAST(19000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSach], [SoLuongSach], [GiaBan]) VALUES (N'HD015', N'S009', 1, CAST(87000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN01', N'S001', 200, CAST(15000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN02', N'S002', 175, CAST(25000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN03', N'S003', 155, CAST(12000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN04', N'S004', 130, CAST(30000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN05', N'S005', 180, CAST(40000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN06', N'S006', 190, CAST(17000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN07', N'S007', 174, CAST(19000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN08', N'S008', 160, CAST(19500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN09', N'S009', 140, CAST(18000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN10', N'S010', 180, CAST(18500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN11', N'S011', 164, CAST(17500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN12', N'S012', 179, CAST(17500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN13', N'S013', 160, CAST(11000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN14', N'S014', 170, CAST(28000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ChiTietPN] ([MaPN], [MaSach], [SoLuongNhap], [GiaNhap]) VALUES (N'PN15', N'S015', 188, CAST(20000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD001', 1, CAST(N'2020-01-02' AS Date), CAST(N'2020-01-06' AS Date), N'KH001', N'NV01')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD002', 1, CAST(N'2020-12-02' AS Date), CAST(N'2020-12-04' AS Date), N'KH001', N'NV01')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD003', 3, CAST(N'2020-02-22' AS Date), CAST(N'2020-02-28' AS Date), N'KH003', N'NV02')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD004', 1, CAST(N'2020-12-03' AS Date), CAST(N'2020-12-07' AS Date), N'KH004', N'NV01')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD005', 1, CAST(N'2020-07-05' AS Date), CAST(N'2020-07-07' AS Date), N'KH006', N'NV03')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD006', 1, CAST(N'2020-01-02' AS Date), CAST(N'2020-01-09' AS Date), N'KH005', N'NV02')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD007', 2, CAST(N'2020-12-05' AS Date), CAST(N'2020-12-08' AS Date), N'KH001', N'NV02')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD008', 2, CAST(N'2020-07-05' AS Date), CAST(N'2020-07-11' AS Date), N'KH003', N'NV03')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD009', 1, CAST(N'2020-06-21' AS Date), CAST(N'2020-06-23' AS Date), N'KH001', N'NV01')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD010', 1, CAST(N'2020-04-02' AS Date), CAST(N'2020-04-12' AS Date), N'KH002', N'NV03')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD011', 2, CAST(N'2020-12-03' AS Date), CAST(N'2020-12-08' AS Date), N'KH002', N'NV03')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD012', 1, CAST(N'2020-09-04' AS Date), CAST(N'2020-09-07' AS Date), N'KH001', N'NV01')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD013', 1, CAST(N'2020-11-05' AS Date), CAST(N'2020-11-11' AS Date), N'KH002', N'NV03')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD014', 3, CAST(N'2020-10-21' AS Date), CAST(N'2020-10-22' AS Date), N'KH006', N'NV01')
GO
INSERT [dbo].[HoaDon] ([MaHD], [TinhTrang], [NgayXuatKho], [NgayGiao], [MaKH], [MaNV]) VALUES (N'HD015', 1, CAST(N'2020-08-18' AS Date), CAST(N'2020-08-20' AS Date), N'KH003', N'NV02')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH001', N'Lê', N'Minh', N'Long', N'731 Tran Hung Dao, ql1, TPHCM', N'0384623682', N'lml731@gmail.com', N'mk001')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH002', N'Trương', N'Thị Thanh', N'Hằng', N'782 Ngô Quyền,Q6,TPHCM', N'0898362886', N'th782@gmail.com', N'mk002')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH003', N'Võ', N'Hoài', N'Lâm', N'156 Phan Chu Trinh,TPHCM', N'0361472145', N'hl156@gmail.com', N'mk003')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH004', N'Hoàng', N'Thị Như', N'Quỳnh', N'93 Nguyễn Trãi,Phú Yên', N'0782377278', N'nq93@gmail.com', N'mk004')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH005', N'Lê', N'Thanh', N'Thảo', N'109 Hùng Vương, Hà Nội', N'0783876837', N'tt109@gmail.com', N'mk005')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH006', N'Đặng', N'Thị Thảo', N'Vy', N'78 Lê Hồng Phong, Nha Trang, KH', N'0983623678', N'tv78@gmail.com', N'mk006')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH007', N'Nguyễn', N'Thành', N'Nam', N'36 Nhị Hà, Nha Trang, KH', N'0866465293', N'tn36@gmail.com', N'mk007')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH008', N'Trần', N'Hoàng', N'Yến', N'11 Khu bãi sỏi, Sơn Tây, Hà Nội', N'0979218617', N'hy11@gmail.com', N'mk008')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH009', N'Phan', N'Thị Hồng', N'Phúc', N'22 Phan Văn Hân, Phường 12, Bình Thạnh, TPHCM', N'0967364146', N'hp22@gmail.com', N'mk009')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH010', N'Nguyễn', N'Ngọc', N'Dũng', N'138 Nam Kỳ Khởi Nghĩa, Bến Nghé, Q1, TPHCM', N'0283852717', N'nd@gmail.com', N'mk010')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH011', N'Vũ', N'Thị', N'Thương', N'Thôn Xuân An, Xã Mỹ An, Huyện Lục Ngạn, Tỉnh Bắc Giang', N'0316836841', N'ttxa@gmail.com', N'mk011')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH012', N'Nguyễn', N'Văn', N'Toán', N'44 Tái Thiết, Phường 11, Quận Tân Bình, TPHCM', N'0316836834', N'vt44@gmail.com', N'mk012')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH013', N'Nguyễn', N'Hồng', N'Quang', N'734 Lê Văn Lượng, Xã Nhơn Đức, Huyện Nhà Bè, TPHCM', N'0316833287', N'hq734@gmail.com', N'mk013')
GO
INSERT [dbo].[NgonNgu] ([MaNN], [TenNN]) VALUES (N'NN01', N'Tiếng Pháp')
GO
INSERT [dbo].[NgonNgu] ([MaNN], [TenNN]) VALUES (N'NN02', N'Tiếng Anh')
GO
INSERT [dbo].[NgonNgu] ([MaNN], [TenNN]) VALUES (N'NN03', N'Tiếng Việt')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC01', N'Cty TNHH Đỗ Gia Phát', N'Cầu Giấy, Hà Nội', N'0984867231')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC02', N'Trung Ương Đoàn TNCS HCM', N'33 Hoàng Văn Thụ, Q9, TPHCM', N'0994863733')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC03', N'NXB Giao Thông Vận Tải', N'823 Đinh Tiên Hoàng, Q2,TPHCM', N'0965275285')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC04', N'Bộ Giáo Dục và Đào Tạo', N'978 Quang Trung, Hà Nội', N'0637572876')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC05', N'NXB Tổng Hợp TPHCM', N'864 Nguyễn Thị Minh Khai,Q1,TPHCM', N'0836345634')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC06', N'Đại Học Quốc Gia Hà Nội', N'873 Duy Tân,Cầu Giấy,Hà Nội', N'0375834678')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC07', N'Hội Nhà Văn', N'98 Trần Hưng Đạo,Hà Nội', N'0936478432')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC08', N'Đại học Bách Khoa', N'90 Trần Hưng Đạo,Hà Nội', N'0936478432')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC09', N'Đại học Khoa học Tự Nhiên', N'98 Dốc Cô Nui, TPHCM', N'0936478432')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC10', N'Đại học Nông Lâm', N'Trần Duy Hưng, Hà Nội', N'0936478432')
GO
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Holot], [Ten], [DiaChi], [SoDTNV], [Email], [Matkhau], [PhanQuyen]) VALUES (N'NV01', N'Lê', N'Minh', N'Long', N'731 Trần Hưng Đạo, quận 1, TP HCM', N'0384623682', N'long@gmail.com', N'mk123', 0)
GO
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Holot], [Ten], [DiaChi], [SoDTNV], [Email], [Matkhau], [PhanQuyen]) VALUES (N'NV02', N'Nguyễn', N'Văn', N'Trí', N'638 Trần Bình Trọng, TP HCM', N'02439434730', N'tri@gmail.com', N'mk123', 0)
GO
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Holot], [Ten], [DiaChi], [SoDTNV], [Email], [Matkhau], [PhanQuyen]) VALUES (N'NV03', N'Mang', N'', N'Bảo', N'853 Mai Th? Lưu, qu?n 5, TP HCM', N'02439434730', N'bao@gmail.com', N'mk123', 1)
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB01', N'NXB Giáo Dục', N'5A Trần Hưng Đạo,Q1,TPHCM', N'0957357287')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB02', N'Giao Thông Vận Tải', N'459 Trưng Vương, Hà Nội', N'0295496352')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB03', N'NXB Kim Đồng', N'967 Lê Hồng Phong,Q10,TPHCM', N'0967843568')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB04', N'Lịch Sử Văn Minh', N'125 Trần Bình Trọng,TPHCM', N'0867354085')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB05', N'Phương Nam Book', N'34 Bà Rịa, Vũng Tàu', N'0888527752')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB06', N'NXB Văn Học', N'09 Nguyễn Thái Học,Q1,TPHCM', N'0989835276')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB07', N'NXB Nhã Nam', N'631 Võ Văn Tần,Đà Nẵng', N'0784735276')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB08', N'NXB Trẻ', N'161B Lý Chính Thắng, Phường 7, Thành phố Hồ Chí Minh.', N'02839316289')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB09', N'NXB Tổng hợp thành phố HCM', N'62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP.HCM.', N'02838225340')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB10', N'NXB chính trị quốc gia sự thật', N'Số 6/86 Duy Tân, Cầu Giấy, Hà Nội.', N'028049221')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN01', CAST(N'2019-02-11' AS Date), N'NCC01')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN02', CAST(N'2019-12-08' AS Date), N'NCC02')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN03', CAST(N'2019-03-05' AS Date), N'NCC03')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN04', CAST(N'2019-04-09' AS Date), N'NCC04')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN05', CAST(N'2019-11-01' AS Date), N'NCC05')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN06', CAST(N'2019-05-05' AS Date), N'NCC06')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN07', CAST(N'2019-11-20' AS Date), N'NCC07')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN08', CAST(N'2019-01-13' AS Date), N'NCC10')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN09', CAST(N'2019-02-18' AS Date), N'NCC08')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN10', CAST(N'2019-03-19' AS Date), N'NCC03')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN11', CAST(N'2019-04-18' AS Date), N'NCC04')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN12', CAST(N'2019-05-10' AS Date), N'NCC09')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN13', CAST(N'2019-06-08' AS Date), N'NCC06')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN14', CAST(N'2019-07-01' AS Date), N'NCC02')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNCC]) VALUES (N'PN15', CAST(N'2019-08-20' AS Date), N'NCC03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S001', N'Tarzan Trở Lại Rừng Già', N'Edgar Rice Burroughs', CAST(N'1946-05-01' AS Date), 100, N'Trên đường đi công tác huân tước Clayton và vợ - Alice bị bỏ lại trên đảo hoang.sdfs', N'1.jpg', CAST(45000.00 AS Decimal(18, 2)), N'PL', N'NXB04', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S002', N'Viễn Cổ Hành', N'Thi Lạc', CAST(N'2000-10-02' AS Date), 50, N'Lam Nguyệt không ngờ chỉ ngủ một giấc đã đem mình đến thời không khác', N'2.jpg', CAST(54000.00 AS Decimal(18, 2)), N'PL', N'NXB03', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S003', N'Ấn Tượng Sai Lầm', N'Jeffrey Archer', CAST(N'1999-01-19' AS Date), 10, N'Với cách kể chuyện tài hoa, Jeffrey Archer giống như đang chơi trò mèo vờn chuột với độc giả. Siêu phẩm của ông', N'3.jpg', CAST(32000.00 AS Decimal(18, 2)), N'PL', N'NXB07', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S004', N'Những Cuộc Phiêu Lưu Của Tom Shawyer', N'Mark Twain', CAST(N'1990-06-18' AS Date), 58, N'Với bản tính hiếu động, Tom Sawyer không lúc nào chịu yên. ', N'4.jpg', CAST(65000.00 AS Decimal(18, 2)), N'TD', N'NXB02', N'NN01')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S005', N'Những cuộc phiêu lưu của Huckleberry Finn', N'Nguyễn Du', CAST(N'1920-02-19' AS Date), 70, N'Những cuộc phiêu lưu cùng Tom Sawyer, Huck Finn được bà quả phụ Douglas đón về', N'5.jpg', CAST(56000.00 AS Decimal(18, 2)), N'PL', N'NXB08', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S006', N'Nguồn Cội', N'Dan Brown', CAST(N'1998-05-23' AS Date), 15, N'Edmond Kirsch là một tỷ phú bốn mươi tuổi, một nhà tiên tri. Những phát minh kỹ thuật cao', N'6.jpg', CAST(43000.00 AS Decimal(18, 2)), N'PL', N'NXB03', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S007', N'Cuộc phiêu lưu của Nam tước', N'Rudolph Erich Raspe ', CAST(N'1990-06-08' AS Date), 25, N' Nó kể những sự tích kỳ lạ khó có ai trên đời có thể kiểm chứng, thế nhưng lại khiến cho tên tuổi ', N'7.jpg', CAST(87000.00 AS Decimal(18, 2)), N'HK', N'NXB02', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S008', N'Hai Vạn Dặm Dưới Đáy Biển', N'Jules Verne', CAST(N'1940-05-22' AS Date), 30, N'Xuất hiện ở biển khơi, đoàn thám hiểm của giáo sư Pierre Aronnax bất ngờ bị“con cá" khổng lồ đó nuốt vào bụng', N'8.jpg', CAST(32000.00 AS Decimal(18, 2)), N'HK', N'NXB06', N'NN01')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S009', N'Người Cá', N'Alexander Romanovich Belyaev', CAST(N'2000-01-10' AS Date), 60, N'Dân làng ven vịnh Plata xôn xao về chuyện con quỷ biển xuất hiện, ai nấy đều sợ đến mức không dám ra khơi.', N'9.jpg', CAST(44000.00 AS Decimal(18, 2)), N'HK', N'NXB01', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S010', N'DƯỚI MÁI NGÓI ĐƠN SƠ', N'Thiên Như Ngọc', CAST(N'1979-12-19' AS Date), 80, N'Hoành môn chi hạ” là câu đầu tiên trong Kinh Thi phần Quốc phong, Trần phong, dịch nghĩa đen là bắc gỗ ngang làm cổng nhà.', N'10.jpg', CAST(98000.00 AS Decimal(18, 2)), N'PL', N'NXB01', N'NN01')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S011', N'Lấy Chồng Bạc Tỷ', N'Mộc Thất Thất', CAST(N'1990-04-08' AS Date), 36, N'Cuộc sống luôn có những điều bất ngờ xảy ra ví dụ như Giang Nhung mong muốn có cuốc sống bình thường', N'11.jpg', CAST(57000.00 AS Decimal(18, 2)), N'TN', N'NXB04', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S012', N'Đẹp Trai Là Số 1', N'Lục Mang Tinh', CAST(N'1920-11-09' AS Date), 40, N'Tín ngưỡng lúc đầu của Tô Căng Bắc chính là: giày cao gót và tiểu thịt tươi không thể phụ.', N'12.jpg', CAST(69000.00 AS Decimal(18, 2)), N'TN', N'NXB09', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S013', N'Từ Bi Khúc', N'Võ Anh Thơ', CAST(N'1980-06-23' AS Date), 98, N' Tô Khiết và Trình Khâm, lần này là nói về chuyện tình của con trai hai người là Trình Diễn. ', N'13.jpg', CAST(38000.00 AS Decimal(18, 2)), N'TN', N'NXB02', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S014', N'Xuân Sắc Tràn Đầy', N'Mạch Mầm ', CAST(N'1870-06-07' AS Date), 70, N'Chắc có lẽ câu chuyện này là một ngoại lệ cũng  bởi lẽ nam chính lại là người thứ ba trong cuộc tình của nữ chính với người khác.', N'14.jpg', CAST(15000.00 AS Decimal(18, 2)), N'HK', N'NXB02', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S015', N'Xin Chào, Người Thừa Kế', N'Công Tử Diễn', CAST(N'1940-05-12' AS Date), 63, N'Anh thân là người kế thừa tập đoàn Đế Hào, tính cách quyết đoán lãnh huyết nhưng đối với cô lại là yêu chiều đến tận xương tủy.', N'15.jpg', CAST(77000.00 AS Decimal(18, 2)), N'TN', N'NXB04', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S016', N'Ép Khô Nam Phụ', N'Khanh Uyển Uyển Uyển', CAST(N'2002-09-10' AS Date), 74, N'Có thể nói trong mắt của mọi người thì Mộc Khanh Khanh là một cô nàng cơ trí dũng cảm thuần khiết đang ở “Tổ thanh thủy” ', N'16.jpg', CAST(66000.00 AS Decimal(18, 2)), N'TN', N'NXB01', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S017', N'Truyện Tranh Doremon', N'Fujiko F Fujio', CAST(N'1998-01-29' AS Date), 36, N'Bộ truyện tranh viễn tưởng nổi tiếng của Nhật Bản- truyện tranh Doremon ngay từ khi mới ra đời đã nhận được sự ủng hộ nhiệt tình ', N'17.jpg', CAST(54000.00 AS Decimal(18, 2)), N'TT', N'NXB01', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S018', N'Đảo Hải Tặc', N'Eiichiro Oda', CAST(N'1960-02-12' AS Date), 50, N'Hoạt hình Nhật Bản dựa trên loạt manga cùng tên của tác giả Eiichiro Oda', N'18.jpg', CAST(63000.00 AS Decimal(18, 2)), N'TT', N'NXB03', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S019', N'Thám Tử Lừng Danh Conan', N'Gosho Aoyama', CAST(N'1925-11-09' AS Date), 60, N'Hoạt hình chuyển thể từ truyện tranh hấp dẫn nhất: Thám Tử Lừng Danh Conan của tác giả Aoyama Gosho. Phim Conan kể về thần đồng 17 tuổi ...', N'19.jpg', CAST(53000.00 AS Decimal(18, 2)), N'TT', N'NXB06', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S020', N'Dấu Ấn Rồng Thiêng', N'Sanjo Riku', CAST(N'1978-05-22' AS Date), 90, N'Câu chuyện kể rằng, sau khi ma vương Hadlar bị đánh bại, những con quái vật được giải thoát khỏi hắn bắt đầu dời đến hòn đảo Delmurin', N'20.jpg', CAST(92000.00 AS Decimal(18, 2)), N'TD', N'NXB05', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S021', N'Truyện Tranh Tây Du', N'Đặng Chí Huy ', CAST(N'1970-06-27' AS Date), 15, N'Bạch Lang và Tiểu Vũ, giữ bí mật bôn ba, từ đây bắt đầu hành trình gian nan trên đường thực hiện sứ mạng của mình...', N'21.jpg', CAST(79000.00 AS Decimal(18, 2)), N'TT', N'NXB04', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S022', N'Người Trong Giang Hồ', N'Ngưu Lão', CAST(N'1980-08-18' AS Date), 20, N'Những ngày trước khi gia nhập Hội Tam Hoàng, thiếu niên Trần Hạo Nam chật vật với mối bất hòa trong gia đình', N'22.jpg', CAST(43000.00 AS Decimal(18, 2)), N'TT', N'NXB03', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S023', N'7 Viên Ngọc Rồng', N'Akira Toriyama', CAST(N'1990-11-09' AS Date), 60, N'Truyện tranh cùng tên của tác giả Toriyama Akira nổi tiếng tại Nhật Bản và nhiều nước trên thế giới', N'23.jpg', CAST(36000.00 AS Decimal(18, 2)), N'TD', N'NXB09', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S024', N'Naruto', N'Kishimoto Masashi', CAST(N'1998-05-22' AS Date), 80, N'Câu chuyện về Naruto Uzumaki, một ninja trẻ tìm kiếm sự công nhận từ mọi người và ước mơ trở thành Hokage', N'24.jpg', CAST(62000.00 AS Decimal(18, 2)), N'TT', N'NXB05', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S025', N'Chiếc Lược Ngà', N'Nguyễn Quang Sáng', CAST(N'1990-06-27' AS Date), 35, N'Tình cha con trong quá khứ và một câu chuyện đậm chất điện ảnh về tài trí của cô giao liên ở hiện tại', N'25.jpg', CAST(33000.00 AS Decimal(18, 2)), N'TD', N'NXB07', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S026', N'Ô Long Viện', N'Yao-hsing', CAST(N'1940-05-22' AS Date), 96, N'Chuyện kể về 4 thầy trò tài giỏi tu tập võ nghệ và hô phong hoán vũ trên gian hồ. Các thầy trò vui nhộn sẽ đem đến những trận cười nghiêng ngả ', N'26.jpg', CAST(70000.00 AS Decimal(18, 2)), N'HK', N'NXB05', N'NN01')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S027', N'Cây Tre Trăm Đốt', N'Truyện dân gian Việt Nam', CAST(N'1999-10-10' AS Date), 63, N'Truyện mang lại những bài học nhân văn và ý nghĩa vô cùng sâu sắc, răn dạy con người ta phải sống sao cho thiện lương nhất', N'27.jpg', CAST(64000.00 AS Decimal(18, 2)), N'HK', N'NXB06', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S028', N'365 Chuyện Kể Hàng Đêm', N'Lưu Hồng Hà', CAST(N'1940-05-12' AS Date), 55, N'Cuốn sách tập hợp những truyện ngụ ngôn, đồng thoại đặc sắc từ xưa đến nay của nhiều quốc gia trên thế giới', N'28.jpg', CAST(11000.00 AS Decimal(18, 2)), N'CT', N'NXB09', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S029', N'Thần thoại Bắc Âu', N'Khuyết Danh', CAST(N'2000-10-12' AS Date), 70, N'Sau những thế giới hư cấu tuyệt vời trong những tác phẩm trước đó, Neil Gaiman, một trong những cây bút hấp dẫn của thể loại truyện giả tưởng', N'29.jpg', CAST(28000.00 AS Decimal(18, 2)), N'CT', N'NXB03', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S030', N'Truyện cổ Tây Tạng', N'Eva Bednarova', CAST(N'1999-03-19' AS Date), 65, N'Cuốn sách với nhiều độc giả, đặc biệt là những bạn muốn tìm hiểu về văn hóa Tây Tạng.', N'30.jpg', CAST(99000.00 AS Decimal(18, 2)), N'CT', N'NXB07', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S031', N'Thần Thoại Hy Lạp', N'Nguyễn Văn Khoả', CAST(N'1990-08-08' AS Date), 47, N'Những nhân vật, điển tích trong đây liên tục được tái sinh, hiện diện, truyền nguồn cảm hứng tới khắp mọi nơi từ triết học', N'31.jpg', CAST(37000.00 AS Decimal(18, 2)), N'CT', N'NXB10', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S032', N'Truyện cổ Ả-Rập', N'Contes Dorient', CAST(N'1980-12-19' AS Date), 60, N'Truyện Cổ Ả Rập mang nhiều sắc màu văn hóa phương Đông, đưa đến cho các em thiếu nhi ', N'32.jpg', CAST(75000.00 AS Decimal(18, 2)), N'CT', N'NXB10', N'NN01')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S033', N'Nghìn Lẻ Một Đêm', N'Nhiều tác giả', CAST(N'1997-05-20' AS Date), 70, N'Chuyện tình yêu giữa Lăng Lăng Thất và Bách Hải. Lăng Lăng Thất thầm yêu Bách Hải mà không dám tỏ tình.', N'33.jpg', CAST(25000.00 AS Decimal(18, 2)), N'CT', N'NXB08', N'NN02')
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S001', N'TG01', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S001', N'TG07', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S002', N'TG02', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S002', N'TG03', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S002', N'TG05', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S003', N'TG04', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S003', N'TG06', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S004', N'TG01', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S004', N'TG08', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S005', N'TG02', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S005', N'TG04', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S006', N'TG06', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S007', N'TG01', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S007', N'TG03', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S008', N'TG07', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S009', N'TG05', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S009', N'TG08', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S010', N'TG03', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S010', N'TG09', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S011', N'TG04', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S011', N'TG11', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S012', N'TG09', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S013', N'TG12', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S014', N'TG07', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S015', N'TG01', 0)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S015', N'TG04', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S016', N'TG07', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S017', N'TG04', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S018', N'TG02', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S019', N'TG03', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S020', N'TG13', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S021', N'TG01', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S022', N'TG06', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S023', N'TG07', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S024', N'TG05', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S025', N'TG02', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S026', N'TG08', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S027', N'TG04', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S028', N'TG07', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S029', N'TG10', 1)
GO
INSERT [dbo].[Sach_TG] ([MaSach], [MaTG], [VaiTro]) VALUES (N'S030', N'TG06', 1)
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG01', N'Ernest Hemingway', N'Oak Park, Illinois, Chicago')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG02', N'Tố Hữu', N'Tp Hội An, tỉnh Quảng Nam')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG03', N'Haruki Murakami', N'Tp Ashiya, Tỉnh Hytogo')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG04', N'Nguyễn Nhật Ánh', N'Bình Quế, Thăng Bình, Quảng Nam')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG05', N'Nguyễn Du', N'Nghi Xuân, Hà Tĩnh ')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG06', N'Kim Lân', N'Tân Hồng, Từ Sơn, Bắc Ninh')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG07', N'Jules Verne ', N'Tp Nantes, Pháp')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG08', N'Dale Breckenridge Carnegie', N'Maryville, Missouri')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG09', N'Nguyễn Tuân', N'Hàng Bạc, Thượng Đình, Hà Nội')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG10', N'Tô Hoài', N'Nghĩa Đô, Cầu Giấy, Hà Nội')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG11', N'E.B.White', N'Mount Vernon, New York')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG12', N'Huy Cận', N'Xã Ân Phú, Huyện Vũ Quang, Tỉnh Hà Tĩnh')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG13', N'Kim Lân', N'Đông Ngàn, Thị Xã Từ Sơn, Tỉnh Bắc Ninh')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'CT', N'Cổ Tích')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'HK', N'Hồi ký')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'PL', N'Phiêu Lưu ')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TD', N'Truyện dài')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TN', N'Truyện Ngắn')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TT', N'Truyện Tranh')
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ChiTietPN]  WITH CHECK ADD FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[ChiTietPN]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([MaNN])
REFERENCES [dbo].[NgonNgu] ([MaNN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NhaXuatBan] ([MaNXB])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([MaTL])
REFERENCES [dbo].[TheLoai] ([MaTL])
GO
ALTER TABLE [dbo].[Sach_TG]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[Sach_TG]  WITH CHECK ADD FOREIGN KEY([MaTG])
REFERENCES [dbo].[TacGia] ([MaTG])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* cập nhật hàng trong kho sau khi cập nhật đặt hàng */
CREATE TRIGGER trg_CapNhatDatHang on ChiTietHD after update AS
BEGIN
   UPDATE Sach SET SoLuongTon = SoLuongTon -
	   (SELECT SoLuongSach FROM inserted WHERE MaSach = Sach.MaSach) +
	   (SELECT SoLuongSach FROM deleted WHERE MaSach = Sach.MaSach)
   FROM Sach 
   JOIN deleted ON Sach.MaSach = deleted.MaSach
end

GO
ALTER TABLE [dbo].[ChiTietHD] ENABLE TRIGGER [trg_CapNhatDatHang]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* cập nhật hàng trong kho sau khi đặt hàng hoặc cập nhật */
CREATE TRIGGER trg_DatHang ON ChiTietHD AFTER INSERT AS 
BEGIN
	UPDATE Sach
	SET SoLuongTon = SoLuongTon - (
		SELECT SoLuongSach
		FROM inserted
		WHERE MaSach = Sach.MaSach
	)
	FROM Sach
	JOIN inserted ON Sach.MaSach = inserted.MaSach
END

GO
ALTER TABLE [dbo].[ChiTietHD] ENABLE TRIGGER [trg_DatHang]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* cập nhật hàng trong kho sau khi hủy đặt hàng */
create TRIGGER trg_HuyDatHang ON ChiTietHD FOR DELETE AS 
BEGIN
	UPDATE Sach
	SET SoLuongTon = SoLuongTon + (SELECT SoLuongSach FROM deleted WHERE MaSach = Sach.MaSach)
	FROM Sach 
	JOIN deleted ON Sach.MaSach = deleted.MaSach
END
GO
ALTER TABLE [dbo].[ChiTietHD] ENABLE TRIGGER [trg_HuyDatHang]
GO
