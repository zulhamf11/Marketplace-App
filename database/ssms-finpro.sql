
----
-- CREATE for Diskon Table
----

CREATE TABLE Diskon (
	IDDiskon CHAR(6) NOT NULL,
	NamaDiskon VARCHAR(50),
	Deskripsi VARCHAR(150),
	PersenDiskon DECIMAL,
	PRIMARY KEY (IDDiskon),
	CONSTRAINT CHK_Diskon CHECK(
		IDDiskon LIKE 'DSK[0-9][0-9][0-9]'
	)
);


----
-- CREATE for Member Table
----

CREATE TABLE Member (
	IDMember CHAR(6) NOT NULL,
	IDDiskon CHAR(6) NOT NULL,
	JenisMember VARCHAR(25),
	PRIMARY KEY (IDMember),
	CONSTRAINT FK_Member_Diskon FOREIGN KEY (IDDiskon)
	REFERENCES Diskon (IDDiskon)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT CHK_Member_ID CHECK(
		IDMember LIKE 'MBR[0-9][0-9][0-9]'
	)
);

----
-- CREATE for Alamat Table
----

CREATE TABLE Alamat (
	IDAlamat CHAR(6) NOT NULL,
	NamaJalan  VARCHAR(150),
	Kota VARCHAR(50),
	Kelurahan VARCHAR(50),
	Kabupaten VARCHAR(50),
	KodePost VARCHAR(10),
	PRIMARY KEY (IDAlamat),
	CONSTRAINT CHK_Alamat CHECK (
		IDAlamat LIKE 'ALM[0-9][0-9][0-9]'
	)
);

----
-- CREATE for Pelanggan Table
----

CREATE TABLE Pelanggan (
    IDPelanggan CHAR(6) NOT NULL,
	IDMember CHAR(6) NOT NULL,
	IDAlamat CHAR(6) NOT NULL,
    NamaPelanggan VARCHAR(50),
    JenisKelamin VARCHAR(10),
    NoHpPelanggan VARCHAR(13),
    PRIMARY KEY (IDPelanggan),
	CONSTRAINT FK_Pelanggan_Member FOREIGN KEY (IDMember) 
	REFERENCES Member (IDMember)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_Pelanggan_Alamat FOREIGN KEY (IDAlamat)
	REFERENCES Alamat (IDAlamat)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT CHK_Pelanggan CHECK(
        IDPelanggan LIKE 'PLG[0-9][0-9][0-9]' AND
        JenisKelamin LIKE 'Laki-laki' OR JenisKelamin LIKE 'Perempuan'
	)
);

----
-- CREATE for Pegawai Table
----

CREATE TABLE Pegawai (
    IDPegawai CHAR(6) NOT NULL,
    NamaPegawai VARCHAR(50),
    JenisKelamin VARCHAR(10),
    NoHpPegawai VARCHAR(13),
    EmailPegawai VARCHAR(100),
    PosisiPegawai VARCHAR(20),
	PendapatanPegawai NUMERIC(11, 2),
    PRIMARY KEY (IDPegawai),
	CONSTRAINT CHK_Pegawai CHECK(
        IDPegawai LIKE 'PGW[0-9][0-9][0-9]' AND
        JenisKelamin LIKE 'Laki-laki' OR JenisKelamin LIKE 'Perempuan'
	)
);

----
-- CREATE for Produk Table
----

CREATE TABLE KategoriHewan (
    IDKategoriHewan CHAR(6) NOT NULL,
    NamaKategoriHewan VARCHAR(50),
    PRIMARY KEY (IDKategoriHewan),
	CONSTRAINT CHK_KategoriHewan CHECK (
        IDKategoriHewan IN ('TPP[0-9][0-9][0-9]', 'TPA[0-9][0-9][0-9]', 'TPO[0-9][0-9][0-9]')
	)
);

----
-- CREATE for Supplier Table
----

CREATE TABLE Supplier (
	IDSupplier CHAR(6) NOT NULL,
	NamaSupplier VARCHAR(150),
	NoTelp VARCHAR(13),
	PRIMARY KEY (IDSupplier),
	CONSTRAINT CHK_ID_Supp CHECK (
		IDSupplier LIKE 'SPL[0-9][0-9][0-9]'
	)
);

----
-- CREATE for Produk Table
----

CREATE TABLE Produk (
    IDProduk CHAR(6) NOT NULL,
    IDKategoriHewan CHAR(6) NOT NULL,
	IDSupplier CHAR(6) NOT NULL,
    NamaProduk VARCHAR(50),
    Harga NUMERIC(11,2),
	Stok INT,
    PRIMARY KEY (IDProduk),
    CONSTRAINT FK_Tipe_Produk FOREIGN KEY (IDKategoriHewan) 
	REFERENCES KategoriHewan(IDKategoriHewan)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_Supp_Produk FOREIGN KEY (IDSupplier)
	REFERENCES Supplier (IDSupplier)
    ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT CHK_Produk CHECK (
        IDProduk LIKE 'PRD[0-9][0-9][0-9]' 
	)
);

----
-- CREATE for JenisPengiriman Table
----

CREATE TABLE JenisPengiriman (
    IDJenisPengiriman CHAR(5) NOT NULL,
    JenisPengiriman VARCHAR(50),
    PRIMARY KEY(IDJenisPengiriman),
	CONSTRAINT CHK_JenisPengiriman CHECK(
        IDJenisPengiriman LIKE 'JPIns' OR 
		IDJenisPengiriman LIKE 'JPReg' OR 
		IDJenisPengiriman LIKE 'JPCar'
	)
);

----
-- CREATE for Pengiriman Table
----

CREATE TABLE Pengiriman (
    IDPengiriman CHAR(6) NOT NULL,
	IDJenisPengiriman CHAR(5) NOT NULL,
    IDPegawai CHAR(6) NOT NULL,
	NoResi VARCHAR(11), 
	TanggalEstimasi DATE,
	TanggalSampai DATE,
    PRIMARY KEY(IDPengiriman),
    CONSTRAINT FK_Jen_Kirim FOREIGN KEY(IDJenisPengiriman)
	REFERENCES JenisPengiriman (IDJenisPengiriman)
    ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_Nama_Kurir FOREIGN KEY(IDPegawai)
	REFERENCES Pegawai (IDPegawai)
    ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT CHK_Pengiriman CHECK(
        IDPengiriman LIKE 'PEN[0-9][0-9][0-9]'
	)
);

----
-- CREATE for Transaksi Table
----

CREATE TABLE Transaksi ( 
    IDTransaksi CHAR(6) NOT NULL,
    IDPelanggan CHAR(6) NOT NULL, 
	IDPegawai CHAR(6) NOT NULL,
	IDProduk CHAR(6) NOT NULL,
	JumlahBarang INT,
	MetodePembayaran VARCHAR(25),
	TanggalTransaksi DATE,
    PRIMARY KEY (IDTransaksi),
	CONSTRAINT FK_Trans_Pegawai FOREIGN KEY (IDPegawai)
	REFERENCES Pegawai (IDPegawai),
    CONSTRAINT FK_Trans_Cust FOREIGN KEY (IDPelanggan) 
	REFERENCES Pelanggan (IDPelanggan),
	CONSTRAINT FK_Trans_Prod FOREIGN KEY (IDPelanggan)
	REFERENCES Produk (IDProduk),
	CONSTRAINT CHK_Trans_ID CHECK (
        IDTransaksi LIKE 'TRA[0-9][0-9][0-9]'
	)
);

----
-- CREATE for Produk Pembayaran
----

CREATE TABLE Pembayaran ( 
    IDPembayaran CHAR(6) NOT NULL,
	IDTransaksi CHAR(6) NOT NULL,
    TanggalPembayaran DATE,
	Total NUMERIC(11, 2),
	Status VARCHAR(50),
    PRIMARY KEY(IDPembayaran),
	CONSTRAINT FK_Bayar_Trans FOREIGN KEY (IDTransaksi)
	REFERENCES Transaksi (IDTransaksi)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT CHK_Pembayaran CHECK (
        IDPembayaran LIKE 'PEM[0-9][0-9][0-9]' 
	)
);

-- CREATE for Keranjang Table
----

CREATE TABLE Keranjang (
	IDKeranjang CHAR(6) NOT NULL,
	IDPelanggan CHAR(6) NOT NULL,
	IDProduk CHAR(6) NOT NULL,
	Jumlah INT,
	PRIMARY KEY (IDKeranjang),
	CONSTRAINT FK_Cart_Prod FOREIGN KEY (IDProduk)
	REFERENCES Produk (IDProduk)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_Cart_Cust FOREIGN KEY (IDPelanggan)
	REFERENCES Pelanggan (IDPelanggan)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT CHK_Keranjang CHECK (
		IDKeranjang LIKE 'KRJ[0-9][0-9][0-9]'
	)
);

----
-- CREATE for DetailPenjualan Table
----

CREATE TABLE DetailPenjualan (
    IDTransaksi CHAR(6) NOT NULL,
    IDProduk CHAR(6) NOT NULL,
    PRIMARY KEY (IDTransaksi, IDProduk),
    CONSTRAINT FK_DP_Trans FOREIGN KEY (IDTransaksi) 
	REFERENCES Transaksi (IDTransaksi)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_DP_Prod FOREIGN KEY (IDProduk) 
	REFERENCES Produk (IDProduk)
    ON UPDATE CASCADE ON DELETE CASCADE
);
