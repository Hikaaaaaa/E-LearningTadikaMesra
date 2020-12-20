-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2020 at 05:51 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_lengkap`, `alamat`, `no_telp`, `email`, `username`, `password`, `pass`) VALUES
(1, 'Gede Agung Aji Andar', 'Las Vegas', '081111111120', 'andar@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL,
  `judul` text NOT NULL,
  `isi` longtext NOT NULL,
  `tgl_posting` date NOT NULL,
  `penerbit` varchar(10) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `judul`, `isi`, `tgl_posting`, `penerbit`, `status`) VALUES
(2, 'COVID-19', 'Gausah keluar, biar aku aja yang kerumah :)\r\n#DirumahAja', '2020-04-14', 'admin', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tb_file_materi`
--

CREATE TABLE `tb_file_materi` (
  `id_materi` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `nama_file` varchar(250) NOT NULL,
  `tgl_posting` date NOT NULL,
  `pembuat` varchar(10) NOT NULL,
  `hits` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_file_materi`
--

INSERT INTO `tb_file_materi` (`id_materi`, `judul`, `id_kelas`, `id_mapel`, `nama_file`, `tgl_posting`, `pembuat`, `hits`) VALUES
(9, 'E-Book Biologi Kelas 10', 4, 8, 'EBOOK_BIOLOGI_KELAS10.pdf', '2020-12-20', '3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jawaban`
--

CREATE TABLE `tb_jawaban` (
  `id` int(11) NOT NULL,
  `id_tq` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `jawaban` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `wali_kelas` int(5) NOT NULL,
  `ketua_kelas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `nama_kelas`, `ruang`, `wali_kelas`, `ketua_kelas`) VALUES
(4, 'MIA 1', '15', 3, 11),
(5, 'IIS 1', '15', 0, 0),
(6, 'BHS 1', '5', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas_ajar`
--

CREATE TABLE `tb_kelas_ajar` (
  `id` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_pengajar` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kelas_ajar`
--

INSERT INTO `tb_kelas_ajar` (`id`, `id_kelas`, `id_pengajar`, `keterangan`) VALUES
(8, 4, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `id` int(11) NOT NULL,
  `kode_mapel` varchar(10) NOT NULL,
  `mapel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mapel`
--

INSERT INTO `tb_mapel` (`id`, `kode_mapel`, `mapel`) VALUES
(8, 'BIO1', 'Biologi Kelas 10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mapel_ajar`
--

CREATE TABLE `tb_mapel_ajar` (
  `id` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_pengajar` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mapel_ajar`
--

INSERT INTO `tb_mapel_ajar` (`id`, `id_mapel`, `id_kelas`, `id_pengajar`, `keterangan`) VALUES
(2, 8, 4, 3, 'Wali Kelas MIA 1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_nilai_essay`
--

CREATE TABLE `tb_nilai_essay` (
  `id` int(11) NOT NULL,
  `id_tq` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `nilai` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_nilai_pilgan`
--

CREATE TABLE `tb_nilai_pilgan` (
  `id` int(11) NOT NULL,
  `id_tq` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `benar` int(4) NOT NULL,
  `salah` int(4) NOT NULL,
  `tidak_dikerjakan` int(4) NOT NULL,
  `presentase` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_nilai_pilgan`
--

INSERT INTO `tb_nilai_pilgan` (`id`, `id_tq`, `id_siswa`, `benar`, `salah`, `tidak_dikerjakan`, `presentase`) VALUES
(38, 18, 12, 1, 0, 0, 100);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengajar`
--

CREATE TABLE `tb_pengajar` (
  `id_pengajar` int(11) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `web` varchar(60) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengajar`
--

INSERT INTO `tb_pengajar` (`id_pengajar`, `nip`, `nama_lengkap`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_telp`, `email`, `alamat`, `jabatan`, `foto`, `web`, `username`, `password`, `pass`, `status`) VALUES
(3, '10001', 'Tok Dalang S.Pd', 'Malaysia', '1970-01-06', 'L', 'Hindu', '14045', 'tokdalang@gmail.com', 'Kampung Durian Runtuh', 'Guru Biologi', 'Tok dalang.jpg', '', 'tokdalang', '1f59e414f338c011450983a70c944621', 'tokdalang', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `nama_ibu` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `thn_masuk` int(5) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_lengkap`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `nama_ayah`, `nama_ibu`, `no_telp`, `email`, `alamat`, `id_kelas`, `thn_masuk`, `foto`, `username`, `password`, `pass`, `status`) VALUES
(11, '1230002', 'Mail', 'Tabanan', '2002-05-22', 'L', 'Konghucu', 'Ayah Mail', 'Ayah Fizi', '087126763712', 'mail@gmail.com', 'Jalan Tanah Lot No. 9', 4, 2018, 'mail.png', 'mail', 'b83a886a5c437ccd9ac15473fd6f1788', 'mail', 'aktif'),
(12, '1230001', 'Fizi', 'Buleleng', '2001-12-12', 'L', 'Islam', 'Ayah Fizi', 'Ibu Fizi', '0895475170719', 'fizi@gmail.com', 'Desa Pakraman Durian Runtuh', 4, 2018, '1590467298-3-fizi.png', 'fizi', 'fa6c1b1ad03f863cacb4c81603a49939', 'fizi', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal_essay`
--

CREATE TABLE `tb_soal_essay` (
  `id_essay` int(11) NOT NULL,
  `id_tq` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tgl_buat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal_pilgan`
--

CREATE TABLE `tb_soal_pilgan` (
  `id_pilgan` int(11) NOT NULL,
  `id_tq` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `pil_a` text NOT NULL,
  `pil_b` text NOT NULL,
  `pil_c` text NOT NULL,
  `pil_d` text NOT NULL,
  `pil_e` text NOT NULL,
  `kunci` varchar(2) NOT NULL,
  `tgl_buat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_soal_pilgan`
--

INSERT INTO `tb_soal_pilgan` (`id_pilgan`, `id_tq`, `pertanyaan`, `gambar`, `pil_a`, `pil_b`, `pil_c`, `pil_d`, `pil_e`, `kunci`, `tgl_buat`) VALUES
(36, 18, 'Ayam adalah jenis hewan ...', 'rembo.jpg', 'Ovo', 'Ovovivipar', 'Ovipar', 'Vivipar', 'Kaka ipar', 'C', '2020-12-20');

-- --------------------------------------------------------

--
-- Table structure for table `tb_topik_quiz`
--

CREATE TABLE `tb_topik_quiz` (
  `id_tq` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `tgl_buat` date NOT NULL,
  `pembuat` varchar(10) NOT NULL,
  `waktu_soal` int(8) NOT NULL,
  `info` varchar(250) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_topik_quiz`
--

INSERT INTO `tb_topik_quiz` (`id_tq`, `judul`, `id_kelas`, `id_mapel`, `tgl_buat`, `pembuat`, `waktu_soal`, `info`, `status`) VALUES
(18, 'Ulangan Harian 1', 4, 8, '2020-12-20', '3', 7200, 'Kerjakan dengan teliti', 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `tb_file_materi`
--
ALTER TABLE `tb_file_materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `id_kelas` (`id_kelas`,`id_mapel`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indexes for table `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tq` (`id_tq`),
  ADD KEY `id_soal` (`id_soal`,`id_siswa`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tb_kelas_ajar`
--
ALTER TABLE `tb_kelas_ajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_pengajar` (`id_pengajar`);

--
-- Indexes for table `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_mapel_ajar`
--
ALTER TABLE `tb_mapel_ajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mapel` (`id_mapel`,`id_kelas`,`id_pengajar`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_pengajar` (`id_pengajar`);

--
-- Indexes for table `tb_nilai_essay`
--
ALTER TABLE `tb_nilai_essay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tq` (`id_tq`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `tb_nilai_pilgan`
--
ALTER TABLE `tb_nilai_pilgan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tq` (`id_tq`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `tb_pengajar`
--
ALTER TABLE `tb_pengajar`
  ADD PRIMARY KEY (`id_pengajar`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_kelas_2` (`id_kelas`);

--
-- Indexes for table `tb_soal_essay`
--
ALTER TABLE `tb_soal_essay`
  ADD PRIMARY KEY (`id_essay`),
  ADD KEY `id_tq` (`id_tq`);

--
-- Indexes for table `tb_soal_pilgan`
--
ALTER TABLE `tb_soal_pilgan`
  ADD PRIMARY KEY (`id_pilgan`),
  ADD KEY `id_tq` (`id_tq`);

--
-- Indexes for table `tb_topik_quiz`
--
ALTER TABLE `tb_topik_quiz`
  ADD PRIMARY KEY (`id_tq`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_file_materi`
--
ALTER TABLE `tb_file_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_kelas_ajar`
--
ALTER TABLE `tb_kelas_ajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_mapel`
--
ALTER TABLE `tb_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_mapel_ajar`
--
ALTER TABLE `tb_mapel_ajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_nilai_essay`
--
ALTER TABLE `tb_nilai_essay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_nilai_pilgan`
--
ALTER TABLE `tb_nilai_pilgan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tb_pengajar`
--
ALTER TABLE `tb_pengajar`
  MODIFY `id_pengajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_soal_essay`
--
ALTER TABLE `tb_soal_essay`
  MODIFY `id_essay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_soal_pilgan`
--
ALTER TABLE `tb_soal_pilgan`
  MODIFY `id_pilgan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tb_topik_quiz`
--
ALTER TABLE `tb_topik_quiz`
  MODIFY `id_tq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_file_materi`
--
ALTER TABLE `tb_file_materi`
  ADD CONSTRAINT `tb_file_materi_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_file_materi_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `tb_mapel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  ADD CONSTRAINT `tb_jawaban_ibfk_1` FOREIGN KEY (`id_tq`) REFERENCES `tb_topik_quiz` (`id_tq`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jawaban_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jawaban_ibfk_3` FOREIGN KEY (`id_soal`) REFERENCES `tb_soal_essay` (`id_essay`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_kelas_ajar`
--
ALTER TABLE `tb_kelas_ajar`
  ADD CONSTRAINT `tb_kelas_ajar_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_kelas_ajar_ibfk_2` FOREIGN KEY (`id_pengajar`) REFERENCES `tb_pengajar` (`id_pengajar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_mapel_ajar`
--
ALTER TABLE `tb_mapel_ajar`
  ADD CONSTRAINT `tb_mapel_ajar_ibfk_1` FOREIGN KEY (`id_mapel`) REFERENCES `tb_mapel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_mapel_ajar_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_mapel_ajar_ibfk_3` FOREIGN KEY (`id_pengajar`) REFERENCES `tb_pengajar` (`id_pengajar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_nilai_essay`
--
ALTER TABLE `tb_nilai_essay`
  ADD CONSTRAINT `tb_nilai_essay_ibfk_1` FOREIGN KEY (`id_tq`) REFERENCES `tb_topik_quiz` (`id_tq`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_nilai_essay_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_nilai_pilgan`
--
ALTER TABLE `tb_nilai_pilgan`
  ADD CONSTRAINT `tb_nilai_pilgan_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_nilai_pilgan_ibfk_2` FOREIGN KEY (`id_tq`) REFERENCES `tb_topik_quiz` (`id_tq`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_soal_essay`
--
ALTER TABLE `tb_soal_essay`
  ADD CONSTRAINT `tb_soal_essay_ibfk_1` FOREIGN KEY (`id_tq`) REFERENCES `tb_topik_quiz` (`id_tq`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_soal_pilgan`
--
ALTER TABLE `tb_soal_pilgan`
  ADD CONSTRAINT `tb_soal_pilgan_ibfk_1` FOREIGN KEY (`id_tq`) REFERENCES `tb_topik_quiz` (`id_tq`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_topik_quiz`
--
ALTER TABLE `tb_topik_quiz`
  ADD CONSTRAINT `tb_topik_quiz_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_topik_quiz_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `tb_mapel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
