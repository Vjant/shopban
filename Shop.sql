use master
Drop Database Shop
create database Shop
GO
use Shop
GO
-------------------------------------------------
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
	CONSTRAINT FK_NhaCungCap FOREIGN KEY(MaNCC) REFERENCES NHACUNGCAP(MaNCC),
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

INSERT DANHMUC(TenDanhMuc) VALUES (N'Thức ăn cho mèo')
INSERT DANHMUC(TenDanhMuc) VALUES (N'Thức ăn cho chó')
INSERT DANHMUC(TenDanhMuc) VALUES (N'Thức ăn cho thú cưng khác')
INSERT DANHMUC(TenDanhMuc) VALUES (N'Chăm sóc thú cưng')
INSERT DANHMUC(TenDanhMuc) VALUES (N'Phụ kiện chăm sóc')
INSERT DANHMUC(TenDanhMuc) VALUES (N'Phụ kiện khác')

INSERT LOAI(MaDM,TenLoai) VALUES(1,N'Thức ăn khô')
INSERT LOAI(MaDM,TenLoai) VALUES(1,N'Thức ăn ướt')
INSERT LOAI(MaDM,TenLoai) VALUES(1,N'Thức ăn kiêng')
INSERT LOAI(MaDM,TenLoai) VALUES(1,N'Thức ăn đông lạnh')
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

INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Hạt Royal Canin Indoor cho mèo - Túi chiết 1kg',165.000,N'AA',N'','2021-06-26',10,1,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'COMBO 4 loại thức ăn hạt cho mèo (Whiskas, Minino, Minino Yum, Hello Cat)',109.000,N'AA',N'','2021-06-26',10,1,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Pate Wanpy Happy 100 Thơm Ngon Cho Mèo (Lon 95g)',19.000,N'AA',N'','2021-06-26',10,2,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'[Combo 6] Pate Whiskas Cho Mèo Con 85g',67.000,N'AA',N'','2021-06-26',10,2,1)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'Bánh thưởng Sumiho dành cho chó mèo - Gói 100g',17.000,N'AA',N'','2021-06-26',10,7,2)
INSERT SANPHAM(TenSP,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaL,MaNCC) VALUES (N'(1 cái 6cm) Xương cho chó gặm sạch răng 6cm Xương chữ thập',7.000,N'AA',N'','2021-06-26',10,7,2)
select TenDanhMuc,MaL,tenloai from Loai,DANHMUC where DANHMUC.MaDM = LOAI.MaDM 
select * from DANHMUC
select * from LOAI
select tenSP,TenDanhMuc from SANPHAM,LOAI,DANHMUC where SANPHAM.MaL= LOAI.MaL and LOAI.MaDM=DANHMUC.MaDM
