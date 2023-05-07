-- BEBERAPA SYNTHAX YANG DAPAT DIGUNAKAN UNTUK PADA DATABASE GERAIYURA INI
show tables;

-- UNTUK MENAMPILKAN TABEL PRODUKGERAIYURA
select*from produkgeraiyura;

-- UNTUK MENAMPILKAN TABEL PEMBELIGERAIYURA
select*from pembeligeraiyura;

-- UNTUK MENAMPILKAN TABEL TRANSAKSIGERAIYURA
select*from transaksigeraiyura;

-- UNTUK MENAMPILKAN BEBERAPA KOLOM (Id Pemesanan dan Nama Pembeli) DALAM TABEL PEMEBELIGERAIYURA 
select Id_Pemesanan, Nama_Pembeli from pembeligeraiyura;

-- UNTUK MENAMPILKAN BEBERAPA KOLOM (Id Pemesanan, Jenis Produk, Harga Produk, Jumlah pesanan, dan waktu pesanan) DALAM TABEL TRANSAKSIGERAIYURA
select Id_Pemesanan, Jenis_Produk1, Harga_Produk_MTGY01, Jumlah_Produk_MTGY01, Jenis_Produk2, Harga_Produk_STGY01, Jumlah_produk_STGY01, Waktu_Order from transaksigeraiyura;

-- UNTUK MELIHAT PELANGGAN DI CABANG LAMGUGOB
select*from transaksigeraiyura
where Cabang_Gerai = 'Lamgugob';

-- UNTUK MELIHAT PELANGGAN DI CABANG Ulee Lheue
select*from transaksigeraiyura
where Cabang_Gerai = 'Ulee Lheue';

-- UNTUK MELIHAT PELANGGAN DI CABANG Keutapang
select*from transaksigeraiyura
where Cabang_Gerai = 'Keutapang';

-- UNTUK MELIHAT PESANAN YANG DIBATALKAN
select*from transaksigeraiyura
where Status_Order = 'Pesanan batal';

-- UNTUK MELIHAT PESANAN YANG DIBATALKAN DI LAMGUGOB
select*from transaksigeraiyura
where Status_Order = 'Pesanan Batal' and Cabang_Gerai = 'Lamgugob';

-- UNTUK MELIHAT PESANAN MANGO THAI LEBIH DARI 2
select*from transaksigeraiyura
where Jumlah_Produk_MTGY01 > 2 or Jumlah_produk_STGY01 >= 0;

-- UNTUK MELIHAT PELANGGAN Ulee Lheue DENGAN LIKE
select*from transaksigeraiyura
where Cabang_Gerai like '%Ulee%';

-- UNTUK MELIHAT DATA DARI JAM 15:00:00 S/D 18:00:00 DI SEMUA CABANG 
select*from transaksigeraiyura
where Waktu_Order between '15:00:00' and '18:00:00';

-- UNTUK MELIHAT DATA DARI JAM 15:00:00 S/D 18:00:00 DI CABANG ULEE LHEUE
select*from transaksigeraiyura
where Waktu_Order between '15:00:00' and '18:00:00' and Cabang_Gerai = 'Ulee Lheue';

-- UNTUK MELIHAT PESANAN BATAL DATA DARI JAM 15:00:00 S/D 18:00:00 DI CABANG 
select*from transaksigeraiyura
where Status_Order = 'Pesanan batal' and Waktu_Order between '15:00:00' and '18:00:00';

-- UNTUK MELIHAT DATA PESANAN DI LAMGUGOB DAN KEUTAPANG
select*from transaksigeraiyura
where Cabang_Gerai IN ('Lamgugob', 'Keutapang');

-- UNTUK MEMBATASI HASIL QUERY (15 orang)
select*from transaksigeraiyura
order by Id_Pemesanan limit 15;

-- UNTUK MENAMPILKAN TOTAL PEMBAYARAN DARI SETIAP PELANGGAN
select Id_Pemesanan, Jenis_Produk1, Harga_Produk_MTGY01, Jumlah_Produk_MTGY01, Jenis_Produk2, Harga_Produk_STGY01, Jumlah_produk_STGY01, Waktu_Order, 
Harga_Produk_MTGY01*Jumlah_Produk_MTGY01+Harga_Produk_STGY01*Jumlah_produk_STGY01 as 'TOTAL PEMBAYARAN' from transaksigeraiyura;

-- UNTUK MENAMPILKAN PENGHASILAN SEHARI DARI SEMUA CABANG
select sum(Harga_Produk_MTGY01*Jumlah_Produk_MTGY01+Harga_Produk_STGY01*Jumlah_produk_STGY01) as 'TOTAL PENGHASILAN SEMUA CABANG' from transaksigeraiyura;

-- UNTUK MENAMPILKAN PENGHASILAN SEHARI DARI MASING-MASING CABANG
select sum(Harga_Produk_MTGY01*Jumlah_Produk_MTGY01+Harga_Produk_STGY01*Jumlah_produk_STGY01) as 'TOTAL PENGHASILAN MASING-MASING CABANG', Cabang_Gerai from transaksigeraiyura group by Cabang_Gerai;

-- UNTUK MENAMPILKAN TOTAL PENJUALAN PRODUK SEHARI DARI SEMUA CABANG
select sum(Jumlah_Produk_MTGY01+Jumlah_produk_STGY01) as 'TOTAL PENJUALAN CABANG' from transaksigeraiyura;

-- UNTUK MENAMPILKAN PENJUALAN PRODUK SEHARI DARI MASING-MASING CABANG
select sum(Jumlah_Produk_MTGY01+Jumlah_produk_STGY01) as 'TOTAL PENJUALAN MASING-MASING CABANG', Cabang_Gerai from transaksigeraiyura group by Cabang_Gerai;

-- UNTUK MENAMPILKAN PENJUALAN PRODUK MANGO THAI SEHARI DARI MASING-MASING CABANG
select sum(Jumlah_Produk_MTGY01) as 'TOTAL PENJUALAN MANGO THAI MASING-MASING CABANG', Cabang_Gerai from transaksigeraiyura group by Cabang_Gerai;

-- UNTUK MENAMPILKAN PENJUALAN PRODUK STRAWBWRRY SMOOTHIES SEHARI DARI MASING-MASING CABANG
select sum(Jumlah_Produk_STGY01) as 'TOTAL PENJUALAN STRAWBWRRY SMOOTHIES MASING-MASING CABANG', Cabang_Gerai from transaksigeraiyura group by Cabang_Gerai;

-- UNTUK MENAMPILKAN JUMLAH PELANGGAN SEHARI DARI MASING-MASING CABANG
select COUNT(Id_Pemesanan) as 'TOTAL PELANGGAN MASING-MASING CABANG', Cabang_Gerai from transaksigeraiyura group by Cabang_Gerai;

-- UNTUK MENAMPILKAN JUMLAH PELANGGAN HANYA MEMBELI MANGO THAI
select SUM(Jumlah_Produk_MTGY01 > 0 AND Jumlah_Produk_STGY01 = 0) as 'TOTAL PELANGGAN MASING-MASING CABANG' , Cabang_Gerai from transaksigeraiyura group by Cabang_Gerai;
 
-- UNTUK MENAMPILKAN JUMLAH PELANGGAN HANYA MEMBELI STRAWBERRY SMOOTHIES
select SUM(Jumlah_Produk_MTGY01 = 0 AND Jumlah_Produk_STGY01 > 0) as 'TOTAL PELANGGAN MASING-MASING CABANG' , Cabang_Gerai from transaksigeraiyura group by Cabang_Gerai;
 
-- UNTUK MENAMPILKAN JUMLAH PELANGGAN YANG MEMBELI KEDUA PRODUK
select SUM(Jumlah_Produk_MTGY01 > 0 AND Jumlah_Produk_STGY01 > 0) as 'TOTAL PELANGGAN MASING-MASING CABANG' , Cabang_Gerai from transaksigeraiyura group by Cabang_Gerai;
 
-- UNTUK MENGGABUNGKAN 2 TABEL MENGGUNAKAN INNER JOIN
select*from transaksigeraiyura
inner join pembeligeraiyura on (transaksigeraiyura.Id_Pemesanan = pembeligeraiyura.Id_Pemesanan);

-- UNTUK MENGGABUNGKAN 2 TABEL DENGAN KOLOM TERTENTU DAN MENAMPILKAN TOTAL YANG HARUS DIBAYAR SETIAP PELANGGAN
select pembeligeraiyura.Id_Pemesanan, pembeligeraiyura.Nama_Pembeli, transaksigeraiyura. Jumlah_Produk_MTGY01, transaksigeraiyura.Jumlah_Produk_STGY01, 
transaksigeraiyura.Waktu_Order, transaksigeraiyura.Status_Order, transaksigeraiyura.Cabang_Gerai, 
transaksigeraiyura.Harga_Produk_MTGY01*Jumlah_Produk_MTGY01+Harga_Produk_STGY01*Jumlah_produk_STGY01 as 'TOTAL PEMBAYARAN'
from transaksigeraiyura
inner join pembeligeraiyura on (transaksigeraiyura.Id_Pemesanan = pembeligeraiyura.Id_Pemesanan);