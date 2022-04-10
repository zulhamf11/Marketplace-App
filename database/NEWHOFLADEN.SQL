----
-- CREATE for Diskon Table
----

CREATE TABLE Diskon (
	IDDiskon CHAR(6) NOT NULL,
	NamaDiskon VARCHAR(50),
	Deskripsi VARCHAR(150),
	PersenDiskon DECIMAL(5,2),
	PRIMARY KEY (IDDiskon),
	CONSTRAINT CHK_Diskon CHECK(
		IDDiskon LIKE 'DSK[0-9][0-9][0-9]'
	)
);

----
-- Insertion Diskon Table
----
INSERT INTO Diskon VALUES
('DSK001', 'HOFLADEN20', 'Diskon 20% sampai dengan 20rb', 0.2),
('DSK002', 'HOFLADEN30', 'Diskon 30% sampai dengan 25rb', 0.3),
('DSK003', 'HOFLADEN40', 'Diskon 40% sampai dengan 30rb', 0.4),
('DSK004', 'HOFLADEN50', 'Diskon 50% sampai dengan 35rb', 0.5),
('DSK005', 'HOFLADEN60', 'Diskon 60% sampai dengan 40rb', 0.6),
('DSK006', 'HOFLADEN70', 'Diskon 70% sampai dengan 50rb', 0.7)

SELECT * FROM Diskon

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
-- Insertion for Member Table
----

INSERT INTO Member VALUES
('MBR001', 'DSK001', 'Reguler'),
('MBR002', 'DSK002', 'Bronze'),
('MBR003', 'DSK003', 'Silver'),
('MBR004', 'DSK004', 'Gold'),
('MBR005', 'DSK005', 'Platinum'),
('MBR006', 'DSK006', 'Diamond')

SELECT * FROM Member

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
-- Insertion for Alamat Table
----

INSERT INTO Alamat VALUES
('ALM001', 'Jln Raya Timun Mas No 2', 'Malang', 'Sukojati', 'Sukonatar', '125923'),
('ALM002', 'Jln Raya Bantur No 1', 'Ambon', 'Parlente', 'Sapunya', '345102'),
('ALM003', 'Jln Raya Doktor Viana No 3', 'Malang', 'Mangliawan', 'Penataran', '325102'),
('ALM004', 'Jln Pakisaji No 30', 'Banyuwangu', 'Banyuasin', 'Tukangkayu', '512663'),
('ALM005', 'Jln Ujung Timur No 20', 'Batu', 'Batu', 'Nisan', '601241'),
('ALM006', 'Jln Diponegoro No 15', 'Surabaya', 'Srikandi', 'Jeruk Purut', '311231'),
('ALM007', 'Jln Wonorejo No 25', 'Malang', 'Kopag', 'Klojen', '119424'),
('ALM008', 'Jln Kertanegara No 34', 'Banyuwangi', 'Brawijaya', 'Sumber Rejeki', '538192'),
('ALM009', 'Jln Suropati No 9', 'Batu', 'Sidomulyo', 'Paralayang', '642312'),
('ALM010', 'Jln Ujung Barat No 22', 'Kediri', 'Kediri', 'Zulcin', '511923'),
('ALM011', 'Jln Kawi No 45', 'Sumba', 'Susagil', 'Aqilatta', '428199'),
('ALM012', 'Jln Tumapel No 29', 'Batu', 'Sengawan', 'Temas', '644192'),

('ALM013', 'Jln Thamrin No 10', 'Ambon', 'Mastrip', 'Indagiri', '320100'),
('ALM014', 'Jln Raya Darmo Kali No 30', 'Surabaya', 'Kuningan', 'Tidar', '512000'),
('ALM015', 'Jln Ujung Selatan No 20', 'Jatinagor', 'Sumur', 'Nasa', '125432'),
('ALM016', 'Jln Jagir Wonokromo No 13', 'Surabaya', 'Surkandi', 'Lemon Purut', '311098'),
('ALM017', 'Jln Mayjen No 78', 'Malang', 'Batu', 'Wonokromo', '119987'),
('ALM018', 'Jln Bangkingan No 33', 'Banyuwangi', 'Pura', 'Sri Handi', '090192'),
('ALM019', 'Jln Kutisari Utara No 23', 'Ternate', 'Kendangsari', 'Tenggilis', '642983'),
('ALM020', 'Jln Sumur Welut No 66', 'Kupang', 'Gajah', 'Melati', '511111'),
('ALM021', 'Jln Sukosemolo', 'Jakarta', 'Klampis', 'Gebang', '428879'),
('ALM022', 'Jln Medokan Putih No 29', 'Purwokerto', 'Deles', 'Semolowaru', '644122'),

('ALM023', 'Jln loda pare No 2', 'Sumba Barat', 'Waikabubak', 'Loda Pare', '650231'),
('ALM024', 'Jln Achmad Yani No 31', 'Sumba Timur', 'Waingapu', 'Sandalwod', '486942'),
('ALM025', 'Jln Mariana No 15', 'Kalimantan Selatan', 'Banjarmasin', 'Punuhan', '601241'),
('ALM026', 'Jln Wojak No 25', 'Jakarta', 'Jakarta Barat', 'Dahlia', '1098642'),
('ALM027', 'Jln Gwej No 8', 'Probolinggo', 'Kapuas', 'Brantas', '118763'),
('ALM028', 'Jln Bilek No 4', 'Daerah Istimewah Yogyakarta', 'Sarkem', 'Kembang Rejeki', '201273'),
('ALM029', 'Jln Murakaf No 7', 'Banjarmasin', 'Banjarmasin Tengah', 'Kapuas', '238312'),
('ALM030', 'Jln Dahlia No 2', 'Bandar Lampung', 'Tanjung Karang Barat', 'Bonjol', '582943'),
('ALM031', 'Jln YNTKS No 9', 'Jawa Tengah', 'Surakarta', 'Kanthil', '498563'),
('ALM032', 'Jln Cino No 3', 'Malang', 'Blimbing', 'Cakalang', '672192'),

('ALM033', 'Jln Arief Rachman Hakim No 3', 'Semarang', 'Menur', 'Pumpungan', '325098'),
('ALM034', 'Jln Klampis Jaya No 32', 'Manado', 'Manyar', 'Kertoadi', '512098'),
('ALM035', 'Jln Nginden Semolo No 23', 'Surakarta', 'Mleto', 'Kalisari', '601942'),
('ALM036', 'Jln Manyar Kertoadi No 20', 'Tegal', 'Mulyosari', 'Jeruk Limau', '311431'),
('ALM037', 'Jln Kejawan Putih Tambak No 12', 'Jogja', 'Indasari', 'Labansari', '119909'),
('ALM038', 'Jln Kertajaya Indah No 34', 'Pare', 'Sandijaya', 'Sumber Hidup', '538222'),
('ALM039', 'Jln Prof. Dr. Moestopo No 10', 'Jakarta', 'Sedoyo', 'Kali Jaya', '622312'),
('ALM040', 'Jln Ngagel Jaya No 88', 'Surabaya', 'Gubeng', 'Airlangga', '511888'),
('ALM041', 'Jln Pucang Anom Timur No 41', 'Sulawesi', 'Makassar', 'Menur', '428676'),
('ALM042', 'Jln Bratang Binangun No 89', 'Sidoarjo', 'Karimun', 'Pandeggling', '644124'),
('ALM043', 'Jln Embong Malang No 20', 'Suarabaya', 'Tegalsari', 'Dukuh', '090241'),
('ALM044', 'Jln Kombes Pol Duryat No 15', 'Surabaya', 'Pregolan', 'Kalibutuh', '311098'),
('ALM045', 'Jln Kramat Gantung No 25', 'Lampung', 'Pusat', 'Dupak', '119231'),
('ALM046', 'Jln Londo No 12', 'Jawa Tengah', 'Solo', 'Juago', '564712'),
('ALM047', 'Jln Gabus No 4', 'Jawa Timur', 'Surabaya', 'Pakuwon', '321876'),
('ALM048', 'Jln Judas No 55', 'Nusa Tenggara Timur', 'Ende', 'Pancis', '857362'),
('ALM049', 'Jln Paulus No 69', 'Nusa Tenggara Timur', 'Kupang', 'Santoso', '986324'),
('ALM050', 'Jln Weibo No 86', 'Banten', 'Tanggerang', 'Kutabumi', '213892')

SELECT * FROM Alamat

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
-- Insertion for Pelanggan Table
----

INSERT INTO Pelanggan VALUES  
('PLG001', 'MBR001', 'ALM001', 'Debora Wijaya', 'Perempuan', '085123456789'),
('PLG002', 'MBR002', 'ALM002', 'Arinda Putri', 'Perempuan', '085233556677'),
('PLG003', 'MBR003', 'ALM003', 'Mamamatma Ditya', 'Laki-laki', '085987654321'),
('PLG004', 'MBR004', 'ALM004', 'Amelia Ayu', 'Perempuan', '082392860463'),
('PLG005', 'MBR005', 'ALM005', 'Faradina Kyla', 'Perempuan', '083567895468'),
('PLG006', 'MBR006', 'ALM006', 'Radinka Syabila', 'Perempuan', '083433556699'),
('PLG007', 'MBR002', 'ALM007', 'Andi Risky', 'Laki-laki', '089345612638'),
('PLG008', 'MBR003', 'ALM008', 'I Putu Diego Savitra', 'Laki-laki', '085213765989'),
('PLG009', 'MBR004', 'ALM009', 'Cindy Bell', 'Perempuan', '083478650900'),
('PLG010', 'MBR001', 'ALM010', 'Gilang Bruce', 'Laki-laki', '082002060454'),

('PLG011', 'MBR001', 'ALM011', 'Valencia Ballerina', 'Perempuan', '085345458789'),
('PLG012', 'MBR002', 'ALM012', 'Aulia Apriliani', 'Perempuan', '081200556600'),
('PLG013', 'MBR003', 'ALM013', 'Aditya Lee', 'Laki-laki', '085997094321'),
('PLG014', 'MBR004', 'ALM014', 'Aska Patricia', 'Perempuan', '089390900463'),
('PLG015', 'MBR005', 'ALM015', 'Puput Syahrini', 'Perempuan', '083987998409'),
('PLG016', 'MBR005', 'ALM016', 'Ariza Marissa', 'Perempuan', '082333806699'),
('PLG017', 'MBR006', 'ALM017', 'Cheryl Malika', 'Perempuan', '080045902638'),
('PLG018', 'MBR002', 'ALM018', 'Riska Amanda', 'Perempuan', '080913709989'),
('PLG019', 'MBR003', 'ALM019', 'Yumi Arkila', 'Perempuan', '0898478890900'),
('PLG020', 'MBR002', 'ALM020', 'Chaca Pricilia', 'Perempuan', '082092980454'),

('PLG021', 'MBR004', 'ALM021', 'Zizi Olaf', 'Perempuan', '085178456700'),
('PLG022', 'MBR006', 'ALM022', 'Elsa Anandika', 'Perempuan', '081233576677'),
('PLG023', 'MBR005', 'ALM023', 'Chaska Fitria', 'Perempuan', '085935644321'),
('PLG024', 'MBR004', 'ALM024', 'Linda Melinda', 'Perempuan', '085396860463'),
('PLG025', 'MBR002', 'ALM025', 'Wahyu Teddy', 'Laki-laki', '083117815468'),
('PLG026', 'MBR003', 'ALM026', 'Cassie Sandrina', 'Perempuan', '081463566699'),
('PLG027', 'MBR001', 'ALM027', 'Pipit Sarina', 'Perempuan', '082346612618'),
('PLG028', 'MBR001', 'ALM028', 'Gopal Boy', 'Laki-laki', '085223755889'),
('PLG029', 'MBR002', 'ALM029', 'Doddy Suhartono', 'Laki-laki', '083318750900'),
('PLG030', 'MBR003', 'ALM030', 'Juan Juffana', 'Laki-laki', '081002010454'),

('PLG031', 'MBR004', 'ALM031', 'Asti Alizandra', 'Perempuan', '085100400789'),
('PLG032', 'MBR002', 'ALM032', 'Alif Oscar', 'Laki-laki', '088233446699'),
('PLG033', 'MBR002', 'ALM033', 'Ali Perry', 'Laki-laki', '083987954029'),
('PLG034', 'MBR003', 'ALM034', 'Patrick Pearl', 'Laki-laki', '088390860163'),
('PLG035', 'MBR004', 'ALM035', 'Tania Talitha', 'Perempuan', '088569895068'),
('PLG036', 'MBR005', 'ALM036', 'Safa Adelia', 'Perempuan', '083533856690'),
('PLG037', 'MBR001', 'ALM037', 'Budi Yanto', 'Laki-laki', '087348612638'),
('PLG038', 'MBR001', 'ALM038', 'Cakra Basuki', 'Laki-laki', '080117700989'),
('PLG039', 'MBR001', 'ALM039', 'Chairul Daniel', 'Laki-laki', '081470050900'),
('PLG040', 'MBR001', 'ALM040', 'Denny Darwin', 'Laki-laki', '082222160400'),

('PLG041', 'MBR004', 'ALM041', 'Doni Joker', 'Laki-laki', '085785456789'),
('PLG042', 'MBR005', 'ALM042', 'Eddy Pramono', 'Laki-laki', '081237856677'),
('PLG043', 'MBR006', 'ALM043', 'Ronald Iskandar', 'Laki-laki', '081800654322'),
('PLG044', 'MBR004', 'ALM044', 'Erwin Setiawan', 'Laki-laki', '081292964463'),
('PLG045', 'MBR002', 'ALM045', 'Franky Widjoyo', 'Laki-laki', '083835895463'),
('PLG046', 'MBR002', 'ALM046', 'Franko Usman', 'Laki-laki', '083413556699'),
('PLG047', 'MBR002', 'ALM047', 'Gino Budiarso', 'Laki-laki', '081300617238'),
('PLG048', 'MBR001', 'ALM048', 'Glenn Alaska', 'Laki-laki', '081219765999'),
('PLG049', 'MBR001', 'ALM049', 'Axel Arkadabra', 'Laki-laki', '081468690900'),
('PLG050', 'MBR001', 'ALM050', 'Lexi Gunawan', 'Laki-laki', '082112161452')

SELECT * FROM Pelanggan

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
        (IDPegawai LIKE 'PGW[0-9][0-9][0-9]') AND
        JenisKelamin LIKE 'Laki-laki' OR JenisKelamin LIKE 'Perempuan'
	)
);

----
-- Insertion for Pegawai Table
----

INSERT INTO Pegawai VALUES
('PGW001', 'Alkina Syahran', 'Perempuan', '081345765431', 'alkina021@gmail.com','Staff', 4000000),
('PGW002', 'Rahman Darmawan', 'Laki-laki', '089213421234', 'darma981@gmail.com','Kurir', 1200000),
('PGW003', 'Mamahma Mahmudah', 'Perempuan', '082543654231', 'mamahma2121@gmail.com', 'Staff', 3500000),
('PGW004', 'Rohmatu Hasana', 'Laki-laki', '085257821908', 'rhmahasana312@gmail.com', 'Staff', 4000000),
('PGW005', 'Arman Armana', 'Laki-laki', '081342234561', 'armanaarman432@gmail.com', 'Kurir', 1200000),
('PGW006', 'Herman Gunawan', 'Laki-laki', '086542123456', 'hermang22@gmail.com', 'Kurir', 1200000),
('PGW007', 'Aqillah Asyifa', 'Perempuan', '081323232334', 'asyifaaq78@gmail.com', 'Staff', 3500000),
('PGW008', 'Akmal Raditya', 'Laki-laki', '080983421234', 'akmalrad534@gmail.com', 'Kurir', 1200000),
('PGW009', 'Bobby Ardiansyah', 'Laki-laki', '082345654251', 'bobby20021@gmail.com', 'Staff', 4000000),
('PGW010', 'Kinan Kalandra', 'Perempuan', '081357822900', 'kalankinan645@gmail.com', 'Staff', 3500000),
('PGW011', 'Lydia Danira', 'Perempuan', '083322244562', 'lydiacomel3333@gmail.com', 'Kurir', 1200000),
('PGW012', 'Rafis Pramudya', 'Laki-laki', '088979823488', 'rafisrafisss666@gmail.com', 'Kurir', 1200000),
('PGW013', 'Aldina Mariana', 'Perempuan', '082334775421', 'aldina2@gmail.com', 'Staff', 4000000),
('PGW014', 'Ariska Peterina', 'Perempuan', '083111421334', 'ariskp123@gmail.com', 'Kurir', 1300000),
('PGW015', 'Bright Imanuel', 'Laki-laki', '082568694121', 'bright@gmail.com', 'Staff', 4000000),
('PGW016', 'Benny Rizky', 'Laki-laki', '086357721998', 'benriz33@gmail.com', 'Staff', 3500000),
('PGW017', 'Putra Dwi Purnomo', 'Laki-laki', '083332234561', 'putdi23@gmail.com',  'Kurir', 1200000),
('PGW018', 'Bobby Bob', 'Laki-laki', '083901123455', 'bobbob456@gmail.com', 'Kurir', 1400000),
('PGW019', 'Carolina Papper', 'Perempuan', '081324242424', 'carper238@gmail.com', 'Staff', 3500000),
('PGW020', 'Aqilsya Chan', 'Perempuan', '087881121232', 'aqchan09@gmail.com', 'Kurir', 500000),
('PGW021', 'Deska Queelina', 'Perempuan', '081346754281', 'Desquel230@gmail.com', 'Staff', 4000000),
('PGW022', 'Aldinansa kalender', 'Laki-laki', '081687820000', 'kaladina34@gmail.com', 'Staff', 4000000),
('PGW023', 'Muhammad Kristian', 'Laki-laki', '081688920000', 'Kristian96@gmail.com', 'Staff', 4000000),
('PGW024', 'Lumi Siskawati', 'Perempuan', '082222224567', 'siswati87@gmail.com', 'Kurir', 1300000),
('PGW025', 'Tasya Rindy', 'Perempuan', '088999234890', 'tasrindy01@gmail.com', 'Kurir', 1200000)

SELECT * FROM Pegawai

----
-- CREATE for KategoriHewan Table
----

CREATE TABLE KategoriHewan (
    IDKategoriHewan CHAR(6) NOT NULL,
    NamaKategoriHewan VARCHAR(50),
    PRIMARY KEY (IDKategoriHewan),
	CONSTRAINT CHK_KategoriHewan CHECK (
        IDKategoriHewan LIKE 'TPP[0-9][0-9][0-9]' OR IDKategoriHewan LIKE 'TPA[0-9][0-9][0-9]' 
		OR IDKategoriHewan LIKE 'TPO[0-9][0-9][0-9]'
	)
);

----
-- Insertion for KategoriHewan Table
----

INSERT INTO KategoriHewan VALUES
('TPP001', 'Babi'), 
('TPP002', 'Burung'), 
('TPP003', 'Ikan'), 
('TPP004', 'Itik'), 
('TPP005', 'Ayam'),
('TPA006', 'Babi'),
('TPA007', 'Burung'),
('TPA008', 'Ikan'),
('TPA009', 'Itik'),
('TPA010', 'Ayam'), 
('TPO011', 'Babi'), 
('TPO012', 'Burung'), 
('TPO013', 'Ikan'),
('TPO014', 'Itik'), 
('TPO015', 'Ayam') 

SELECT * FROM KategoriHewan

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
-- Insertion for Supplier Table
----

INSERT INTO Supplier VALUES
('SPL001', 'Aqila Susanti', '089920221940'),
('SPL002', 'Zuliana Hamizah', '082195011801'),
('SPL003', 'Vira Annabele', '089866762872'),
('SPL004', 'Bambang Utang', '082921475436'),
('SPL005', 'I Putu Zulham', '081612113351'),
('SPL006', 'Salsa Marata', '082115367471'),
('SPL007', 'I Ketut Aqil', '084847368932'),
('SPL008', 'Selamet Heri Pahlawan', '083693068654'),
('SPL009', 'Agus Nur Saiton', '081606899478'),
('SPL010', 'Sekar Dus Ratnasari', '085778326723'),
('SPL011', 'Adina Saputri', '082930435130'),
('SPL012', 'Ravenya Ashilla', '082104211100'),
('SPL013', 'Lovely Fun', '081264762882'),
('SPL014', 'Aldi Didikan Ortu', '082914475427'),
('SPL015', 'Velove Astika', '083618311151'),
('SPL016', 'Ade Catherine', '082317567771'),
('SPL017', 'Indah Anggreini', '082847888932'),
('SPL018', 'Andrew Thomas', '083690637654'),
('SPL019', 'Andika Kusuma', '081968990078'),
('SPL020', 'Anwar Siswanto', '081788326765')

SELECT * FROM Supplier


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
	REFERENCES KategoriHewan (IDKategoriHewan)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_Supp_Produk FOREIGN KEY (IDSupplier)
	REFERENCES Supplier (IDSupplier)
    ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT CHK_Produk CHECK (
        IDProduk LIKE 'PRD[0-9][0-9][0-9]' 
	)
);

----
-- Insertion for Produk Table
----

INSERT INTO Produk VALUES
('PRD001', 'TPP001', 'SPL001', 'Pakan Babi Yorkshire',50000, '100'),
('PRD002', 'TPP001', 'SPL001', 'Pakan Babi Duroc',50000, '100'),
('PRD003', 'TPP001', 'SPL001', 'Pakan Babi Hampshire',50000, '100'),
('PRD004', 'TPP002', 'SPL002', 'Pakan Burung Puyuh',70000, '100'),
('PRD005', 'TPP002', 'SPL002', 'Pakan Burung Lovebird',70000, '100'),
('PRD006', 'TPP002', 'SPL002', 'Pakan Burung Perkutut',70000, '100'),
('PRD007', 'TPP002', 'SPL002', 'Pakan Burung Kenari',70000, '100'),
('PRD008', 'TPP003', 'SPL003', 'Pakan Ikan Koi',20000, '100'),
('PRD009', 'TPP003', 'SPL003', 'Pakan Ikan Lele',20000, '100'),
('PRD010', 'TPP003', 'SPL003', 'Pakan Ikan Cupang',20000, '100'),
('PRD011', 'TPP003', 'SPL003', 'Pakan Ikan Louhan',20000, '100'),
('PRD012', 'TPP004', 'SPL004', 'Pakan Itik Pedaging',25000, '100'),
('PRD013', 'TPP004', 'SPL005', 'Pakan Itik Petelur',25000, '100'),
('PRD014', 'TPP005', 'SPL006', 'Pakan Ayam Aduan',15000, '100'),
('PRD015', 'TPP005', 'SPL006', 'Pakan Ayam Pedaging',15000, '100'),
('PRD016', 'TPP005', 'SPL006', 'Pakan Ayam Petelur',15000, '100'),
('PRD017', 'TPA010', 'SPL006', 'Keranjang Ayam',25000, '100'),
('PRD018', 'TPA010', 'SPL006', 'Alat Pemanas Kandang Ayam',1200000, '50'),
('PRD019', 'TPA010', 'SPL006', 'Tempat Pakan Ayam',25000, '100'),
('PRD020', 'TPA010', 'SPL006', 'Tempat Minum Ayam',25000, '100'),
('PRD021', 'TPA008', 'SPL007', 'Aquarium',80000, '100'),
('PRD022', 'TPA010', 'SPL008', 'Water Pressure Chick',70000, '100'),
('PRD023', 'TPA007', 'SPL009', 'Kandang burung',60000, '100'),
('PRD024', 'TPA007', 'SPL009', 'Tempat makan dan minum burung',15000, '100'),
('PRD025', 'TPA008', 'SPL010', 'Dispenser Makanan Ikan',150000, '100'),
('PRD026', 'TPA008', 'SPL010', 'Pompa Oksigen ikan',50000, '100'),
('PRD027', 'TPO012', 'SPL011', 'Vitasol High',40000, '100'),
('PRD028', 'TPO015', 'SPL011', 'Vita Chicks',4000, '100'),
('PRD029', 'TPO013', 'SPL012', 'Betta Booster',25000, '100'),
('PRD030', 'TPO011', 'SPL013', 'Wormzol B',28000, '100')

SELECT * FROM Produk


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

DROP TABLE JenisPengiriman

----
-- Insertion for JenisPengiriman Table
----

INSERT INTO JenisPengiriman VALUES
('JPIns', 'Instant'),
('JPReg', 'Reguler'),
('JPCar', 'Cargo')

SELECT * FROM JenisPengiriman
 

----
-- CREATE for Pengiriman Table
----


----
-- CREATE for Pengiriman Table
----

CREATE TABLE Pengiriman (
    IDPengiriman CHAR(6) NOT NULL,
    IDTransaksi CHAR(6) NOT NULL,
	IDJenisPengiriman CHAR(5) NOT NULL,
    IDPegawai CHAR(6) NOT NULL,
	NoResi VARCHAR(11), 
	TanggalEstimasi DATE,
	TanggalSampai DATE,
    PRIMARY KEY(IDPengiriman),
    CONSTRAINT FK_Jen_Kirim FOREIGN KEY(IDJenisPengiriman)
	REFERENCES JenisPengiriman (IDJenisPengiriman),
	CONSTRAINT FK_Nama_Kurir FOREIGN KEY (IDPegawai)
	REFERENCES Pegawai (IDPegawai),
	CONSTRAINT FK_Kirim_PGW FOREIGN KEY (IDTransaksi)
	REFERENCES Transaksi (IDTransaksi),
	CONSTRAINT CHK_Pengiriman CHECK(
        IDPengiriman LIKE 'PEN[0-9][0-9][0-9]'
	)
);


----
-- Insertion for Pengiriman Table
----

INSERT INTO Pengiriman VALUES
('PEN001', 'JPIns', 'TRS001', 'PGW020','62997426663', '2022/01/02', '2022/01/03'),
('PEN002', 'JPIns', 'TRS002', 'PGW008','14515970027', '2022/01/02', '2022/01/06'),
('PEN003', 'JPIns', 'TRS003', 'PGW005','59940784870', '2022/01/06', '2022/01/07'),
('PEN004', 'JPIns', 'TRS004', 'PGW018','59940784870', '2022/01/10', '2022/01/10'),
('PEN005', 'JPReg', 'TRS005', 'PGW014','67493437833', '2022/01/10', '2022/01/11'),
('PEN006', 'JPReg', 'TRS006', 'PGW025','24381545758', '2022/01/17', '2022/01/17'),
('PEN007', 'JPReg', 'TRS007', 'PGW011','24381545758', '2022/01/19', '2022/01/19'),
('PEN008', 'JPReg', 'TRS008', 'PGW025','24381545758', '2022/01/20', '2022/01/20'),
('PEN009', 'JPReg', 'TRS009', 'PGW017','47580126966', '2022/01/23', '2022/01/25'),
('PEN010', 'JPReg', 'TRS010', 'PGW012','86255795263', '2022/01/28', '2022/01/28'),
('PEN011', 'JPReg', 'TRS011', 'PGW011','47400871879', '2022/01/29', '2022/01/29'),
('PEN012', 'JPCar', 'TRS012', 'PGW002','51913576474', '2022/02/04', '2022/02/05'),
('PEN013', 'JPCar', 'TRS013', 'PGW024','51913576474', '2022/02/06', '2022/02/07'),
('PEN014', 'JPCar', 'TRS014', 'PGW008','51913576474', '2022/02/05', '2022/02/05'),
('PEN015', 'JPCar', 'TRS015', 'PGW006','51913576474', '2022/02/21', '2022/02/21')

SELECT * FROM Pengiriman


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
-- Insertion for Keranjang Table
----

INSERT INTO Keranjang VALUES
('KRJ001', 'PLG001', 'PRD001', '20'),
('KRJ002', 'PLG002', 'PRD002', '3'),
('KRJ003', 'PLG003', 'PRD003', '23'),
('KRJ004', 'PLG004', 'PRD004', '8'),
('KRJ005', 'PLG005', 'PRD005', '5'),
('KRJ006', 'PLG006', 'PRD006', '12'),
('KRJ007', 'PLG007', 'PRD007', '19'),
('KRJ008', 'PLG008', 'PRD008', '8'),
('KRJ009', 'PLG009', 'PRD009', '15'),
('KRJ010', 'PLG010', 'PRD010', '30'),
('KRJ011', 'PLG011', 'PRD011', '12'),
('KRJ012', 'PLG012', 'PRD012', '8'),
('KRJ013', 'PLG013', 'PRD013', '28'),
('KRJ014', 'PLG014', 'PRD014', '16'),
('KRJ015', 'PLG015', 'PRD015', '16')

SELECT * FROM Keranjang

----
-- CREATE for Pemesanan Table
----

CREATE TABLE Pemesanan ( 
    IDPemesanan CHAR(6) NOT NULL,
    IDPelanggan CHAR(6) NOT NULL,
    IDKeranjang CHAR(6) NOT NULL,
	IDProduk CHAR(6) NOT NULL,
	JumlahBarang INT,
	TanggalPemesanan DATE,
    PRIMARY KEY (IDPemesanan),
    CONSTRAINT FK_Pesan_Cart FOREIGN KEY (IDKeranjang)
    REFERENCES Keranjang (IDKeranjang),
    CONSTRAINT FK_Pesan_Cust FOREIGN KEY (IDPelanggan) 
	REFERENCES Pelanggan (IDPelanggan),
	CONSTRAINT FK_Pesan_Prod FOREIGN KEY (IDProduk)
	REFERENCES Produk (IDProduk),
	CONSTRAINT CHK_Trans_ID CHECK (
        IDPemesanan LIKE 'PSN[0-9][0-9][0-9]'
	)
);

----
-- Insertion for Pemesanan Table
----

INSERT INTO Pemesanan VALUES
('PSN001', 'PLG001', 'KRJ001', 'PRD001', '20', '2022/01/01'),
('PSN002', 'PLG002', 'KRJ002', 'PRD002', '3', '2022/01/03'),
('PSN003', 'PLG003', 'KRJ003', 'PRD003', '23', '2022/01/04'),
('PSN004', 'PLG004', 'KRJ004', 'PRD004', '8', '2022/01/07'),
('PSN005', 'PLG005', 'KRJ005', 'PRD005', '5', '2022/01/10'),
('PSN006', 'PLG006', 'KRJ006', 'PRD006', '12', '2022/01/15'),
('PSN007', 'PLG007', 'KRJ007', 'PRD007', '19', '2022/01/18'),
('PSN008', 'PLG008', 'KRJ008', 'PRD008', '8', '2022/01/18'),
('PSN009', 'PLG009', 'KRJ009', 'PRD009', '15', '2022/01/22'),
('PSN010', 'PLG010', 'KRJ010', 'PRD010', '30', '2022/01/25'),
('PSN011', 'PLG011', 'KRJ011', 'PRD011', '12', '2022/01/27'),
('PSN012', 'PLG012', 'KRJ012', 'PRD012', '8', '2022/02/02'),
('PSN013', 'PLG013', 'KRJ013', 'PRD013', '28', '2022/02/04'),
('PSN014', 'PLG014', 'KRJ014', 'PRD014', '16', '2022/02/04'),
('PSN015', 'PLG015', 'KRJ015', 'PRD015', '16', '2022/02/21')

SELECT * FROM Pemesanan


----
-- CREATE for Transaksi Table
----
 
CREATE TABLE Transaksi ( 
    IDTransaksi CHAR(6) NOT NULL,
	IDPemesanan CHAR(6) NOT NULL,
    IDPegawai CHAR(6) NOT NULL,
    IDPelanggan CHAR(6) NOT NULL,
    TanggalTransaksi DATE,
	Total NUMERIC(11, 2),
    MetodePembayaran VARCHAR(25),
	Status VARCHAR(50),
    PRIMARY KEY(IDTransaksi),
    CONSTRAINT FK_Trans_Peg FOREIGN KEY (IDPegawai)
    REFERENCES Pegawai (IDPegawai),
    CONSTRAINT FK_Trans_Pel FOREIGN KEY (IDPelanggan)
    REFERENCES Pelanggan (IDPelanggan),
	CONSTRAINT FK_Trans_Pesan FOREIGN KEY (IDPemesanan)
	REFERENCES Pemesanan (IDPemesanan),
	CONSTRAINT CHK_Transaksi CHECK (
        IDTransaksi LIKE 'TRS[0-9][0-9][0-9]' 
	)
);

----
-- Insertion for Transaksi Table
----

INSERT INTO Transaksi VALUES
('TRS001', 'PSN001', 'PGW003', 'PLG001', '2022/01/01', 1000000, 'Credit', 'Sukses'),
('TRS002', 'PSN002', 'PGW007', 'PLG002', '2022/01/03', 150000, 'Cash', 'Sukses'),
('TRS003', 'PSN003', 'PGW001', 'PLG003', '2022/01/04', 1150000, 'Credit', 'Sukses'),
('TRS004', 'PSN004', 'PGW023', 'PLG004', '2022/01/07', 560000, 'Debit', 'Sukses'),
('TRS005', 'PSN005', 'PGW019', 'PLG005', '2022/01/10', 350000, 'Cash', 'Sukses'),
('TRS006', 'PSN006', 'PGW010', 'PLG006', '2022/01/15', 840000, 'Debit', 'Sukses'),
('TRS007', 'PSN007', 'PGW004', 'PLG007', '2022/01/18', 1330000, 'Debit', 'Sukses'),
('TRS008', 'PSN008', 'PGW021', 'PLG008', '2022/01/18', 160000, 'Cash', 'Sukses'),
('TRS009', 'PSN009', 'PGW015', 'PLG009', '2022/01/22', 300000, 'Debit', 'Sukses'),
('TRS010', 'PSN010', 'PGW004', 'PLG010', '2022/01/25', 600000, 'Debit', 'Sukses'),
('TRS011', 'PSN011', 'PGW016', 'PLG011', '2022/01/27', 240000, 'Debit', 'Sukses'),
('TRS012', 'PSN012', 'PGW023', 'PLG012', '2022/02/02', 200000, 'Credit',  'Sukses'),
('TRS013', 'PSN013', 'PGW009', 'PLG013', '2022/02/04', 700000, 'Credit',  'Sukses'),
('TRS014', 'PSN014', 'PGW023', 'PLG014', '2022/02/04', 240000, 'Credit',  'Sukses'),
('TRS015', 'PSN015', 'PGW022', 'PLG015', '2022/02/21', 240000, 'Debit',  'Sukses')

SELECT * FROM Transaksi

----
-- CREATE for DetailPenjualan Table
----

CREATE TABLE DetailPenjualan (
    IDPemesanan CHAR(6) NOT NULL,
    IDProduk CHAR(6) NOT NULL,
    PRIMARY KEY (IDPemesanan, IDProduk),
    CONSTRAINT FK_DP_Trans FOREIGN KEY (IDPemesanan) 
	REFERENCES Pemesanan (IDPemesanan)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_DP_Prod FOREIGN KEY (IDProduk) 
	REFERENCES Produk (IDProduk)
    ON UPDATE CASCADE ON DELETE CASCADE
);

----
-- Insertion for DetailPenjualan Table
----

INSERT INTO DetailPenjualan VALUES
('PSN001', 'PRD001'),
('PSN002', 'PRD002'),
('PSN003', 'PRD003'),
('PSN004', 'PRD004'),
('PSN005', 'PRD005'),
('PSN006', 'PRD006'),
('PSN007', 'PRD007'),
('PSN008', 'PRD008'),
('PSN009', 'PRD009'),
('PSN010', 'PRD010'),
('PSN011', 'PRD011'),
('PSN012', 'PRD012'),
('PSN013', 'PRD013'),
('PSN014', 'PRD014'),
('PSN015', 'PRD015')

SELECT * FROM DetailPenjualan


----
-- CREATE VIEW, CREATE PROCEDURE, CREATE TRIGGER
----


---- VIEW Customers who buy with a total amount above 750000

CREATE VIEW RichCustomer AS
SELECT PLG.NamaPelanggan,CONCAT('Rp. ', SUM(TRS.Total)) TotalPembelian FROM
Pelanggan PLG, Transaksi TRS
WHERE (PLG.IDPelanggan = TRS.IDPelanggan)
GROUP BY PLG.NamaPelanggan
HAVING SUM(TRS.Total) > 750000

SELECT * FROM RichCustomer

---- VIEW Active Currier
CREATE VIEW Currier AS
SELECT PGW.NamaPegawai, COUNT(KRM.NoResi) TotalPengiriman
FROM Pegawai PGW, Transaksi TRS, Pengiriman KRM
WHERE (PGW.IDPegawai = TRS.IDPegawai AND TRS.IDTransaksi = KRM.IDTransaksi)
GROUP BY PGW.NamaPegawai
HAVING COUNT(KRM.NoResi) > 2

SELECT * FROM Currier


---- VIEW Best selling product
CREATE VIEW BestProduct AS
SELECT PRD.IDProduk, PRD.NamaProduk, SUM(PSN.JumlahBarang) Terjual
FROM Produk PRD, Pemesanan PSN, Transaksi TRS
WHERE (PRD.IDProduk = PSN.IDProduk AND TRS.IDPemesanan = PSN.IDPemesanan)
GROUP BY PRD.IDProduk, PRD.NamaProduk
HAVING SUM(PSN.JumlahBarang) > 20

SELECT * FROM BestProduct

----
-- CREATE PROCEDURE
----

-- Member Diskon
CREATE PROCEDURE MemberDiscount @ID NVARCHAR(6)
AS
SELECT NamaPelanggan, JenisMember, CONCAT(LEFT(CAST(DSK.PersenDiskon * 100 AS VARCHAR), 2), '%') Discount
FROM Pelanggan PLG, Member MBR, Diskon DSK
WHERE (PLG.IDMember = MBR.IDMember AND MBR.IDDiskon = DSK.IDDiskon) AND
PLG.IDPelanggan = @ID

DROP PROCEDURE MemberDiscount

EXEC MemberDiscount @ID = 'PLG001'


-- Product Sold
CREATE PROCEDURE SellingProduct @IDProd NVARCHAR(6)
AS
SELECT NamaProduk, SUM(PSN.JumlahBarang) Terjual
FROM Produk PRD, Pemesanan PSN
WHERE (PRD.IDProduk = PSN.IDProduk) AND
PRD.IDProduk = @IDProd
GROUP BY NamaProduk

EXEC SellingProduct @IDProd = 'PRD001'


-- Product Stock
CREATE PROCEDURE ProductStock @IDStock NVARCHAR(6)
AS
SELECT PRD.IDProduk, PRD.NamaProduk, CONCAT((PRD.Stok -  SUM(PSN.JumlahBarang)), ' Unit') Stock
FROM Produk PRD, Pemesanan PSN
WHERE (PRD.IDProduk = PSN.IDProduk) AND
PRD.IDProduk = @IDStock
GROUP BY PRD.IDProduk, PRD.NamaProduk, PRD.Stok

DROP PROCEDURE ProductStock

EXEC ProductStock 'PRD001'


