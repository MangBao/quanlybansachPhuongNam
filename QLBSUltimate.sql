create database QLBSPhuongNam
use QLBSPhuongNam

create table NhomNhanVien(
	IDNhom varchar(20) NOT NULL primary key,
	TenNhom nvarchar(50) NULL,
)

create table Quyen(
	IDQuyen varchar(50) NOT NULL primary key,
	TenQuyen nvarchar(50) NULL,
)

create table NhanVien(
	MaNV varchar(10) not null primary key,
	HoNV nvarchar(50) not null,
	TenNV nvarchar(20) not null,
	GioiTinh bit DEFAULT(1),
	DiaChi nvarchar(100) null, 
	SoDTNV varchar(20) null,
	AnhNV varchar(50),
	Email varchar(50) not null, 
	Matkhau varchar(50) not null,
	IDNhom varchar(20) null foreign key references NhomNhanVien(IDNhom)
	ON UPDATE CASCADE
	ON DELETE CASCADE
	)

create table DanhSachQuyen(
	IDNhom varchar(20) NOT NULL foreign key references NhomNhanVien(IDNhom)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	IDQuyen varchar(50) NOT NULL foreign key references Quyen(IDQuyen)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	MoTa nvarchar(50) NULL
	primary key(IDNhom,IDQuyen)
)

create table NgonNgu(
	MaNN varchar(10) not null primary key,
	TenNN nvarchar(100) not null
	)
create table TacGia(
	MaTG varchar(10) not null primary key,
	TenTG nvarchar(100) not null,
	DiaChi nvarchar(100) not null
	)

create table TheLoai(
	MaTL varchar(10) not null primary key,
	TenTL nvarchar(50) not null
	)

create table NhaXuatBan (
	MaNXB varchar(10) not null primary key,
	TenNXB nvarchar(50) not null,
	DiaChiNXB nvarchar(100) not null, 
	DienThoai varchar(20) null,		
	)


create table Sach (
	MaSach varchar(10) not null primary key,
	TenSach nvarchar(100) not null,
	TenTG nvarchar(100) not null,
	NgayXB date not null,
	SoLuongTon int not null,
	MoTa nvarchar(500) not null,
	AnhBia varchar(50) not null,
	GiaSach decimal(19,4) not null,
	MaTL varchar(10) not null foreign key references TheLoai(MaTL)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	MaNXB varchar(10) not null foreign key references NhaXuatBan(MaNXB)
	ON UPDATE CASCADE
	ON DELETE CASCADE,				
	MaNN varchar(10) not null  foreign key references NgonNgu(MaNN)
	ON UPDATE CASCADE
	ON DELETE CASCADE
	)

create table Sach_TG(
	MaSach varchar(10) not null,
	MaTG varchar(10) not null,
	VaiTro bit not null
	primary key(MaSach,MaTG),
	
	CONSTRAINT FK__Sach_TG__MaSach FOREIGN KEY(MaSach) REFERENCES Sach (MaSach)
	ON UPDATE CASCADE
	ON DELETE CASCADE,

	CONSTRAINT FK__Sach_TG__MaTG FOREIGN KEY(MaTG) REFERENCES TacGia (MaTG)
	ON UPDATE CASCADE
	ON DELETE CASCADE
)


create table HoaDon(
	MaHD varchar(10) not null primary key,
	TinhTrang int not null DEFAULT(1),
	NgayXuatKho date,
	NgayGiao date,
	TenKH nvarchar(20),
	DiaChiGiao nvarchar(100),
	SoDT varchar(20),
	MaNV varchar(10) not null foreign key references NhanVien(MaNV)
	ON UPDATE CASCADE
	ON DELETE CASCADE
)

create table ChiTietHD(
	MaHD varchar(10) not null,
	MaSach varchar(10) not null ,
	SoLuongSach int not null,
	GiaBan decimal(19,4) not null,
	primary key(MaHD,MaSach),

	CONSTRAINT FK__ChiTietHD__MaHD FOREIGN KEY(MaHD) REFERENCES HoaDon (MaHD)
	ON UPDATE CASCADE
	ON DELETE CASCADE,

	CONSTRAINT FK__ChiTietHD__MaSach FOREIGN KEY(MaSach) REFERENCES Sach (MaSach)
	ON UPDATE CASCADE
	ON DELETE CASCADE
	)

create table NhaCungCap (
	MaNCC varchar(10) not null primary key,
	TenNCC nvarchar(50) not null,
	DiaChiNCC nvarchar(100) not null, 
	SDTNCC varchar(20) not null,
	)

create table PhieuNhap(
	MaPN varchar(10) not null primary key,
	NgayNhap date not null,
	MaNCC varchar(10) not null foreign key references NhaCungCap(MaNCC)
	ON UPDATE CASCADE
	ON DELETE CASCADE
)

create table ChiTietPN(
	MaPN varchar(10) not null,
	MaSach varchar(10) not null,
	SoLuongNhap int not null,
	GiaNhap decimal(19,4) not null,
	primary key(MaPN,MaSach),
	CONSTRAINT FK__ChiTietPN__MaPN FOREIGN KEY(MaPN) REFERENCES PhieuNhap (MaPN)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	 CONSTRAINT FK__ChiTietPN__MaSach FOREIGN KEY(MaSach) REFERENCES Sach (MaSach)
	ON UPDATE CASCADE
	ON DELETE CASCADE
)

INSERT INTO TacGia VALUES
    ('TG01','Ernest Hemingway','Oak Park, Illinois, Chicago'),
    ('TG02',N'Tố Hữu',N'Tp Hội An, tỉnh Quảng Nam'),
    ('TG03','Haruki Murakami',N'Tp Ashiya, Tỉnh Hytogo'),
    ('TG04',N'Nguyễn Nhật Ánh',N'Bình Quế, Thăng Bình, Quảng Nam'),
    ('TG05',N'Nguyễn Du',N'Nghi Xuân, Hà Tĩnh '),
    ('TG06',N'Kim Lân',N'Tân Hồng, Từ Sơn, Bắc Ninh'),
    ('TG07','Jules Verne ',N'Tp Nantes, Pháp'),
    ('TG08','Dale Breckenridge Carnegie','Maryville, Missouri'),
    ('TG09',N'Nguyễn Tuân',N'Hàng Bạc, Thượng Đình, Hà Nội'),
    ('TG10',N'Tô Hoài',N'Nghĩa Đô, Cầu Giấy, Hà Nội'),
    ('TG11',N'E.B.White', 'Mount Vernon, New York'),	
    ('TG12',N'Huy Cận',N'Xã Ân Phú, Huyện Vũ Quang, Tỉnh Hà Tĩnh'),	
    ('TG13',N'Kim Lân',N'Đông Ngàn, Thị Xã Từ Sơn, Tỉnh Bắc Ninh')

INSERT INTO NgonNgu VALUES
	('NN01',N'Tiếng Pháp'),
	('NN02',N'Tiếng Anh'),
	('NN03',N'Tiếng Việt')

INSERT INTO TheLoai VALUES 
    ('PL',N'Phiêu Lưu '),
    ('TN',N'Truyện Ngắn'),
    ('TT',N'Truyện Tranh'),
    ('CT',N'Cổ Tích'),
    ('HK',N'Hồi ký'),
    ('TD',N'Truyện dài')

INSERT INTO NhaXuatBan VALUES 
	('NXB01',N'NXB Giáo Dục',N'5A Trần Hưng Đạo,Q1,TPHCM','0957357287'),
	('NXB02',N'Giao Thông Vận Tải',N'459 Trưng Vương, Hà Nội','0295496352'),
	('NXB03',N'NXB Kim Đồng',N'967 Lê Hồng Phong,Q10,TPHCM','0967843568'),
	('NXB04',N'Lịch Sử Văn Minh',N'125 Trần Bình Trọng,TPHCM','0867354085'),
	('NXB05',N'Phương Nam Book',N'34 Bà Rịa, Vũng Tàu','0888527752'),
	('NXB06',N'NXB Văn Học',N'09 Nguyễn Thái Học,Q1,TPHCM','0989835276'),
	('NXB07',N'NXB Nhã Nam',N'631 Võ Văn Tần,Đà Nẵng','0784735276'),
	('NXB08',N'NXB Trẻ',N'161B Lý Chính Thắng, Phường 7, Thành phố Hồ Chí Minh.','02839316289'),
	('NXB09',N'NXB Tổng hợp thành phố HCM',N'62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP.HCM.','02838225340'),
	('NXB10',N'NXB chính trị quốc gia sự thật',N'Số 6/86 Duy Tân, Cầu Giấy, Hà Nội.','028049221')



INSERT INTO Sach VALUES
    ('S001',N'Tarzan Trở Lại Rừng Già','Edgar Rice Burroughs','5/1/1940',100,N'Trên đường đi công tác huân tước Clayton và vợ - Alice bị bỏ lại trên đảo hoang.','1.jpg','45000','PL','NXB04','NN02'),
    ('S002',N'Viễn Cổ Hành',N'Thi Lạc','10/02/2000',50,N'Lam Nguyệt không ngờ chỉ ngủ một giấc đã đem mình đến thời không khác','2.jpg','54000','PL','NXB03','NN03'),
    ('S003',N'Ấn Tượng Sai Lầm','Jeffrey Archer','1/19/1999',10,N'Với cách kể chuyện tài hoa, Jeffrey Archer giống như đang chơi trò mèo vờn chuột với độc giả. Siêu phẩm của ông','3.jpg','32000','PL','NXB07','NN02'),
    ('S004',N'Những Cuộc Phiêu Lưu Của Tom Shawyer',N'Mark Twain','06/18/1990',58,N'Với bản tính hiếu động, Tom Sawyer không lúc nào chịu yên. ','4.jpg','65000','TD','NXB02','NN01'),
    ('S005',N'Những cuộc phiêu lưu của Huckleberry Finn',N'Nguyễn Du','02/19/1920',70,N'Những cuộc phiêu lưu cùng Tom Sawyer, Huck Finn được bà quả phụ Douglas đón về','5.jpg','56000','PL','NXB08','NN03'),
    ('S006',N'Nguồn Cội',N'Dan Brown','5/23/1998',15,N'Edmond Kirsch là một tỷ phú bốn mươi tuổi, một nhà tiên tri. Những phát minh kỹ thuật cao','6.jpg','43000','PL','NXB03','NN03'),
    ('S007',N'Cuộc phiêu lưu của Nam tước','Rudolph Erich Raspe ','06/08/1990',25,N' Nó kể những sự tích kỳ lạ khó có ai trên đời có thể kiểm chứng, thế nhưng lại khiến cho tên tuổi ','7.jpg','87000','HK','NXB02','NN02'),
    ('S008',N'Hai Vạn Dặm Dưới Đáy Biển','Jules Verne','05/22/1940',30,N'Xuất hiện ở biển khơi, đoàn thám hiểm của giáo sư Pierre Aronnax bất ngờ bị“con cá" khổng lồ đó nuốt vào bụng','8.jpg','32000','HK','NXB06','NN01'),
    ('S009',N'Người Cá',N'Alexander Romanovich Belyaev','01/10/2000',60,N'Dân làng ven vịnh Plata xôn xao về chuyện con quỷ biển xuất hiện, ai nấy đều sợ đến mức không dám ra khơi.','9.jpg','44000','HK','NXB01','NN02'),
    ('S010',N'DƯỚI MÁI NGÓI ĐƠN SƠ',N'Thiên Như Ngọc','12/19/1979',80,N'Hoành môn chi hạ” là câu đầu tiên trong Kinh Thi phần Quốc phong, Trần phong, dịch nghĩa đen là bắc gỗ ngang làm cổng nhà.','10.jpg','98000','PL','NXB01','NN01'),
    ('S011',N'Lấy Chồng Bạc Tỷ',N'Mộc Thất Thất','04/08/1990',36,N'Cuộc sống luôn có những điều bất ngờ xảy ra ví dụ như Giang Nhung mong muốn có cuốc sống bình thường','11.jpg','57000','TN','NXB04','NN03'),
    ('S012',N'Đẹp Trai Là Số 1',N'Lục Mang Tinh','11/09/1920',40,N'Tín ngưỡng lúc đầu của Tô Căng Bắc chính là: giày cao gót và tiểu thịt tươi không thể phụ.','12.jpg','69000','TN','NXB09','NN03'),
    ('S013',N'Từ Bi Khúc',N'Võ Anh Thơ','06/23/1980',98,N' Tô Khiết và Trình Khâm, lần này là nói về chuyện tình của con trai hai người là Trình Diễn. ','13.jpg','38000','TN','NXB02','NN03'),
    ('S014',N'Xuân Sắc Tràn Đầy',N'Mạch Mầm ','06/07/1870',70,N'Chắc có lẽ câu chuyện này là một ngoại lệ cũng  bởi lẽ nam chính lại là người thứ ba trong cuộc tình của nữ chính với người khác.','14.jpg','15000','HK','NXB02','NN03'),
    ('S015',N'Xin Chào, Người Thừa Kế',N'Công Tử Diễn','05/12/1940',63,N'Anh thân là người kế thừa tập đoàn Đế Hào, tính cách quyết đoán lãnh huyết nhưng đối với cô lại là yêu chiều đến tận xương tủy.','15.jpg','77000','TN','NXB04','NN03'),
    ('S016',N'Ép Khô Nam Phụ',N'Khanh Uyển Uyển Uyển','09/10/2002',74,N'Có thể nói trong mắt của mọi người thì Mộc Khanh Khanh là một cô nàng cơ trí dũng cảm thuần khiết đang ở “Tổ thanh thủy” ','16.jpg','66000','TN','NXB01','NN03'),
    ('S017',N'Truyện Tranh Doremon','Fujiko F Fujio','01/29/1998',36,N'Bộ truyện tranh viễn tưởng nổi tiếng của Nhật Bản- truyện tranh Doremon ngay từ khi mới ra đời đã nhận được sự ủng hộ nhiệt tình ','17.jpg','54000','TT','NXB01','NN02'),
    ('S018',N'Đảo Hải Tặc',N'Eiichiro Oda','02/12/1960',50,N'Hoạt hình Nhật Bản dựa trên loạt manga cùng tên của tác giả Eiichiro Oda','18.jpg','63000','TT','NXB03','NN02'),
    ('S019',N'Thám Tử Lừng Danh Conan','Gosho Aoyama','11/09/1925',60,N'Hoạt hình chuyển thể từ truyện tranh hấp dẫn nhất: Thám Tử Lừng Danh Conan của tác giả Aoyama Gosho. Phim Conan kể về thần đồng 17 tuổi ...','19.jpg','53000','TT','NXB06','NN03'),
    ('S020',N'Dấu Ấn Rồng Thiêng','Sanjo Riku','05/22/1978',90,N'Câu chuyện kể rằng, sau khi ma vương Hadlar bị đánh bại, những con quái vật được giải thoát khỏi hắn bắt đầu dời đến hòn đảo Delmurin','20.jpg','92000','TD','NXB05','NN02'),
    ('S021',N'Truyện Tranh Tây Du',N'Đặng Chí Huy ','06/27/1970',15,N'Bạch Lang và Tiểu Vũ, giữ bí mật bôn ba, từ đây bắt đầu hành trình gian nan trên đường thực hiện sứ mạng của mình...','21.jpg','79000','TT','NXB04','NN03'),
    ('S022',N'Người Trong Giang Hồ',N'Ngưu Lão','08/18/1980',20,N'Những ngày trước khi gia nhập Hội Tam Hoàng, thiếu niên Trần Hạo Nam chật vật với mối bất hòa trong gia đình','22.jpg','43000','TT','NXB03','NN03'),
    ('S023',N'7 Viên Ngọc Rồng',N'Akira Toriyama','11/09/1990',60,N'Truyện tranh cùng tên của tác giả Toriyama Akira nổi tiếng tại Nhật Bản và nhiều nước trên thế giới','23.jpg','36000','TD','NXB09','NN02'),
    ('S024',N'Naruto',N'Kishimoto Masashi','05/22/1998',80,N'Câu chuyện về Naruto Uzumaki, một ninja trẻ tìm kiếm sự công nhận từ mọi người và ước mơ trở thành Hokage','24.jpg','62000','TT','NXB05','NN02'),
    ('S025',N'Chiếc Lược Ngà',N'Nguyễn Quang Sáng','06/27/1990',35,N'Tình cha con trong quá khứ và một câu chuyện đậm chất điện ảnh về tài trí của cô giao liên ở hiện tại','25.jpg','33000','TD','NXB07','NN03'),
    ('S026',N'Ô Long Viện','Yao-hsing','05/22/1940',96,N'Chuyện kể về 4 thầy trò tài giỏi tu tập võ nghệ và hô phong hoán vũ trên gian hồ. Các thầy trò vui nhộn sẽ đem đến những trận cười nghiêng ngả ','26.jpg','70000','HK','NXB05','NN01'),
    ('S027',N'Cây Tre Trăm Đốt',N'Truyện dân gian Việt Nam','10/10/1999',63,N'Truyện mang lại những bài học nhân văn và ý nghĩa vô cùng sâu sắc, răn dạy con người ta phải sống sao cho thiện lương nhất','27.jpg','64000','HK','NXB06','NN02'),
    ('S028',N'365 Chuyện Kể Hàng Đêm',N'Lưu Hồng Hà','05/12/1940',55,N'Cuốn sách tập hợp những truyện ngụ ngôn, đồng thoại đặc sắc từ xưa đến nay của nhiều quốc gia trên thế giới','28.jpg','11000','CT','NXB09','NN02'),
    ('S029',N'Thần thoại Bắc Âu',N'Khuyết Danh','10/12/2000',70,N'Sau những thế giới hư cấu tuyệt vời trong những tác phẩm trước đó, Neil Gaiman, một trong những cây bút hấp dẫn của thể loại truyện giả tưởng','29.jpg','28000','CT','NXB03','NN02'),
    ('S030',N'Truyện cổ Tây Tạng','Eva Bednarova','03/19/1999',65,N'Cuốn sách với nhiều độc giả, đặc biệt là những bạn muốn tìm hiểu về văn hóa Tây Tạng.','30.jpg','99000','CT','NXB07','NN02'),
    ('S031',N'Thần Thoại Hy Lạp',N'Nguyễn Văn Khoả','08/08/1990',47,N'Những nhân vật, điển tích trong đây liên tục được tái sinh, hiện diện, truyền nguồn cảm hứng tới khắp mọi nơi từ triết học','31.jpg','37000','CT','NXB10','NN02'),
    ('S032',N'Truyện cổ Ả-Rập',N'Contes Dorient','12/19/1980',60,N'Truyện Cổ Ả Rập mang nhiều sắc màu văn hóa phương Đông, đưa đến cho các em thiếu nhi ','32.jpg','75000','CT','NXB10','NN01'),
    ('S033',N'Nghìn Lẻ Một Đêm',N'Nhiều tác giả','05/20/1997',70,N'Chuyện tình yêu giữa Lăng Lăng Thất và Bách Hải. Lăng Lăng Thất thầm yêu Bách Hải mà không dám tỏ tình.','33.jpg','25000','CT','NXB08','NN02')
    

INSERT INTO Sach_TG VALUES
	('S001','TG01',1),
	('S001','TG07',0),
	('S002','TG02',1),
	('S002','TG05',0),
	('S002','TG03',0),
	('S003','TG04',1),
	('S003','TG06',0),
	('S004','TG01',1),
	('S004','TG08',0),
	('S005','TG02',0),
	('S005','TG04',1),
	('S006','TG06',1),
	('S007','TG03',1),
	('S007','TG01',0),
	('S008','TG07',1),
	('S009','TG08',1),
	('S009','TG05',0),
	('S010','TG09',1),
	('S010','TG03',0),
	('S011','TG11',1),
	('S011','TG04',0),
	('S012','TG09',1),
	('S013','TG12',1),
	('S014','TG07',1),
	('S015','TG01',0),
	('S015','TG04',1),
	('S016','TG07',1),
	('S017','TG04',1),
	('S018','TG02',1),
	('S019','TG03',1),
	('S020','TG13',1),
	('S021','TG01',1),
	('S022','TG06',1),
	('S023','TG07',1),
	('S024','TG05',1),
	('S025','TG02',1),
	('S026','TG08',1),
	('S027','TG04',1),
	('S028','TG07',1),
	('S029','TG10',1),
	('S030','TG06',1)


INSERT INTO NhomNhanVien VALUES 
('ADMIN',N'Quản trị viên'),
('QUANLYKHO',N'Quản lý kho'),
('QUANLYHOADON',N'Quản lý hóa đơn và phiếu nhập')

INSERT INTO Quyen VALUES 
('QUANLYNHANVIEN',N'Quản lý nhân viên'),
('PHANQUYEN',N'Phân quyền'),
('QUANLYNHOMNHANVIEN',N'Xem danh sách quyền'),
('QUANLYHOADON',N'Quản lý hóa đơn'),
('QUANLYPHIEUNHAP',N'Quản lý phiếu nhập'),
('QUANLYBAOCAO',N'Quản lý báo cáo'),
('QUANLYKHO',N'Quản lý kho')

INSERT INTO NhanVien VALUES 
('NV01', N'Nguyễn Văn', N'Trí',1, N'731 Trần Hưng Đạo, quận 1, TP HCM', '0384623682','AvtTri.jpg', 'tri@gmail.com', 'e9612eff75820e2bba7e1c2675c41604', 'ADMIN'), -- mk: VanTri1710
('NV02', N'Lê Minh', N'Long',1, N'638 Trần Bình Trọng, TP HCM', '02439434730','AvtLong.jpg', 'long@gmail.com', '692cc7672b70521c2ee2da942d6c6b00', 'QUANLYKHO'), -- mk: MinhLong0106
('NV03', N'Mang', N'Bảo',1, '853 Mai Thị Lưu, quận 5, TP HCM', '02439434730','AvtBao.jpg', 'bao@gmail.com', 'b9816c0e86658902ae53e17c6b3efc6b', 'QUANLYHOADON') -- mk: MangBao1301

INSERT INTO DanhSachQuyen VALUES 
('QUANLYKHO','QUANLYKHO',NULL),
('QUANLYHOADON','QUANLYHOADON',NULL),
('QUANLYHOADON','QUANLYPHIEUNHAP',NULL),
('QUANLYHOADON','QUANLYBAOCAO',NULL)

INSERT INTO HoaDon VALUES
	('HD001',1,'01/02/2020','01/06/2020',N'Nguyễn Hồng Quang', N'734 Lê Văn Lượng, Xã Nhơn Đức, Huyện Nhà Bè, TPHCM', '0316833287','NV01'),
	('HD002',1,'12/02/2020','12/04/2020',N'Nguyễn Hoài Lâm', N'156 Phan Chu Trinh,TPHCM', '0361472145','NV01'),
	('HD003',3,'02/22/2020','02/28/2020',N'Hoàng Thị Như Quỳnh', N'93 Nguyễn Trãi,Phú Yên', '0782377278','NV02'),
	('HD004',1,'12/03/2020','12/07/2020',N'Lê Thanh Thảo', N'109 Hùng Vương, Hà Nội', '0783876837','NV01'),
	('HD005',1,'07/05/2020','07/07/2020',N'Đặng Thị Thảo Vy', N'78 Lê Hồng Phong, Nha Trang, KH', '0983623678','NV03'),
	('HD006',1,'01/02/2020','01/9/2020',N'Nguyễn Thàn Nam', N'36 Nhị Hà, Nha Trang, KH', '0866465293','NV02'),
	('HD007',2,'12/05/2020','12/08/2020',N'Trần Hoàng Yến', N'11 Khu bãi sỏi, Sơn Tây, Hà Nội', '0979218617','NV02'),
	('HD008',2,'07/05/2020','07/11/2020', N'Phan Thị Hồng Phúc', N'22 Phan Văn Hân, Phường 12, Bình Thạnh, TPHCM','0783876837','NV03'),
	('HD009',1,'06/21/2020','06/23/2020',N'Nguyễn Ngọc Dũng', N'138 Nam Kỳ Khởi Nghĩa, Bến Nghé, Q1, TPHCM', '0783876837','NV01'),
	('HD010',1,'04/02/2020','04/12/2020',N'Vũ Thị Thương', N'Thôn Xuân An, Xã Mỹ An, Huyện Lục Ngạn, Tỉnh Bắc Giang', '0783876837','NV03'),
	('HD011',2,'12/03/2020','12/08/2020', N'Nguyễn Văn Toán', N'44 Tái Thiết, Phường 11, Quận Tân Bình, TPHCM', '0316836834','NV03'),
	('HD012',1,'09/04/2020','09/07/2020',N'Nguyễn Hồng Quang', N'734 Lê Văn Lượng, Xã Nhơn Đức, Huyện Nhà Bè, TPHCM', '0316833287','NV01'),
	('HD013',1,'11/05/2020','11/11/2020',N'La Thị Hoài Hoa', '731 Tran Hung Dao, ql1, TPHCM', '0384623682','NV03'),
	('HD014',3,'10/21/2020','10/22/2020',N'Trần An Nhiên', N'782 Ngô Quyền,Q6,TPHCM', '0898362886','NV01'),
	('HD015',1,'08/18/2020','08/20/2020',N'Trần An Bình', N'782 Ngô Quyền,Q6,TPHCM', '0898362886','NV02')

INSERT INTO ChiTietHD VALUES
	('HD001','S007',10,20000),
	('HD002','S006',5,34000),
	('HD003','S005',15,15000),
	('HD004','S004',7,35000),
	('HD005','S001',40,45000),
	('HD006','S028',3,27000),
	('HD007','S003',25,25000),
	('HD008','S005',9,25000),
	('HD009','S008',28,95000),
	('HD010','S012',34,12000),
	('HD011','S022',2,14000),
	('HD012','S026',1,65000),
	('HD013','S017',6,11000),
	('HD014','S014',9,19000),
	('HD015','S009',1,87000)



INSERT INTO NhaCungCap VALUES 
	('NCC01',N'Cty TNHH Đỗ Gia Phát',N'Cầu Giấy, Hà Nội','0984867231'),
	('NCC02',N'Trung Ương Đoàn TNCS HCM',N'33 Hoàng Văn Thụ, Q9, TPHCM','0994863733'),
	('NCC03',N'NXB Giao Thông Vận Tải',N'823 Đinh Tiên Hoàng, Q2,TPHCM','0965275285'),
	('NCC04',N'Bộ Giáo Dục và Đào Tạo',N'978 Quang Trung, Hà Nội','0637572876'),
	('NCC05',N'NXB Tổng Hợp TPHCM',N'864 Nguyễn Thị Minh Khai,Q1,TPHCM','0836345634'),
	('NCC06',N'Đại Học Quốc Gia Hà Nội',N'873 Duy Tân,Cầu Giấy,Hà Nội','0375834678'),
	('NCC07',N'Hội Nhà Văn',N'98 Trần Hưng Đạo,Hà Nội','0936478432'),
	('NCC08',N'Đại học Bách Khoa',N'90 Trần Hưng Đạo,Hà Nội','0936478432'),
	('NCC09',N'Đại học Khoa học Tự Nhiên',N'98 Dốc Cô Nui, TPHCM','0936478432'),
	('NCC10',N'Đại học Nông Lâm',N'Trần Duy Hưng, Hà Nội','0936478432')

insert into PhieuNhap VALUES 
	('PN01', '02/11/2019','NCC01'),
	('PN02', '12/08/2019','NCC02'),
	('PN03', '03/05/2019','NCC03'),
	('PN04', '04/09/2019','NCC04'),
	('PN05', '11/01/2019','NCC05'),
	('PN06', '05/05/2019','NCC06'),
	('PN07', '11/20/2019','NCC07'),
	('PN08', '01/13/2019','NCC10'),
	('PN09', '02/18/2019','NCC08'),
	('PN10', '03/19/2019','NCC03'),
	('PN11', '04/18/2019','NCC04'),
	('PN12', '05/10/2019','NCC09'),
	('PN13', '06/08/2019','NCC06'),
	('PN14', '07/01/2019','NCC02'),
	('PN15', '08/20/2019','NCC03')

insert into ChiTietPN VALUES 
	('PN01','S001',200,15000),
    ('PN02','S002',175,25000),
   	('PN03','S003',155,12000),
   	('PN04','S004',130,30000),
   	('PN05','S005',180,40000),
   	('PN06','S006',190,17000),
   	('PN07','S007',174,19000),
	('PN08','S008',160,19500),
	('PN09','S009',140,18000),
	('PN10','S010',180,18500),
	('PN11','S011',164,17500),
	('PN12','S012',179,17500),
	('PN13','S013',160,11000),
	('PN14','S014',170,28000),
	('PN15','S015',188,20000)

/*tạo view để xem danh sách đơn đăt hàng, xem báo cáo*/
CREATE VIEW v_Don_Dat_hang 
AS
SELECT HoaDon.MaHD, Sach.TenSach,HoaDon.TenKH, HoaDon.DiaChiGiao, 
HoaDon.SoDT, ChiTietHD.GiaBan, ChiTietHD.SoLuongSach, HoaDon.NgayXuatKho
FROM     ChiTietHD INNER JOIN
         HoaDon ON ChiTietHD.MaHD = HoaDon.MaHD INNER JOIN
         Sach ON ChiTietHD.MaSach = Sach.MaSach;

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
/* cập nhật hàng trong kho sau khi hủy đặt hàng */
create TRIGGER trg_HuyDatHang ON ChiTietHD FOR DELETE AS 
BEGIN
	UPDATE Sach
	SET SoLuongTon = SoLuongTon + (SELECT SoLuongSach FROM deleted WHERE MaSach = Sach.MaSach)
	FROM Sach 
	JOIN deleted ON Sach.MaSach = deleted.MaSach
END
GO