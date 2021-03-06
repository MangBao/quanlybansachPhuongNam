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
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH001', N'L??', N'Minh', N'Long', N'731 Tran Hung Dao, ql1, TPHCM', N'0384623682', N'lml731@gmail.com', N'mk001')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH002', N'Tr????ng', N'Th??? Thanh', N'H???ng', N'782 Ng?? Quy????n,Q6,TPHCM', N'0898362886', N'th782@gmail.com', N'mk002')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH003', N'V??', N'Ho??i', N'L??m', N'156 Phan Chu Trinh,TPHCM', N'0361472145', N'hl156@gmail.com', N'mk003')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH004', N'Ho??ng', N'Th??? Nh??', N'Qu???nh', N'93 Nguy????n Tra??i,Phu?? Y??n', N'0782377278', N'nq93@gmail.com', N'mk004')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH005', N'L??', N'Thanh', N'Th???o', N'109 Hu??ng V????ng, H?? N???i', N'0783876837', N'tt109@gmail.com', N'mk005')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH006', N'?????ng', N'Th??? Th???o', N'Vy', N'78 L?? H????ng Phong, Nha Trang, KH', N'0983623678', N'tv78@gmail.com', N'mk006')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH007', N'Nguy???n', N'Th??nh', N'Nam', N'36 Nhi?? Ha??, Nha Trang, KH', N'0866465293', N'tn36@gmail.com', N'mk007')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH008', N'Tr???n', N'Ho??ng', N'Y???n', N'11 Khu b??i s???i, S??n T??y, H?? N???i', N'0979218617', N'hy11@gmail.com', N'mk008')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH009', N'Phan', N'Th??? H???ng', N'Ph??c', N'22 Phan V??n H??n, Ph?????ng 12, B??nh Th???nh, TPHCM', N'0967364146', N'hp22@gmail.com', N'mk009')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH010', N'Nguy???n', N'Ng???c', N'D??ng', N'138 Nam K??? Kh???i Ngh??a, B???n Ngh??, Q1, TPHCM', N'0283852717', N'nd@gmail.com', N'mk010')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH011', N'V??', N'Th???', N'Th????ng', N'Th??n Xu??n An, X?? M??? An, Huy???n L???c Ng???n, T???nh B???c Giang', N'0316836841', N'ttxa@gmail.com', N'mk011')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH012', N'Nguy???n', N'V??n', N'To??n', N'44 T??i Thi???t, Ph?????ng 11, Qu???n T??n B??nh, TPHCM', N'0316836834', N'vt44@gmail.com', N'mk012')
GO
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Holot], [Ten], [DiaChi], [SoDTKH], [Email], [Matkhau]) VALUES (N'KH013', N'Nguy???n', N'H???ng', N'Quang', N'734 L?? V??n L?????ng, X?? Nh??n ?????c, Huy???n Nh?? B??, TPHCM', N'0316833287', N'hq734@gmail.com', N'mk013')
GO
INSERT [dbo].[NgonNgu] ([MaNN], [TenNN]) VALUES (N'NN01', N'Ti???ng Ph??p')
GO
INSERT [dbo].[NgonNgu] ([MaNN], [TenNN]) VALUES (N'NN02', N'Ti???ng Anh')
GO
INSERT [dbo].[NgonNgu] ([MaNN], [TenNN]) VALUES (N'NN03', N'Ti???ng Vi???t')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC01', N'Cty TNHH ?????? Gia Pha??t', N'C????u Gi????y, Ha?? N????i', N'0984867231')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC02', N'Trung ????ng ??oa??n TNCS HCM', N'33 Hoa??ng V??n Thu??, Q9, TPHCM', N'0994863733')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC03', N'NXB Giao Th??ng V????n Ta??i', N'823 ??inh Ti??n Hoa??ng, Q2,TPHCM', N'0965275285')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC04', N'B???? Gia??o Du??c va?? ??a??o Ta??o', N'978 Quang Trung, Ha?? N????i', N'0637572876')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC05', N'NXB T????ng H????p TPHCM', N'864 Nguy????n Thi?? Minh Khai,Q1,TPHCM', N'0836345634')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC06', N'??a??i Ho??c Qu????c Gia Ha?? N????i', N'873 Duy T??n,C????u Gi????y,Ha?? N????i', N'0375834678')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC07', N'H????i Nha?? V??n', N'98 Tr????n H??ng ??a??o,Ha?? N????i', N'0936478432')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC08', N'?????i h???c B??ch Khoa', N'90 Tr????n H??ng ??a??o,Ha?? N????i', N'0936478432')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC09', N'?????i h???c Khoa h???c T??? Nhi??n', N'98 D???c C?? Nui, TPHCM', N'0936478432')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChiNCC], [SDTNCC]) VALUES (N'NCC10', N'?????i h???c N??ng L??m', N'Tr????n Duy H??ng, Ha?? N????i', N'0936478432')
GO
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Holot], [Ten], [DiaChi], [SoDTNV], [Email], [Matkhau], [PhanQuyen]) VALUES (N'NV01', N'L??', N'Minh', N'Long', N'731 Tr???n H??ng ?????o, qu???n 1, TP HCM', N'0384623682', N'long@gmail.com', N'mk123', 0)
GO
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Holot], [Ten], [DiaChi], [SoDTNV], [Email], [Matkhau], [PhanQuyen]) VALUES (N'NV02', N'Nguy???n', N'V??n', N'Tr??', N'638 Tr???n B??nh Tr???ng, TP HCM', N'02439434730', N'tri@gmail.com', N'mk123', 0)
GO
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Holot], [Ten], [DiaChi], [SoDTNV], [Email], [Matkhau], [PhanQuyen]) VALUES (N'NV03', N'Mang', N'', N'B???o', N'853 Mai Th? L??u, qu?n 5, TP HCM', N'02439434730', N'bao@gmail.com', N'mk123', 1)
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB01', N'NXB Gia??o Du??c', N'5A Tr????n H??ng ??a??o,Q1,TPHCM', N'0957357287')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB02', N'Giao Th??ng V????n Ta??i', N'459 Tr??ng V????ng, Ha?? N????i', N'0295496352')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB03', N'NXB Kim ??????ng', N'967 L?? H????ng Phong,Q10,TPHCM', N'0967843568')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB04', N'Li??ch S???? V??n Minh', N'125 Tr????n Bi??nh Tro??ng,TPHCM', N'0867354085')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB05', N'Ph????ng Nam Book', N'34 Ba?? Ri??a, Vu??ng Ta??u', N'0888527752')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB06', N'NXB V??n Ho??c', N'09 Nguy????n Tha??i Ho??c,Q1,TPHCM', N'0989835276')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB07', N'NXB Nha?? Nam', N'631 Vo?? V??n T????n,??a?? N????ng', N'0784735276')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB08', N'NXB Tr???', N'161B L?? Ch??nh Th???ng, Ph?????ng 7, Th??nh ph??? H??? Ch?? Minh.', N'02839316289')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB09', N'NXB T???ng h???p th??nh ph??? HCM', N'62 Nguy???n Th??? Minh Khai, Ph?????ng ??a Kao, Qu???n 1, TP.HCM.', N'02838225340')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoai]) VALUES (N'NXB10', N'NXB ch??nh tr??? qu???c gia s??? th???t', N'S??? 6/86 Duy T??n, C???u Gi???y, H?? N???i.', N'028049221')
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
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S001', N'Tarzan Tr??? L???i R???ng Gi??', N'Edgar Rice Burroughs', CAST(N'1946-05-01' AS Date), 100, N'Tr??n ???????ng ??i c??ng t??c hu??n t?????c Clayton v?? v??? - Alice b??? b??? l???i tr??n ?????o hoang.sdfs', N'1.jpg', CAST(45000.00 AS Decimal(18, 2)), N'PL', N'NXB04', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S002', N'Vi???n C??? H??nh', N'Thi L???c', CAST(N'2000-10-02' AS Date), 50, N'Lam Nguy???t kh??ng ng??? ch??? ng??? m???t gi???c ???? ??em m??nh ?????n th???i kh??ng kh??c', N'2.jpg', CAST(54000.00 AS Decimal(18, 2)), N'PL', N'NXB03', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S003', N'???n T?????ng Sai L???m', N'Jeffrey Archer', CAST(N'1999-01-19' AS Date), 10, N'V???i c??ch k??? chuy???n t??i hoa, Jeffrey Archer gi???ng nh?? ??ang ch??i tr?? m??o v???n chu???t v???i ?????c gi???. Si??u ph???m c???a ??ng', N'3.jpg', CAST(32000.00 AS Decimal(18, 2)), N'PL', N'NXB07', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S004', N'Nh???ng Cu???c Phi??u L??u C???a Tom Shawyer', N'Mark Twain', CAST(N'1990-06-18' AS Date), 58, N'V???i b???n t??nh hi???u ?????ng, Tom Sawyer kh??ng l??c n??o ch???u y??n. ', N'4.jpg', CAST(65000.00 AS Decimal(18, 2)), N'TD', N'NXB02', N'NN01')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S005', N'Nh???ng cu???c phi??u l??u c???a Huckleberry Finn', N'Nguy???n Du', CAST(N'1920-02-19' AS Date), 70, N'Nh???ng cu???c phi??u l??u c??ng Tom Sawyer, Huck Finn ???????c b?? qu??? ph??? Douglas ????n v???', N'5.jpg', CAST(56000.00 AS Decimal(18, 2)), N'PL', N'NXB08', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S006', N'Ngu???n C???i', N'Dan Brown', CAST(N'1998-05-23' AS Date), 15, N'Edmond Kirsch l?? m???t t??? ph?? b???n m????i tu???i, m???t nh?? ti??n tri. Nh???ng ph??t minh k??? thu???t cao', N'6.jpg', CAST(43000.00 AS Decimal(18, 2)), N'PL', N'NXB03', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S007', N'Cu???c phi??u l??u c???a Nam t?????c', N'Rudolph Erich Raspe ', CAST(N'1990-06-08' AS Date), 25, N' N?? k??? nh???ng s??? t??ch k??? l??? kh?? c?? ai tr??n ?????i c?? th??? ki???m ch???ng, th??? nh??ng l???i khi???n cho t??n tu???i ', N'7.jpg', CAST(87000.00 AS Decimal(18, 2)), N'HK', N'NXB02', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S008', N'Hai V???n D???m D?????i ????y Bi???n', N'Jules Verne', CAST(N'1940-05-22' AS Date), 30, N'Xu???t hi???n ??? bi???n kh??i, ??o??n th??m hi???m c???a gi??o s?? Pierre Aronnax b???t ng??? b??????con c??" kh???ng l??? ???? nu???t v??o b???ng', N'8.jpg', CAST(32000.00 AS Decimal(18, 2)), N'HK', N'NXB06', N'NN01')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S009', N'Ng?????i C??', N'Alexander Romanovich Belyaev', CAST(N'2000-01-10' AS Date), 60, N'D??n l??ng ven v???nh Plata x??n xao v??? chuy???n con qu??? bi???n xu???t hi???n, ai n???y ?????u s??? ?????n m???c kh??ng d??m ra kh??i.', N'9.jpg', CAST(44000.00 AS Decimal(18, 2)), N'HK', N'NXB01', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S010', N'D?????I M??I NG??I ????N S??', N'Thi??n Nh?? Ng???c', CAST(N'1979-12-19' AS Date), 80, N'Ho??nh m??n chi h?????? l?? c??u ?????u ti??n trong Kinh Thi ph???n Qu???c phong, Tr???n phong, d???ch ngh??a ??en l?? b???c g??? ngang l??m c???ng nh??.', N'10.jpg', CAST(98000.00 AS Decimal(18, 2)), N'PL', N'NXB01', N'NN01')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S011', N'L???y Ch???ng B???c T???', N'M???c Th???t Th???t', CAST(N'1990-04-08' AS Date), 36, N'Cu???c s???ng lu??n c?? nh???ng ??i???u b???t ng??? x???y ra v?? d??? nh?? Giang Nhung mong mu???n c?? cu???c s???ng b??nh th?????ng', N'11.jpg', CAST(57000.00 AS Decimal(18, 2)), N'TN', N'NXB04', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S012', N'?????p Trai L?? S??? 1', N'L???c Mang Tinh', CAST(N'1920-11-09' AS Date), 40, N'T??n ng?????ng l??c ?????u c???a T?? C??ng B???c ch??nh l??: gi??y cao g??t v?? ti???u th???t t????i kh??ng th??? ph???.', N'12.jpg', CAST(69000.00 AS Decimal(18, 2)), N'TN', N'NXB09', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S013', N'T??? Bi Kh??c', N'V?? Anh Th??', CAST(N'1980-06-23' AS Date), 98, N' T?? Khi???t v?? Tr??nh Kh??m, l???n n??y l?? n??i v??? chuy???n t??nh c???a con trai hai ng?????i l?? Tr??nh Di???n. ', N'13.jpg', CAST(38000.00 AS Decimal(18, 2)), N'TN', N'NXB02', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S014', N'Xu??n S???c Tr??n ?????y', N'M???ch M???m ', CAST(N'1870-06-07' AS Date), 70, N'Ch???c c?? l??? c??u chuy???n n??y l?? m???t ngo???i l??? c??ng  b???i l??? nam ch??nh l???i l?? ng?????i th??? ba trong cu???c t??nh c???a n??? ch??nh v???i ng?????i kh??c.', N'14.jpg', CAST(15000.00 AS Decimal(18, 2)), N'HK', N'NXB02', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S015', N'Xin Ch??o, Ng?????i Th???a K???', N'C??ng T??? Di???n', CAST(N'1940-05-12' AS Date), 63, N'Anh th??n l?? ng?????i k??? th???a t???p ??o??n ????? H??o, t??nh c??ch quy???t ??o??n l??nh huy???t nh??ng ?????i v???i c?? l???i l?? y??u chi???u ?????n t???n x????ng t???y.', N'15.jpg', CAST(77000.00 AS Decimal(18, 2)), N'TN', N'NXB04', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S016', N'??p Kh?? Nam Ph???', N'Khanh Uy???n Uy???n Uy???n', CAST(N'2002-09-10' AS Date), 74, N'C?? th??? n??i trong m???t c???a m???i ng?????i th?? M???c Khanh Khanh l?? m???t c?? n??ng c?? tr?? d??ng c???m thu???n khi???t ??ang ??? ???T??? thanh th???y??? ', N'16.jpg', CAST(66000.00 AS Decimal(18, 2)), N'TN', N'NXB01', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S017', N'Truy???n Tranh Doremon', N'Fujiko F Fujio', CAST(N'1998-01-29' AS Date), 36, N'B??? truy???n tranh vi???n t?????ng n???i ti???ng c???a Nh???t B???n- truy???n tranh Doremon ngay t??? khi m???i ra ?????i ???? nh???n ???????c s??? ???ng h??? nhi???t t??nh ', N'17.jpg', CAST(54000.00 AS Decimal(18, 2)), N'TT', N'NXB01', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S018', N'?????o H???i T???c', N'Eiichiro Oda', CAST(N'1960-02-12' AS Date), 50, N'Ho???t h??nh Nh???t B???n d???a tr??n lo???t manga c??ng t??n c???a t??c gi??? Eiichiro Oda', N'18.jpg', CAST(63000.00 AS Decimal(18, 2)), N'TT', N'NXB03', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S019', N'Th??m T??? L???ng Danh Conan', N'Gosho Aoyama', CAST(N'1925-11-09' AS Date), 60, N'Ho???t h??nh chuy???n th??? t??? truy???n tranh h???p d???n nh???t: Th??m T??? L???ng Danh Conan c???a t??c gi??? Aoyama Gosho. Phim Conan k??? v??? th???n ?????ng 17 tu???i ...', N'19.jpg', CAST(53000.00 AS Decimal(18, 2)), N'TT', N'NXB06', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S020', N'D???u ???n R???ng Thi??ng', N'Sanjo Riku', CAST(N'1978-05-22' AS Date), 90, N'C??u chuy???n k??? r???ng, sau khi ma v????ng Hadlar b??? ????nh b???i, nh???ng con qu??i v???t ???????c gi???i tho??t kh???i h???n b???t ?????u d???i ?????n h??n ?????o Delmurin', N'20.jpg', CAST(92000.00 AS Decimal(18, 2)), N'TD', N'NXB05', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S021', N'Truy???n Tranh T??y Du', N'?????ng Ch?? Huy ', CAST(N'1970-06-27' AS Date), 15, N'B???ch Lang v?? Ti???u V??, gi??? b?? m???t b??n ba, t??? ????y b???t ?????u h??nh tr??nh gian nan tr??n ???????ng th???c hi???n s??? m???ng c???a m??nh...', N'21.jpg', CAST(79000.00 AS Decimal(18, 2)), N'TT', N'NXB04', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S022', N'Ng?????i Trong Giang H???', N'Ng??u L??o', CAST(N'1980-08-18' AS Date), 20, N'Nh???ng ng??y tr?????c khi gia nh???p H???i Tam Ho??ng, thi???u ni??n Tr???n H???o Nam ch???t v???t v???i m???i b???t h??a trong gia ????nh', N'22.jpg', CAST(43000.00 AS Decimal(18, 2)), N'TT', N'NXB03', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S023', N'7 Vi??n Ng???c R???ng', N'Akira Toriyama', CAST(N'1990-11-09' AS Date), 60, N'Truy???n tranh c??ng t??n c???a t??c gi??? Toriyama Akira n???i ti???ng t???i Nh???t B???n v?? nhi???u n?????c tr??n th??? gi???i', N'23.jpg', CAST(36000.00 AS Decimal(18, 2)), N'TD', N'NXB09', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S024', N'Naruto', N'Kishimoto Masashi', CAST(N'1998-05-22' AS Date), 80, N'C??u chuy???n v??? Naruto Uzumaki, m???t ninja tr??? t??m ki???m s??? c??ng nh???n t??? m???i ng?????i v?? ?????c m?? tr??? th??nh Hokage', N'24.jpg', CAST(62000.00 AS Decimal(18, 2)), N'TT', N'NXB05', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S025', N'Chi???c L?????c Ng??', N'Nguy???n Quang S??ng', CAST(N'1990-06-27' AS Date), 35, N'T??nh cha con trong qu?? kh??? v?? m???t c??u chuy???n ?????m ch???t ??i???n ???nh v??? t??i tr?? c???a c?? giao li??n ??? hi???n t???i', N'25.jpg', CAST(33000.00 AS Decimal(18, 2)), N'TD', N'NXB07', N'NN03')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S026', N'?? Long Vi???n', N'Yao-hsing', CAST(N'1940-05-22' AS Date), 96, N'Chuy???n k??? v??? 4 th???y tr?? t??i gi???i tu t???p v?? ngh??? v?? h?? phong ho??n v?? tr??n gian h???. C??c th???y tr?? vui nh???n s??? ??em ?????n nh???ng tr???n c?????i nghi??ng ng??? ', N'26.jpg', CAST(70000.00 AS Decimal(18, 2)), N'HK', N'NXB05', N'NN01')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S027', N'C??y Tre Tr??m ?????t', N'Truy???n d??n gian Vi???t Nam', CAST(N'1999-10-10' AS Date), 63, N'Truy????n mang la??i nh????ng ba??i ho??c nh??n v??n va?? y?? nghi??a v?? cu??ng s??u s????c, r??n da??y con ng??????i ta pha??i s????ng sao cho thi????n l????ng nh????t', N'27.jpg', CAST(64000.00 AS Decimal(18, 2)), N'HK', N'NXB06', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S028', N'365 Chuy???n K??? H??ng ????m', N'L??u H???ng H??', CAST(N'1940-05-12' AS Date), 55, N'Cu???n s??ch t???p h???p nh???ng truy???n ng??? ng??n, ?????ng tho???i ?????c s???c t??? x??a ?????n nay c???a nhi???u qu???c gia tr??n th??? gi???i', N'28.jpg', CAST(11000.00 AS Decimal(18, 2)), N'CT', N'NXB09', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S029', N'Th???n tho???i B???c ??u', N'Khuy???t Danh', CAST(N'2000-10-12' AS Date), 70, N'Sau nh???ng th??? gi???i h?? c???u tuy???t v???i trong nh???ng t??c ph???m tr?????c ????, Neil Gaiman, m???t trong nh???ng c??y b??t h???p d???n c???a th??? lo???i truy???n gi??? t?????ng', N'29.jpg', CAST(28000.00 AS Decimal(18, 2)), N'CT', N'NXB03', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S030', N'Truy???n c??? T??y T???ng', N'Eva Bednarova', CAST(N'1999-03-19' AS Date), 65, N'Cu???n s??ch v???i nhi???u ?????c gi???, ?????c bi???t l?? nh???ng b???n mu???n t??m hi???u v??? v??n h??a T??y T???ng.', N'30.jpg', CAST(99000.00 AS Decimal(18, 2)), N'CT', N'NXB07', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S031', N'Th???n Tho???i Hy L???p', N'Nguy???n V??n Kho???', CAST(N'1990-08-08' AS Date), 47, N'Nh???ng nh??n v???t, ??i???n t??ch trong ????y li??n t???c ???????c t??i sinh, hi???n di???n, truy???n ngu???n c???m h???ng t???i kh???p m???i n??i t??? tri???t h???c', N'31.jpg', CAST(37000.00 AS Decimal(18, 2)), N'CT', N'NXB10', N'NN02')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S032', N'Truy???n c??? ???-R???p', N'Contes Dorient', CAST(N'1980-12-19' AS Date), 60, N'Truy???n C??? ??? R???p mang nhi???u s???c m??u v??n h??a ph????ng ????ng, ????a ?????n cho c??c em thi???u nhi ', N'32.jpg', CAST(75000.00 AS Decimal(18, 2)), N'CT', N'NXB10', N'NN01')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTG], [NgayXB], [SoLuongTon], [MoTa], [AnhBia], [GiaSach], [MaTL], [MaNXB], [MaNN]) VALUES (N'S033', N'Ngh??n L??? M???t ????m', N'Nhi???u t??c gi???', CAST(N'1997-05-20' AS Date), 70, N'Chuy???n t??nh y??u gi???a L??ng L??ng Th???t v?? B??ch H???i. L??ng L??ng Th???t th???m y??u B??ch H???i m?? kh??ng d??m t??? t??nh.', N'33.jpg', CAST(25000.00 AS Decimal(18, 2)), N'CT', N'NXB08', N'NN02')
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
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG02', N'T??? H???u', N'Tp H???i An, t???nh Qu???ng Nam')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG03', N'Haruki Murakami', N'Tp Ashiya, T???nh Hytogo')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG04', N'Nguy???n Nh???t ??nh', N'B??nh Qu???, Th??ng B??nh, Qu???ng Nam')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG05', N'Nguy???n Du', N'Nghi Xu??n, H?? T??nh ')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG06', N'Kim L??n', N'T??n H???ng, T??? S??n, B???c Ninh')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG07', N'Jules Verne ', N'Tp Nantes, Ph??p')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG08', N'Dale Breckenridge Carnegie', N'Maryville, Missouri')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG09', N'Nguy???n Tu??n', N'H??ng B???c, Th?????ng ????nh, H?? N???i')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG10', N'T?? Ho??i', N'Ngh??a ????, C???u Gi???y, H?? N???i')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG11', N'E.B.White', N'Mount Vernon, New York')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG12', N'Huy C???n', N'X?? ??n Ph??, Huy???n V?? Quang, T???nh H?? T??nh')
GO
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi]) VALUES (N'TG13', N'Kim L??n', N'????ng Ng??n, Th??? X?? T??? S??n, T???nh B???c Ninh')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'CT', N'C??? T??ch')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'HK', N'H???i k??')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'PL', N'Phi??u L??u ')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TD', N'Truy???n d??i')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TN', N'Truy???n Ng???n')
GO
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TT', N'Truy???n Tranh')
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
/* c???p nh???t h??ng trong kho sau khi c???p nh???t ?????t h??ng */
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

/* c???p nh???t h??ng trong kho sau khi ?????t h??ng ho???c c???p nh???t */
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
/* c???p nh???t h??ng trong kho sau khi h???y ?????t h??ng */
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
