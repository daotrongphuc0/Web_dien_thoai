
/*
create database [Web_ban_dien_thoai]
go
*/



CREATE TABLE tblNguoiDung (
    idNguoiDung INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    tenND VARCHAR(20) NOT NULL, 
    taiKhoan VARCHAR(20) NOT NULL,
    matKhau VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    sdt VARCHAR(50) NOT NULL,
    created_at VARCHAR(20) NOT NULL,
    updated_at VARCHAR(20) NOT NULL,
);


CREATE TABLE tblSanPham (
    idSanPham INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    tenSP VARCHAR(70) NOT NULL, 
    hang VARCHAR(20) NOT NULL,
    pin INT NOT NULL, 
    ram INT NOT NULL,
    rom INT NOT NULL,
    CPU VARCHAR(30) NOT NULL,
    KTmanHinh VARCHAR(30) NOT NULL,
    cameraTruoc VARCHAR(20) NOT NULL,
    cameraSau VARCHAR(20) NOT NULL,
    gia VARCHAR(30) NOT NULL,
    created_at VARCHAR(20) NOT NULL,
    updated_at VARCHAR(20) NOT NULL,
);

CREATE TABLE tblGioHang (
    idNguoiDung int NOT NULL,
    idSanPham int NOT NULL,
    soluong int NOT NULL,
    FOREIGN KEY (idNguoiDung) REFERENCES tblNguoiDung (idNguoiDung),
    FOREIGN KEY (idSanPham) REFERENCES tblSanPham (idSanPham),
);


CREATE TABLE tblHinhAnh (
    idHinhAnh INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idSanPham  int NOT NULL,
    path VARCHAR(100) NOT NULL,
    slug VARCHAR(50) NOT NULL,
    created_at VARCHAR(20) NOT NULL,
    FOREIGN KEY (idSanPham) REFERENCES tblSanPham (idSanPham),
);


CREATE TABLE tblDanhGia (
    idDanhGia INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idNguoiDung int NOT NULL,
    idSanPham int NOT NULL, 
    soSao int ,
    noidung VARCHAR(255) NOT NULL,
    created_at VARCHAR(20) NOT NULL,
    FOREIGN KEY (idNguoiDung) REFERENCES tblNguoiDung (idNguoiDung),
    FOREIGN KEY (idSanPham) REFERENCES tblSanPham (idSanPham),
);

create table tblPhanLoai(
	idSanPham int,
	loai varchar(20),
	foreign key (idSanPham) references tblSanPham (idSanPham),
);