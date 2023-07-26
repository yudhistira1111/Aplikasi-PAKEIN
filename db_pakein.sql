-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jul 2023 pada 06.49
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pakein`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan_layanan_jasa_service`
--

CREATE TABLE `pemesanan_layanan_jasa_service` (
  `id_pemesanan_layanan_jasa_service` int(11) NOT NULL,
  `id_layanan_jasa_service` int(11) NOT NULL,
  `harga_beli` int(30) NOT NULL,
  `id_pemesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `id_layanan_jasa_service` int(11) NOT NULL,
  `penilaian` tinyint(5) NOT NULL,
  `ulasan` text NOT NULL,
  `tanggal_dinilai` datetime NOT NULL,
  `id_tukang_service` int(11) NOT NULL,
  `jawaban_tukang_service` text NOT NULL,
  `tanggal_dijawab` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_pemesanan`
--

CREATE TABLE `status_pemesanan` (
  `id_status_pemesanan` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `masalah_kerusakan` varchar(300) NOT NULL,
  `id_tukang_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_disimpan`
--

CREATE TABLE `tb_disimpan` (
  `id_disimpan` int(10) NOT NULL,
  `id_layanan_jasa_service` int(10) NOT NULL,
  `id_pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_layanan_jasa_service`
--

CREATE TABLE `tb_layanan_jasa_service` (
  `id_layanan_jasa_service` int(11) NOT NULL,
  `nama_layanan_jasa_service` varchar(100) NOT NULL,
  `foto_konten` varchar(100) NOT NULL,
  `harga_jual` int(20) NOT NULL,
  `deskripsi` varchar(300) NOT NULL,
  `rating` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemesanan`
--

CREATE TABLE `tb_pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `id_nama_layanan_jasa_service` int(11) NOT NULL,
  `waktu_input_pemesanan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `input_masalah_kerusakan` varchar(300) NOT NULL,
  `metode_pembyaran` tinyint(2) NOT NULL,
  `promo_pakein` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `no_telpon` int(12) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `foto_profile` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pemesanan_layanan_jasa_service`
--
ALTER TABLE `pemesanan_layanan_jasa_service`
  ADD PRIMARY KEY (`id_pemesanan_layanan_jasa_service`),
  ADD KEY `id_layanan_jasa_service` (`id_layanan_jasa_service`),
  ADD KEY `id_pemesanan` (`id_pemesanan`);

--
-- Indeks untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `id_pembeli` (`id_pembeli`),
  ADD KEY `id_nama_layanan_jasa_service` (`id_layanan_jasa_service`),
  ADD KEY `id_tukang_service` (`id_tukang_service`);

--
-- Indeks untuk tabel `status_pemesanan`
--
ALTER TABLE `status_pemesanan`
  ADD PRIMARY KEY (`id_status_pemesanan`),
  ADD KEY `id_pemesanan` (`id_pemesanan`),
  ADD KEY `masalah_kerusakan` (`masalah_kerusakan`),
  ADD KEY `id_tukang_service` (`id_tukang_service`);

--
-- Indeks untuk tabel `tb_disimpan`
--
ALTER TABLE `tb_disimpan`
  ADD PRIMARY KEY (`id_disimpan`),
  ADD KEY `id_layanan_jasa_service` (`id_layanan_jasa_service`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indeks untuk tabel `tb_layanan_jasa_service`
--
ALTER TABLE `tb_layanan_jasa_service`
  ADD PRIMARY KEY (`id_layanan_jasa_service`);

--
-- Indeks untuk tabel `tb_pemesanan`
--
ALTER TABLE `tb_pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_pembeli` (`id_pembeli`),
  ADD KEY `id_nama_layanan_jasa_service` (`id_nama_layanan_jasa_service`),
  ADD KEY `input_masalah_kerusakan` (`input_masalah_kerusakan`);

--
-- Indeks untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pemesanan_layanan_jasa_service`
--
ALTER TABLE `pemesanan_layanan_jasa_service`
  MODIFY `id_pemesanan_layanan_jasa_service` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `status_pemesanan`
--
ALTER TABLE `status_pemesanan`
  MODIFY `id_status_pemesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_disimpan`
--
ALTER TABLE `tb_disimpan`
  MODIFY `id_disimpan` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_layanan_jasa_service`
--
ALTER TABLE `tb_layanan_jasa_service`
  MODIFY `id_layanan_jasa_service` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pemesanan`
--
ALTER TABLE `tb_pemesanan`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`id_layanan_jasa_service`) REFERENCES `tb_layanan_jasa_service` (`id_layanan_jasa_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `status_pemesanan`
--
ALTER TABLE `status_pemesanan`
  ADD CONSTRAINT `status_pemesanan_ibfk_1` FOREIGN KEY (`masalah_kerusakan`) REFERENCES `tb_pemesanan` (`input_masalah_kerusakan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_disimpan`
--
ALTER TABLE `tb_disimpan`
  ADD CONSTRAINT `tb_disimpan_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_disimpan_ibfk_2` FOREIGN KEY (`id_layanan_jasa_service`) REFERENCES `tb_layanan_jasa_service` (`id_layanan_jasa_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_layanan_jasa_service`
--
ALTER TABLE `tb_layanan_jasa_service`
  ADD CONSTRAINT `tb_layanan_jasa_service_ibfk_1` FOREIGN KEY (`id_layanan_jasa_service`) REFERENCES `pemesanan_layanan_jasa_service` (`id_layanan_jasa_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pemesanan`
--
ALTER TABLE `tb_pemesanan`
  ADD CONSTRAINT `tb_pemesanan_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesanan_ibfk_2` FOREIGN KEY (`id_nama_layanan_jasa_service`) REFERENCES `tb_layanan_jasa_service` (`id_layanan_jasa_service`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesanan_ibfk_3` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan_layanan_jasa_service` (`id_pemesanan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
