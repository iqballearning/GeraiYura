create database geraiyura_apsi;

show databases;

use geraiyura_apsi;

create table produkgeraiyura(
Kode_Produk enum('MTGY01', 'STGY01'),
Jenis_Produk enum('Mango Thai GeraiYura', 'Strawberry Smoothies Thai GeraiYura'),
Harga_Produk decimal(9,2),
primary key (Kode_Produk)
);

create table karyawangeraiyura(    
Id_Karyawan varchar(7) not null, 
Nama_Karyawan varchar(30) not null,
primary key (Id_Karyawan)
);

create table pembeligeraiyura(
Id_Pemesanan varchar(7) not null,
Id_Pembeli varchar(7) not null, 
Nama_Pembeli varchar(30) not null default 'TEMANYURA',
primary key(Id_Pemesanan, Id_Pembeli) 
);

create table transaksigeraiyura(
Id_Pemesanan varchar(7) not null,
Jenis_Produk1 varchar(50) not null,
Harga_Produk_MTGY01 decimal(9,2),
Jumlah_Produk_MTGY01 int not null default 0,
Jenis_Produk2 varchar(50) not null,
Harga_Produk_STGY01 decimal(9,2),
Jumlah_produk_STGY01 int not null default 0,
Tanggal_Order date not null,
Waktu_Order time not null,
Status_Order enum('Pesanan selesai', 'Pesanan batal'),
Cabang_Gerai enum('Lamgugob', 'Ulee Lheue', 'Keutapang'),
Nama_Karyawan varchar(30) not null,
primary key (Id_Pemesanan),
constraint foreignkey_geraiyura
foreign key (Id_Pemesanan) references pembeligeraiyura (Id_Pemesanan)
);
