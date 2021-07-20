use master
Drop Database Shop
GO
create database Shop
GO
use Shop
GO
-------------------------------------------------
----------------------------------------------
CREATE TABLE KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTen nVarchar(50) NOT NULL,
	Taikhoan Varchar(50) UNIQUE,
	Matkhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	DiachiKH nVarchar(200),
	DienthoaiKH Varchar(50),	
	Ngaysinh DATETIME
	CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH)
)
GO

Create Table DANHMUC
(
	MaDM int Identity(1,1),
	TenDanhMuc nvarchar(50) NOT NULL,
	CONSTRAINT PK_DanhMuc PRIMARY KEY(MaDM)
)
GO
Create Table LOAI
(
	MaL int Identity(1,1),
	MaDM int,
	TenLoai nvarchar(50) NOT NULL,
	CONSTRAINT PK_Loai PRIMARY KEY(MaL),
	CONSTRAINT FK_DanhMuc FOREIGN KEY(MaDM) REFERENCES DANHMUC(MaDM),
)
GO

Create Table NHACUNGCAP
(
	MaNCC int identity(1,1),
	TenNCC nvarchar(50) NOT NULL,
	Diachi NVARCHAR(200),
	DienThoai VARCHAR(50),
	CONSTRAINT PK_NhaCungCap PRIMARY KEY(MaNCC)
)
GO

CREATE TABLE SANPHAM
(
	MaSP INT IDENTITY(1,1),
	TenSP NVARCHAR(100) NOT NULL,
	Giaban Decimal(18,0) CHECK (Giaban>=0),
	Mota NVarchar(Max),
	Anhbia VARCHAR(50),
	Ngaycapnhat DATETIME,
	Soluongton INT,
	MaL INT,
	MaNCC INT,
	CONSTRAINT PK_SanPham PRIMARY KEY(MaSP),
	CONSTRAINT FK_Loai FOREIGN KEY(MaL) REFERENCES LOAI(MaL),
	CONSTRAINT FK_NhaCungCap FOREIGN KEY(MaNCC) REFERENCES NHACUNGCAP(MANCC)
)
GO

CREATE TABLE DONDATHANG
(
	MaDonHang INT IDENTITY(1,1),
	Dathanhtoan bit,
	Tinhtranggiaohang  bit,
	Ngaydat Datetime,
	Ngaygiao Datetime,	
	MaKH INT,
	Ghichu nvarchar(500),
	CONSTRAINT FK_Khachhang FOREIGN KEY(MaKH) REFERENCES Khachhang(MaKH),
	CONSTRAINT PK_DonDatHang PRIMARY KEY(MaDonHang)
)
GO

CREATE TABLE CHITIETDONTHANG
(
	MaDonHang INT,
	MaSP INT,
	Soluong Int Check(Soluong>0),
	Dongia Decimal(18,0) Check(Dongia>=0),	
	CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDonHang,MaSP),
	CONSTRAINT FK_DonHang FOREIGN KEY(MaDonHang) REFERENCES DONDATHANG(MaDonHang),
	CONSTRAINT FK_SanPham FOREIGN KEY(MaSP) REFERENCES SANPHAM(MaSP)
)
GO

CREATE TABLE ADMIN
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	HoTen nvarchar(50)
)
GO
INSERT INTO ADMIN(UserAdmin,PassAdmin,HoTen) VALUES ('admin1','8765247',N'Nguyễn Minh Hùng')
INSERT INTO ADMIN(UserAdmin,PassAdmin,HoTen) VALUES ('admin2','123456',N'Bùi Duy Đạt')
INSERT INTO ADMIN(UserAdmin,PassAdmin,HoTen) VALUES ('admin3','456789',N'Nguyễn Hà Minh Khang')
INSERT INTO ADMIN(UserAdmin,PassAdmin,HoTen) VALUES ('admin4','123789',N'Trương Hữu Hậu')

INSERT DANHMUC(TenDanhMuc) VALUES (N'Thức ăn cho mèo')
INSERT DANHMUC(TenDanhMuc) VALUES (N'Thức ăn cho chó')
INSERT DANHMUC(TenDanhMuc) VALUES (N'Thức ăn cho thú cưng khác')
INSERT DANHMUC(TenDanhMuc) VALUES (N'Chăm sóc thú cưng')
INSERT DANHMUC(TenDanhMuc) VALUES (N'Phụ kiện chăm sóc')
INSERT DANHMUC(TenDanhMuc) VALUES (N'Phụ kiện khác')

INSERT LOAI(MaDM,TenLoai) VALUES(1,N'Thức ăn khô')
INSERT LOAI(MaDM,TenLoai) VALUES(1,N'Thức ăn ướt')
INSERT LOAI(MaDM,TenLoai) VALUES(1,N'Thức ăn kiêng')
INSERT LOAI(MaDM,TenLoai) VALUES(1,N'Thức ăn lạnh')
INSERT LOAI(MaDM,TenLoai) VALUES(1,N'Sữa dinh dưỡng')
INSERT LOAI(MaDM,TenLoai) VALUES(2,N'Thức ăn khô')
INSERT LOAI(MaDM,TenLoai) VALUES(2,N'Snack')
INSERT LOAI(MaDM,TenLoai) VALUES(2,N'Kẹo sạch răng')
INSERT LOAI(MaDM,TenLoai) VALUES(2,N'Kẹo xương chó')
INSERT LOAI(MaDM,TenLoai) VALUES(2,N'Sửa dinh dưỡng')
INSERT LOAI(MaDM,TenLoai) VALUES(2,N'Thịt que cho chó')
INSERT LOAI(MaDM,TenLoai) VALUES(3,N'Cá')
INSERT LOAI(MaDM,TenLoai) VALUES(3,N'Chim')
INSERT LOAI(MaDM,TenLoai) VALUES(3,N'Bò sát')
INSERT LOAI(MaDM,TenLoai) VALUES(3,N'Các loại thức ăn khác')
INSERT LOAI(MaDM,TenLoai) VALUES(4,N'Trị ve')
INSERT LOAI(MaDM,TenLoai) VALUES(4,N'Thuốc xịt')
INSERT LOAI(MaDM,TenLoai) VALUES(4,N'Thuốc uống')
INSERT LOAI(MaDM,TenLoai) VALUES(5,N'Bát ăn & uống')
INSERT LOAI(MaDM,TenLoai) VALUES(5,N'Vòi nước uống')
INSERT LOAI(MaDM,TenLoai) VALUES(5,N'Máy thức ăn tự động')
INSERT LOAI(MaDM,TenLoai) VALUES(5,N'Thảm lót')
INSERT LOAI(MaDM,TenLoai) VALUES(5,N'Bồn & Cát cho chó mèo')
INSERT LOAI(MaDM,TenLoai) VALUES(5,N'Đồ chơi cho thú cưng')
INSERT LOAI(MaDM,TenLoai) VALUES(5,N'Máy cắt tỉa lông chó mèo')
INSERT LOAI(MaDM,TenLoai) VALUES(5,N'Dụng cụ vệ sinh')
INSERT LOAI(MaDM,TenLoai) VALUES(5,N'Tã cho chó mèo')
INSERT LOAI(MaDM,TenLoai) VALUES(6,N'Quần áo')
INSERT LOAI(MaDM,TenLoai) VALUES(6,N'Phụ kiện đi xe hơi')
INSERT LOAI(MaDM,TenLoai) VALUES(6,N'Túi vận chuyển')
INSERT LOAI(MaDM,TenLoai) VALUES(6,N'Balo')
INSERT LOAI(MaDM,TenLoai) VALUES(6,N'Lồng vận chuyển chó & mèo')
INSERT LOAI(MaDM,TenLoai) VALUES(6,N'Vòng cổ, dây dắt')
INSERT LOAI(MaDM,TenLoai) VALUES(6,N'Rọ mõm')
INSERT LOAI(MaDM,TenLoai) VALUES(6,N'Đai yếm')
INSERT LOAI(MaDM,TenLoai) VALUES(6,N'Thẻ tên')
INSERT LOAI(MaDM,TenLoai) VALUES(6,N'Thiết bị định vị')


INSERT NHACUNGCAP(TenNCC,Diachi,DienThoai) VALUES(N'Perfect Companion Việt Nam', N'Tầng 3, Số 5 Đồng Nai, P.2, Q.Tân Bình, TP.Hồ Chí Minh',N'028 3844 0784')
INSERT NHACUNGCAP(TenNCC,Diachi,DienThoai) VALUES(N'Mars Incorporated',N'Elm Street McLean, Virginia, Hoa Kỳ',N'6885')
INSERT NHACUNGCAP(TenNCC,Diachi,DienThoai) VALUES(N'Deahan Feed Co,.Ltd',N'13, Bukseongpo-gil, Jung-gu, Incheon, Korea',N' 82-32-770-1100 ~ 2')
INSERT NHACUNGCAP(TenNCC,Diachi,DienThoai) VALUES(N'cityzoo VN',N'146D4 Nguyễn Văn Hưởng, Thảo Điền, Quận 2, Thành phố Hồ Chí Minh',N'0283512793')
INSERT NHACUNGCAP(TenNCC,Diachi,DienThoai) VALUES(N'Thương hiệu Pedigree',N'Thái Lan',N'chưa cập nhật')
INSERT NHACUNGCAP(TenNCC,Diachi,DienThoai) VALUES(N'CAT S EYE KITTEN & CAT',N'Hàn Quốc',N'chưa cập nhật')
INSERT NHACUNGCAP(TenNCC,Diachi,DienThoai) VALUES(N'PETMART VIET NAM COMPANY LIMITED',N'Tầng 4, Tòa nhà HUD3 Tower,Số 121–123,đườngTô Hiệu,Phường Nguyễn Trãi,Quận Hà Đông,Tp.Hà Nội',N'028 7106 9906')

INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Hạt Royal Canin Kitten cho mèo - Túi chiết 1kg',165000,N'Thức ăn cho mèo con ROYAL CANIN Kitten hỗ trợ sức khỏe của mèo con bằng việc cung cấp các chất dinh dưỡng chính xác dựa trên nghiên cứu của các nhà khoa học từ ROYAL CANIN. Trong giai đoạn tăng trưởng, hệ thống tiêu hóa của mèo con chưa phát triển đầy đủ, chính vì vậy ROYAL CANIN Kitten thúc đẩy sự cân bằng hệ vi sinh đường ruột, hỗ trợ sự phát triển khỏe mạnh.
',N'/assets/images/sanpham/img (1).jpg','2021-06-26',10,1,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'COMBO 4 loại thức ăn hạt cho mèo (Whiskas, Minino, Minino Yum, Hello Cat)',109000,N'ACombo gồm 4 loại thức ăn khác nhau dành cho mèo. Đảm bảo cân bằng dinh dưỡng, giúp cải thiện sức khỏe toàn diện cho mèo cưng mỗi ngày 
A',N'/assets/images/sanpham/img (2).jpg','2021-06-26',10,1,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Pate Wanpy Happy 100 Thơm Ngon Cho Mèo (Lon 95g)',19000,N'Pate Wanpy Happy 100 Lon 95g Cho Mèo - dinh dưỡng - nhiều mùi vị ngon, bổ, rẻ đang được bán bởi shop đã được chứng thực nên bạn hoàn toàn co thể an tâm khi mua hàng mà không lo mất tất cả. Hiện đã có 26 sản phẩm được bán ra nên bạn hay nhanh chân lên để chọn lấy sản phẩm xịn nhất nhưng phù hợp với túi tiền, ngoại hình của mình nhất.
',N'/assets/images/sanpham/img (3).jpg','2021-06-26',10,2,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'[Combo 6] Pate Whiskas Cho Mèo Con 85g',67000,N'Pate Whiskas Vị Cá Ngừ - Cá Thu 85g Cho Mèo Con là thức ăn dạng Pate đóng gói vị cá ngừ cho mèo, thơm ngon bổ dưỡng, nhập khẩu chính hãng từ Thái. Pate Whiskas Vị Cá Ngừ - Cá Thu 85g Cho Mèo Con cung cấp dinh dưỡng hoàn chỉnh cho mèo nhỏ của bạn, được phát triển độc quyền cho nhu cầu năng lượng và dinh dưỡng cao hơn của mèo con.
',N'/assets/images/sanpham/img (4).jpg','2021-06-26',10,2,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'10 Gói Súp thưởng Pet Snack món ăn ưa thích của các chú mèo',29000,N'SÚP THƯỞNG DINH DƯỠNG PET SNACK 15g/ thanh ☀Cung cấp dinh dưỡng, kích thích các bé ăn ngon miệng hơn ☀️Siêu vỗ béo cho mèo mọi lứa tuổi ☀3 Hương vị: Ức Gà, Cá hồi, Cá ngừ ☀Date: 24 tháng tính từ ngày sản xuất, ngày sản xuất được in rõ ràng trên bao bì nhé.
',N'/assets/images/sanpham/img (5).jpg','2021-06-26',10,3,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'que bánh từ trà xanh và sữa cho mèo',25000,N'que bánh từ trà xanh và sữa cho mèo mùi vị thơm béo, cho bé cắn đỡ ngứa răng mà vẫn đảm bảo sức khỏe ăn kiêng.
',N'/assets/images/sanpham/img (6).jpg','2021-06-26',10,3,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Pate lon GimCat Shiny Cat Filet cho mèo (70g)',26000,N'Sản phẩm gồm các miếng phi lê tươi ngon giàu dinh dưỡng được nấu vừa chín tới trong nước súp. 
2 cách ăn: Ăn riêng hoặc trộn chung với hạt hoặc cơm là có ngay một bữa ăn hoàn chỉnh đầy đủ dinh dưỡng cần thiết cho cơ thể khỏe mạnh và da lông bóng mượt',N'/assets/images/sanpham/img (7).jpg','2021-06-26',10,4,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'[HN] 2 Cây Xúc Xích Dinh Cho Chó Mèo Xúc Xích Bioline Giàu Vitamin',3500,N'Xúc Xích Dinh Dưỡng Giàu Vitamin, Đạm Bioline Cho Chó Mèo Xúc Xích chứa Vitamin & khoáng chất cho cơ thể những thú cưng luôn khỏe mạnh, linh hoạt. Chất xơ cho hệ thống tiêu hóa tốt, tăng cường khả năng hấp thu chất dinh dưỡng, góp phần vào sự phát triển đồng đều cho thú cưng
',N'/assets/images/sanpham/img (8).jpg','2021-06-26',10,4,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'[HN] Combo 5 gói Sữa bột cho chó mèo Bio Milk 100gr cung cấp dinh',160000,N'Sữa Bio-Milk là dòng sữa cao cấp chuyên dùng cho chó mèo. với thành phần giàu dinh dưỡng, cân đối và dễ tiêu hóa tương tự sữa mẹ, có tác dụng thay thế sữa mẹ trong trường hợp chó mèo mẹ mất sữa, kém sữa hoặc mất sữa, đồng thời bổ sung dưỡng chất cho chó mèo còi cọc chậm lớn
',N'/assets/images/sanpham/img (9).jpg','2021-06-26',10,5,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Sữa cho mèo cao cấp Msbilac God Cat 100g',37000,N'Sữa tách béo cao cấp
Dành cho mèo, mèo non mất mẹ
Bổ sung cho mẹ ít sữa
Bổ sung dinh dưỡng cho mèo, mèo bị suy nhược.
Đầy đủ dinh dưỡng, hồi sức sau bệnh.
',N'/assets/images/sanpham/img (10).jpg','2021-06-26',10,5,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Thức ăn cho chó trưởng thành vị gà nướng Ganador Adult Roasted',117000,N'Thức ăn cho chó trưởng thành Ganador vị gà nướng Adult Roasted Chicken Flavor 3kg/gói. Dành cho chó trên 12 tháng tuổi. Ganador là nhãn hiệu thức ăn cho chó cưng được sản xuất bởi Tập đoàn Neovia với gần 60 năm kinh nghiệm trong lĩnh vực dinh dưỡng và chăm sóc thú cưng',N'/assets/images/sanpham/img (11).jpg','2021-06-26',10,6,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'[85g] Pate cho chó con Royal Canin Mini Puppy',37000,N'Thức ăn cho chó con ROYAL CANIN Mini Puppy có dạng viên hình tam giác phù hợp với cấu tạo răng của chó, giảm nguy cơ hình thành mảng bám răng ở chó. Kích thước hạt phù hợp cỡ răng, thông qua việc cọ xát vào răng giúp bảo vệ răng miệng cho chó.
',N'/assets/images/sanpham/img (12).jpg','2021-06-26',10,6,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Bánh thưởng Sumiho dành cho chó mèo - Gói 100g',17000,N'Bánh thưởng cho chó Sumiho với nhiều hương vị hấp dẫn, được làm 100% từ các loại thịt thật nguyên chất (heo, bò, gà), sấy khô tự nhiên, không chất bảo quản, hoàn toàn an toàn cho sức khỏe của cún cưng.
',N'/assets/images/sanpham/img (13).jpg','2021-06-26',10,7,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'(1 cái 6cm) Xương cho chó gặm sạch răng 6cm Xương chữ thập',7000,N'+ Sản phẩm sử dụng nguyên liệu da bò tự nhiên
+ Dễ tiêu hóa,ít chất béo,khử men răng,m hôi miệng và phòng tránh các chứng bệnh về răng miệng
+ sản phẩm xương da doog còn bổ sung chất dinh dưỡng cần thiết cho phát triển khỏe mạnh
+ không gây hại, không chứa chất bảo quản, giúp cún con thích thú khi ăn
',N'/assets/images/sanpham/img (14).jpg','2021-06-26',10,7,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Xương Canxi Da Bò Cho Chó Gặm Làm Sạch Răng Giúp Răng Chắc',7000,N'Là 1 sản phẩm của hãng sản xuất về thú cưng nổi tiếng, xương canxi được sản xuất từ các nguyên liệu an toàn, thơm ngon, là sản phẩm thích hợp nếu bạn muốn chó cưng nhà mình có một hàm răng sạch sẽ, sức khỏe dẻo dai, cũng như nếu bạn muốn xóa bỏ tình trạng chó cưng buồn chán, cắn phá các đồ vật trong nhà.',N'/assets/images/sanpham/img (15).jpg','2021-06-26',10,8,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Xương sữa dê bổ sung canxi Goats milk formula dành cho thú',25000,N'Xương thưởng sữa dê Goats milk formula bổ sung canxi dành cho thú cưng - CutePets
Xương sữa được làm từ sữa dê nguyên chất, giàu vitamin, khoáng chất và protein, rất tốt cho sức khỏe của bé.
Xương sữa là món thưởng tuyệt vời cho chú cún hay boss nhà bạn, giàu dưỡng chất và vô cùng ngon miệng
',N'/assets/images/sanpham/img (16).jpg','2021-06-26',10,8,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Xương gặm cho chó Orgo 90gr gói 6 thanh hình bàn chải giúp sạch',25000,N'Làm sạch răng, giúp hợp khẩu vị, giúp xương chắc khỏe, và bổ sung canxi. Với thành phần phomat chất lượng cao từ nguyên liệu thô, cùng với công thức sữa thơm ngon. Giúp cho sự phát triển tốt của xương, răng, loại bỏ mảng bám cao răng, giúp răng trắng hơn Không khiến cún yêu của bạn gây mùi khó chịu.
',N'/assets/images/sanpham/img (17).jpg','2021-06-26',10,9,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Xương Gặm Cho Chó Orgo 90Gr Gói 5 Thanh Hình Xương Vị Phô',28000,N'Làm sạch răng, giúp hợp khẩu vị, giúp xương chắc khỏe, và bổ sung canxi. Với thành phần phomat chất lượng cao từ nguyên liệu thô, cùng với công thức sữa thơm ngon. Giúp cho sự phát triển tốt của xương, răng, loại bỏ mảng bám cao răng, giúp răng trắng hơn Không khiến cún yêu của bạn gây mùi khó chịu.
',N'/assets/images/sanpham/img (18).jpg','2021-06-26',10,9,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Combo 5 Gói Sữa Bột Cho Chó Mèo Bio Milk 100Gr Cung Cấp',160000,N'Bio Milk For Pet với thành phần giàu chất dinh dưỡng, cân đối và rất dể tiêu hóa tương tự sữa mẹ, có tác dụng thay thế sữa mẹ trong trường hợp chó, mèo mất sữa, kém sữa hoặc thiếu sữa do bầy con quá đông, đồng thời là nguồn bổ xung chất dinh dưỡng cho chó mèo còi cọc, chậm lớn.
',N'/assets/images/sanpham/img (19).jpg','2021-06-26',10,10,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Sữa chua chó mèo biếng ăn gói 50ml Hỗ trợ tiêu hoá',7000,N'Thành phần giàu chất dinh dưỡng, cân đối và rất dể tiêu hóa tương tự sữa mẹ, giúp pet của bạn ăn mau chóng lớn.
',N'/assets/images/sanpham/img (20).jpg','2021-06-26',10,10,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Combo 5 Chiếc Xúc Xích Ăn Liền Cho Chó Mèo, Hamster Hương Vị',20000,N'- Xúc xích chứa Vitamin & khoáng chất cho cơ thể những thú cưng luôn khỏe mạnh, linh hoạt. Chất xơ cho hệ thống tiêu hóa tốt, tăng cường khả năng hấp thu chất dinh dưỡng, góp phần vào sự phát triển đồng đều cho thú cưng. 
- Chọn nguyên liệu tươi tự nhiên chất lượng cao, tất cả các nguyên liệu được kiểm tra nghiêm ngặt. Giúp ổn định hệ thống vi khuẩn đường ruột, tiêu hóa khỏe, bé ăn ngon
',N'/assets/images/sanpham/img (21).jpg','2021-06-26',10,11,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Thịt bò que 40g và 90g dành cho chó - 90g',40000,N'Thịt bò que cho chó Bowwow được làm từ thịt bò tươi Úc và New Zealand, chứa nhiều vitamin và khoáng chất, giúp hỗ trợ việc huấn luyện chó và nâng cao khả năng học hỏi của chó. Sản phẩm có dạng mềm, thơm ngon, có hàm lượng chất béo, muối và calo thấp.
',N'/assets/images/sanpham/img (22).jpg','2021-06-26',10,11,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'100g Cám nhật B2 - Cám cá bảy màu - guppy - betta - cám siêu tốt',99000,N'cám siêu tốt cho cá, thành phần dinh dưỡng cao lên đên 50% giúp cá mau lớn và phát triển toàn diện
',N'/assets/images/sanpham/img (23).jpg','2021-06-26',10,12,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Thức Ăn Cá Koi Sakura Gold 2500g 35% - Cám Cá Cảnh HẠT',230000,N'Thức Ăn Cá Koi Sakura Gold 2500g 35% - Cám Cá Cảnh HẠT NHỎ 2MM là thực phẩm, cám cá cho các loại cá cảnh vừa và lớn như cá vàng, cá chép bé, hồng két, cá koi với nhiều hạt với kích thước khác nhau phù hợp cho từng loại cá.
',N'/assets/images/sanpham/img (24).jpg','2021-06-26',10,12,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'[GÓI 200G] Cám cho chim Khuyên số 2 - Cám cho chim ăn - Cám	',49000,N'Cám chim vành khuyên Thuý Tuấn là dòng cám thuần dưỡng, thi đấu dành cho chim vành khuyên. Sản phẩm gồm 5 số: số 0 dành cho chim thay lông, chim mộc, số 1 dùng dưỡng chim l, nuôi văn nghệ, số 2, số 3 dành cho chim thi đấu, gói vip dành cho thi đấu đỉnh cao.
',N'/assets/images/sanpham/img (25).jpg','2021-06-26',10,13,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Cám ớt cho chim',15000,N'Cám ớt là loại thức ăn đặc biệt dùng cho các loại chim biết nói như: nhồng, két, cưỡng, sáo. 
 Thành phần: thịt bò, ớt, bột bắp, bột gạo, đậu nành, bột cá, vitamin và khoáng chất rất tốt và cần thiết cho chim nuôi trong lồng. Đặc biệt giúp cho chim nhanh biết nói chuyện, tăng màu sắc và bóng mượt lông chim.
',N'/assets/images/sanpham/img (26).jpg','2021-06-26',10,13,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Combo 5 Túi Thức Ăn Chuyên Dụng Cho Rùa Cản',65000,N'Thức ăn được chế biến dạng hạt đặc biệt cho tất cả các loại rùa (cả rùa nước và rùa cạn) Giúp cung cấp dinh dưỡng cần thiết hàng ngày và ngăn chặn sự mềm mại của vỏ rùa để hỗ trợ cho rùa phát triển khoẻ mạnh.
',N'/assets/images/sanpham/img (27).jpg','2021-06-26',10,14,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Thức ăn dinh dưỡng T-Balance bổ sung đủ chất dinh dưỡng cho rùa',100000,N'Thức ăn dinh dưỡng bổ sung đủ chất dinh dưỡng cho rùa của bạn. – T- Balance 1 nhãn hiệu được Thái Lan rất tin dùng , với thành phần chống các bệnh về xuơng chống gù …hầu như các bạn bên Thái đều dùng loại này cho rùa của họ ăn hàng ngày .
',N'/assets/images/sanpham/img (28).jpg','2021-06-26',10,14,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Sâu rang bơ cho Hamster',15000,N'Thức ăn dặm tuyệt vời cho các bé Hamster, thỏ , bọ , sóc...
',N'/assets/images/sanpham/img (29).jpg','2021-06-26',10,15,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Rainbow lốc 12 lọ nuôi gà đá hàng ngày -1200 viên',350000,N'thuốc gà đá-nuôi tăng cơ,phát triển khung hình cho gà tơ.
',N'/assets/images/sanpham/img (30).jpg','2021-06-26',10,15,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Fleadom của Virbac chống ve, chống rận, bọ chét, ghẻ cho chó,',127000,N'Vòng đeo cổ chống ve, chống rận, bọ chét, ghẻ cho chó, mèo Fleadom của Virbac – Pháp
',N'/assets/images/sanpham/img (31).jpg','2021-06-26',10,16,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Vòng Cổ Chống Rận Ngăn Ngừa Diệt Ve Rận Bọ Chét VCR005',16000,N'Công thức độc đáo, tác dụng nhanh chóng, bảo vệ lâu dài. Đẩy lùi ve, bọ chét. Có bổ sung tinh dầu thiên nhiên.
Các hoạt chất trong vòng sẽ liên tục tỏa ra và bao phủ trên lông mèo sau khi đeo vòng cổ. Các hợp chất tự nhiên được dùng thay thế cho các chất hóa học, đảm bảo an toàn cho mèo.Thêm vào đó, vòng có độ đàn hồi cùng lớp phủ phản quang giúp tăng thêm việc bảo vệ chó thêm tiện lợi.
',N'/assets/images/sanpham/img (32).jpg','2021-06-26',10,16,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Thuốc Trị Viêm Tai Cho Chó Mèo Virbac Dexoryl',130000,N'Thuốc nhỏ tai dạng huyền dịch dầu, giúp khuếch tán thuốc tốt hơn. Điều trị cục bộ bệnh viêm tai ngoài do vi khuẩn, nấm hoặc ngoại kí sinh.
',N'/assets/images/sanpham/img (33).jpg','2021-06-26',10,17,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Chai Xịt Ngoài Da Diệt Ve Rận Bọ Chét Ký Sinh Trùng Cho Chó Mèo',19000,N'Chiết Suất Từ Hoa Cúc Nên Hoàn Toàn Không Độc Hại Đến Người Và Vật Nuôi
Giúp bảo vệ vật nuôi khỏi bọ chét và ký sinh trùng.
',N'/assets/images/sanpham/img (34).jpg','2021-06-26',10,17,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Viên nhai diệt 4 loại: (35)ve- (2)rận- (3)bọ chét- (4)ghẻ. NexGard cho',105000,N'Với công dụng trừ ve rận bọ chét và ghẻ Demodex, Sarcoptes, Viên Nhai NexGard Phòng & Ve, Rận, Ghẻ Cho Chó có tác dụng kéo dài trong vòng 30 ngày, chủ nuôi sẽ thấy hiệu quả ngay sau 24-36 giờ sử dụng. Ve rận bọ chét sẽ chết khô trên da và dễ dàng loại bỏ sau những lần tắm. Vết ngứa và mẩn đỏ da do ghẻ sẽ thuyên giảm hẳn sau lần sử dụng thuốc đầu tiên.
',N'/assets/images/sanpham/img (35).jpg','2021-06-26',10,18,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'1 viên XỔ GIUN SANPET tẩy giun chó mèo- (hanpet 303)',5000,N'Sản Phẩm được phân phối bởi Hanpet Công dụng của sanpet:
- Tẩy sạch các loại sán dây, sán hạt dưa và giun tròn ký sinh ở chó, mèo và động vật ăn thịt.
- Sán dây: sán hạt dưa (Echinococcus granulosus ), Dipylidium cananium, Taenia pisiformis, T. ovis, T. hydatigena.
- Giun tròn: Giun đũa ( Toxacara canis, Toxascaris leonina), giun tóc ( Trichuris vulpis), giun móc ( Ancylostoma canium, A. blaziliensse, Unicaria stenocephala).
',N'/assets/images/sanpham/img (36).jpg','2021-06-26',10,18,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Máng ăn tự động cho chim cảnh, vẹt, gà...',30000,N'Sản phẩm dùng rất thuận tiện, đổ đầy là thức ăn tự ra cho vật nuôi ăn không còn tốn công của người nông dân phải đổ thức ăn mỗi ngày',N'/assets/images/sanpham/img (37).jpg','2021-06-26',10,19,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Máng uống nước tự động cho gà, vịt nuôi công nghiệp	',8000,N'Máng Uống có cấu tạo khá đơn giản và dễ lắp đặt bà con có thể nhìn và tự lắp đặt máng nước 
',N'/assets/images/sanpham/img (38).jpg','2021-06-26',10,19,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'40 vòi thỏ uống nước màu vàng đồng - 40 beck thỏ - 40 van uống',200000,N'Cung cấp nước sạch luôn luôn sẳn có cho thỏ, chuột hamster , cho thú cưng ..vv......
=> Đây là sản phẩm tuyệt vời ,,, ứng dụng thông Minh trong mô hình phát triển công nghệ cho ngành nuôi trông
',N'/assets/images/sanpham/img (39).jpg','2021-06-26',10,20,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Cóng uống nước cho chim loại 105ml ( Hàng Nhập Khẩu )',15000,N'Được sản xuất trên dây chuyền và công nghệ hiện đại của Italia
Phù hợp cho các loại lồng nhỏ
Gọn nhẹ dễ vệ sinh và tháo lắp
Dung tích 105ml thích hợp nuôi cặp từ 2 cặp trở lên hoặc tách lẻ
Dành cho các loại chim Yến Hót và các dòng chim nhỏ khác
',N'/assets/images/sanpham/img (40).jpg','2021-06-26',10,20,3)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Máy cho ăn tự động dành cho thú cưng có app điện thoại giao diện',1500000,N'Máy cho ăn tự động dành cho thú cưng có app điện thoại giao diện tiếng việt dễ sử dụng
Chưa bao giờ việc cho thú cưng ăn lại tiện lợi đến thế.
',N'/assets/images/sanpham/img (41).jpg','2021-06-26',10,21,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Bánh Rán Cho Thú Cưng Ăn Tự Động 6 Bữa Với Bộ Hẹn Giờ Lập',550000,N'Sản phẩm được làm bằng vật liệu dùng cho thực phẩm, vô hại với cơ thể con người và vật nuôi đáng yêu của bạn.
Thiết bị định giờ, 24 giờ để điều chỉnh thời gian ăn tối cho thú cưng, do đó không cần phải lo lắng về việc thú cưng bị đói trong khi chủ của chúng đi xa.
Thiết kế 6 bữa ăn: Mỗi ngăn trong khay có thể tháo rời chứa tới 450g Thức ăn khô hoặc bán ẩm; sử dụng bộ cấp liệu này để cho thú cưng của bạn ăn suốt cả ngày.
',N'/assets/images/sanpham/img (42).jpg','2021-06-26',10,21,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Bán Chạy Miếng Lót Thức Ăn Chậm Chống Sặc Cho Thú Cưng,',190000,N'Sản phẩm này bền, thân thiện với môi trường và không độc hại, thích hợp cho thú cưng ăn, và có thể làm chậm tốc độ ăn của thú cưng.
',N'/assets/images/sanpham/img (43).jpg','2021-06-26',10,22,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'[Yuanhesheng] Thảm Đồ Chơi Cho Chó Máy Cấp Liệu Chậm, Thảm',200000,N'Đây là một tấm thảm huấn luyện chó độc đáo, được giấu bằng đồ ăn nhẹ hoặc đồ chơi nhỏ trong miếng đệm Hít Để chú chó của bạn tìm thấy nó. Nó giúp huấn luyện mùi của chú chó của bạn, và có thể tiêu thụ năng lượng của chú chó của bạn và giúp chú chó của bạn giảm cân.
Nó có thể giữ cho con chó của bạn bận rộn. Miếng lót cho chó này là một cách tuyệt vời để có một chú chó có nhiều năng lượng để sử dụng não trong giờ ăn tối, nó có thể mặc chúng như đi bộ.
',N'/assets/images/sanpham/img (44).jpg','2021-06-26',10,22,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Cát vệ sinh cho mèo của Úc Best In Show/BIS Cat Sand 12L',117000,N'Là một loại cát được làm từ 💯💯 nguyên liệu bentonot tự nhiên của Úc. Công thức độc đáo để cát dễ hấp thụ và bắt mùi trước khi lan rộng.
',N'/assets/images/sanpham/img (45).jpg','2021-06-26',10,23,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Cát tắm diệt khuẩn jolly 500gr -1kg - dâu - bịch 1kg',40000,N'Sạch sẽ, an toàn cho thú cưng của bạn
',N'/assets/images/sanpham/img (46).jpg','2021-06-26',10,23,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Xích Đu Cho Hamster',40000,N'Là nơi các chú hamster nhỏ bé vui đùa, cũng như chất liệu an toàn với người sử dụng.
',N'/assets/images/sanpham/img (47).jpg','2021-06-26',10,24,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Bóng chạy hamster ( không đế )',30000,N'An toàn, bền và dễ sử dụng',N'/assets/images/sanpham/img (48).jpg','2021-06-26',10,24,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Set Tông Đơ Sạc Điện 8 Món Cắt Tỉa Lông Chó Mèo Sweet Care',280000,N'Tông Đơ Sạc Điện Cắt Tỉa Lông Chó Mèo Sweet Care 
- Tông đơ có thể sạc điện dễ dàng: sạc trong 3h và có thể sử dụng liên tục trong 5 tiếng 
- Thiết kế dễ sử dụng, vận hành: khởi động chỉ cần ấn nút đơn giản 
- Có đèn điện tử báo hiệu sản phẩm đang sử dụng hay đang sạc 
- Lưỡi tông đơ từ vật liệu gốm ceramic + titan thép không gỉ bền và sắc, dễ dàng tháo ra vệ sinh 
- Đầu lược nhựa kèm theo giúp định hình phần lông bạn muốn tạo hình và giúp chó mèo cảm thấy êm ái, dễ chịu hơn
',N'/assets/images/sanpham/img (49).jpg','2021-06-26',10,25,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Tông Đơ máy CP-6800 - Chuyên Dụng Cắt Lông Chó Mèo',349000,N'Tông Đơ máy Chuyên Dụng Cắt Lông Chó Mèo là máy tông đơ cắt lông chuyên dụng cho thú cưng của Hồng Kông
Máy có thiết kế nhỏ gọn, dễ cầm trong lòng bàn tay, tông đơ cắt lông CP-6800 giúp bạn có thể dễ dàng hớt lông với cả 2 tay ở những bộ phận như vùng tai, vùng bụng, hay bắp chân, kể cả những chùm lông dày.
Công tắc máy được đặt trên thân máy kết hợp với lưỡi tông đơ cực kì sắc bén - cấu tạo từ lõi sứ Titanium - giúp bạn hớt lông thoái mái hơn và nhanh chóng hơn cho chó mèo, đặc biệt khi các bé chó mèo nhà bạn thuộc dạng hiếu động ham chơi, khó giữ yên một chỗ. Khi sử dụng tông đơ cắt lông, bạn sẽ còn tiết kiệm được nhiều thời gian cắt tỉa lông cho bé cưng ở nhà, do lưỡi dao của tông đơ có thể tháo rời, giúp bạn tiện lợi hơn nhiều trong khâu vệ sinh sau khi hớt lông.
 
',N'/assets/images/sanpham/img (50).jpg','2021-06-26',10,25,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Xịt Khử Mùi Diệt Khuẩn Bảo Vệ Sức Khỏe Chó Mèo Natural Core',185000,N'- Xịt khử mùi diệt khuẩn trong gia đình, nhà ở…
- Hương hoa nhài nhẹ nhàng êm dịu
- 100% thành phần hữu cơ thiên nhiên
- Khử mùi tuyệt vời, mang lại bầu không khí trong lành
- Hiệu quả, an toàn, nhanh chóng, tiện dụng
- Khử sạch mùi hôi trên cơ thể thú cưng
- Loại bỏ nhanh chóng và triệt để đến 99.9% các loại vi khuẩn
',N'/assets/images/sanpham/img (51).jpg','2021-06-26',10,26,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Túi Đựng Phân TDP003 Combo 2 Túi',8000,N'Một công cụ cần thiết cho thú cưng của bạn. Lý tưởng để sử dụng tại nhà, du lịch và ngày lễ.',N'/assets/images/sanpham/img (52).jpg','2021-06-26',10,26,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Tã lót cho chó mèo đi vệ sinh vào khay, chuồng bằng giấy siêu thấm',4000,N'Công dụng của tã lót chuồng:
- Thấm hút nước tiểu của thú cưng rất nhanh chóng và đóng kết lại
- Bề mặt trên của miếng lót chuồng là vải không dệt, mềm mại, thấm hút nhanh , luôn duy trì được bề mặt khô thoáng tạo cảm giác dễ chịu và thoải mái chc thú cưng của bạn
- Diệt khuẩn tốt, ngăn chặn sự phát triển của vi khuẩn 
- Phòng chống nước tiểu (chất lỏng) trào ngược trở lại- Khử mùi hiệu quả, giúp phòng luôn sạch sẽ không có mùi hôi do thú cưng đi vệ sinh
- Luyện chó mèo đi vệ sinh đúng chỗ, do mùi hương thu hút bản năng của chó mèo
',N'/assets/images/sanpham/img (53).jpg','2021-06-26',10,27,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'(1 bịch) Bỉm chó mèo dạng quần dán &Tã giấy lót chuồng chất liệu',70000,N'Giúp dễ dàng dọn vệ sinh và tiện lợi hơn cho chủ.
',N'/assets/images/sanpham/img (54).jpg','2021-06-26',10,27,4)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Kakaoppa Hàn Quốc Làm Mới Phong Cách Chó Ăn Mặc Sọc Cổ',90000,N'Vải thời trang, mềm mại và thoải mái
Chiều dài trang phục: Bình thường
Cổ áo: Cổ áo O
',N'/assets/images/sanpham/img (55).jpg','2021-06-26',10,28,5)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'2019 Xuân Hè Mới Quần Áo Nhiều Màu Sắc Cho Thú Cưng Streamer',40000,N'Váy cho thú cưng mùa hè với họa tiết hoa.
Chất liệu cotton thoáng khí, mỏng và mát mẻ cho mùa hè nóng bức.
Quần áo trang trí đẹp cho chú mèo hoặc chú chó yêu quý của bạn.
Loại: Váy cho thú cưng
Chất liệu: Cotton
Phong cách: thoải mái
Tính năng: in hoa, mỏng, thoáng khí
 
',N'/assets/images/sanpham/img (56).jpg','2021-06-26',10,28,5)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Dog Cover for Car Back Seat Side Protection, Washable Waterproof',345000,N'Dụng cụ tiện lợi và không thể thiếu cho thú cưng của bạn trong những chuyến đi xa bằng oto
',N'/assets/images/sanpham/img (57).jpg','2021-06-26',10,29,5)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Pet Dog Hãng, Bọc Ghế Ô Tô Cho Chó Cưng Sau Lưng Chống Nước',340000,N'Tính năng: Thảm ngồi ô tô cho chó cưng
Một món quà thiết bị tốt cho thú cưng của bạn! Giữ cho xe của bạn sạch sẽ, và nó cũng có thể được sử dụng để cắm trại, đi bộ đường dài hoặc các hoạt động ngoài trời khác
 
',N'/assets/images/sanpham/img (58).jpg','2021-06-26',10,29,5)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Size 1- Lồng hàng không (hanpet 4711769) lồng vận chuyển chó',358000,N'Lồng hàng không cho chó mèo, chất liệu , bền, đẹp, chắc chắn.
Có nắp cà tiện dụng, thiết kế hiện đại thoáng mát, giúp thú cưng nhà bạn cực kỳ thoải mái trong các chuyến đi xa.
Chất liệu nhựa cấp cửa kim loại, không chứa chất độc hại, không gây kích ứng
',N'/assets/images/sanpham/img (59).jpg','2021-06-26',10,30,5)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Túi lưới đa nặng giúp tắm, cắt mòng, vệ sinh tai cho mèo - kích',70000,N'Kích thước: 33x62 cm
Chất liệu: Vải nhân tạo độ bền cao
Đặc điểm: Lưới, bảo vệ
Dành cho mèo từ 10kg trở xuống.
',N'/assets/images/sanpham/img (60).jpg','2021-06-26',10,30,5)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Balo túi vận chuyển chó mèo thú cưng du lịch - Balo tui van chuyen',350000,N'Thoáng mát, giúp bạn dễ quan sát hoạt động của bé
',N'/assets/images/sanpham/img (61).jpg','2021-06-26',10,31,5)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Balo Phi Hành Gia Cho Thú Cưng ♥️♥️ Balo vận chuyển chó mèo',205000,N'Balo Phi Hành Gia cho chó mèo là sản phẩm linh động cho các Sen khi mang theo thú cưng của mình đi chơi. Balo phi hành gia có thiết kế thông minh, thông thoáng giúp cho thú cưng của bạn thoải mái và an toàn khi di chuyển. Cho phép các Boss tận hưởng ánh nắng mặt trời, phong cảnh và tương tác với thế giới bên ngoài.
',N'/assets/images/sanpham/img (62).jpg','2021-06-26',10,31,5)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Pet Backpack Backpack Suitable for Small Cats and Dogs',501000,N'Làm bằng vật liệu chất lượng cao, bền, thoáng khí và thoải mái. Thiết kế trong suốt, cho thú cưng của bạn nhìn thấy ánh nắng và cảnh vật thế giới từ bên ngoài.

',N'/assets/images/sanpham/img (63).jpg','2021-06-26',10,32,6)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'(Nóng) Địu Thú Cưng Ba Lô Cho Chó, Túi Chó Mèo Cún Con Mềm',420000,N'Dễ dàng tiện lợi mang theo thú cưng bên mình mỗi khi ra đường, chăm sóc và gần gũi với chúng khi đi bộ hoặc đi xe. 
',N'/assets/images/sanpham/img (64).jpg','2021-06-26',10,32,6)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Dây dắt kèm vòng cổ cho chó mèo',35000,N'Nhằm giải quyết sự băn khoăn làm thế nào để đi chơi cho thoải mái mà thú cưng của mình không bị bắt mắt, hay nó chạy đi mất. Chất liệu chắc chắn và thiết kế dày dặn cho độ bền , đồng thời tạo cảm giác êm ái khi đeo. Dạng vòng cổ chắc chắn giúp bạn “quản lý” các chú cún hiếu động và tinh nghịch dễ hơn. Thiết kế khóa giúp bạn dễ dàng đeo hoặc tháo mở dây và vòng một cách nhanh chóng. 
',N'/assets/images/sanpham/img (65).jpg','2021-06-26',10,33,6)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Vòng Cổ Chó Mèo Inox Loại Trung (50Cm )',15000,N'Cổ Xích chó mèo inox là chất liệu inox 304 tốt nhất nói ko với han gỉ, dây xích là mắt kép đặc và vô cùng chắc chắn. Cổ trung gồm 1 đoạn và 1 móc riêng biệt giúp dễ dàng điều chỉnh độ dài ngắn và chỉnh được độ rộng cổ vừa với cún nhà bạn
',N'/assets/images/sanpham/img (66).jpg','2021-06-26',10,33,6)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'[HN] Rọ Mõm Inox Cho Thú Cưng Size M - Phụ Kiện Cho Thú Cưng',90000,N'Với chất liệu da có 2-3 đai ở mõm có thể thu nhỏ hoặc nới rộng phần mõm chó. phần đai quàng gáy có thể điều chỉnh cho phù hợp với đầu chó, đai này có bộ phận cố định vào vòng cổ, làm cho rọ mõm gắn chắc chắn không bao giờ bị tuột. 
',N'/assets/images/sanpham/img (67).jpg','2021-06-26',10,34,6)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'rọ mõm cho innox',60000,N'Sử dụng rọ mõm để phòng tránh trường hợp chó cắn người hay những con chó khác khi cảm thấy bị đe dọa. Khi chăm sóc lông, có một vài chú chó cảm thấy không quen, không thân thiết với người chăm sóc lông cho mình, bạn nên đeo rọ mõm để đảm bảo an toàn. Có một vài giống chó bắt buộc phải đeo rọ mõm. Không may là chưa có luật quy định rõ ràng về một vài giống chó đặc biệc hung hăng và nguy hiểm, bắt buộc phải đeo rọ mõm ở nơi công cộng.
',N'/assets/images/sanpham/img (68).jpg','2021-06-26',10,34,6)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'1 Bộ Dây Dắt Thú Cưng, In Hoa Thoáng Khí Cho Chó Cún ',63000,N'Sử dụng dây nịt cho thú cưng với kết cấu vải lưới thoáng khí để cho chó của bạn mặc, sau đó sẽ cảm thấy thoải mái.
Là một dây nịt thú cưng có thể điều chỉnh với thiết kế khoa học, nó có thể phù hợp với cơ thể thú cưng của bạn mà không gây hại cho cổ thú cưng.
Nó được làm từ chất liệu polyester.
',N'/assets/images/sanpham/img (69).jpg','2021-06-26',10,35,6)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Áo Dây Xích Đai Yếm Cho Mèo Con Và Chó Con ',42000,N'Thuận tiện dẫn thú cưng đi dạo và tạo gu thời trang cho thú cưng của mỗi người. ',N'/assets/images/sanpham/img (70).jpg','2021-06-26',10,35,7)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'1 Tấm Gỗ Hình Chữ Nhật Hình Mèo Trang Trí Biển Hiệu Tình Bạn',24000,N'Tình trạng: mới 100%
Làm bằng chất lượng cao
Màu sắc: Như trong hình
Đóng gói bao gồm: 1 miếng gỗ hình mèo
Kích thước: 10*20cm
Chất liệu: Gỗ
',N'/assets/images/sanpham/img (71).jpg','2021-06-26',10,36,7)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Tongpudi®Chống Lạc Kim Loại Chó Mèo Cổ Áo Thẻ Tên Khắc ID',25000,N'Hấp dẫn về hình dạng và màu sắc. Đảm bảo an toàn cho thú cưng. Dễ dàng lau chùi, bảo dưỡng Được làm từ chất liệu cứng cáp.
',N'/assets/images/sanpham/img (73).jpg','2021-06-26',10,36,7)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'WANGHU Cam Ánh Nắng Mặt Trời Kim Loại Vít Mất Chó Mèo PET ID',20000,N'Ống này chứa thông tin khẩn cấp quan trọng, đáy ống tháo ra và giữ Bảng thông tin
Đặt nó vào cổ thú cưng và không bao giờ lo lắng về việc bị lạc một lần nữa. tất cả thông tin liên lạc của bạn có thể được giữ bên trong để cho người khác
Biết cách liên hệ với bạn ID thú cưng bằng hợp kim nhôm chắc chắn. Nó đi kèm với một nắp vặn
	',N'/assets/images/sanpham/img (73).jpg','2021-06-26',10,37,7)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'GF-07 Thiết Bị Định Vị Thiết Bị Định Vị SOS Từ Tính Thời Gian',290000,N'Mini GPS Tracker Thiết bị theo dõi vật nuôi theo thời gian thực di động Thiết bị theo dõi GPS cho trẻ em, người già, vật nuôi, ô tô, Trình theo dõi định vị đa năng, GPS + AGPS + Wifi + LBS Định vị SOS Báo động theo dõi ứng dụng web Sử dụng GPS Tracker mini này cho bất kỳ mục đích theo dõi nào! Đừng dành quá nhiều thời gian và sức lực để tìm kiếm những món đồ bị đánh cắp, thất lạc và / hoặc thất lạc.
',N'/assets/images/sanpham/img (74).jpg','2021-06-26',10,37,7)



select * from SANPHAM