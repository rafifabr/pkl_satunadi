import 'package:flutter/material.dart';

class Services {
  final String image;
  final Color color;
  final String title;

  Services({
    required this.image,
    required this.color,
    required this.title,
  });
}

// Services List OF DATA

List<Services> servicesList = [
  Services(
    image: 'assets/images/reservasi.png',
    color: Colors.white,
    title: "E-Reservasi",
  ),
  Services(
    image: 'assets/images/farmasi.png',
    title: "Informasi Obat",
    color: Colors.white,
  ),
  Services(
    image: 'assets/images/rekammedis.png',
    title: "Rekam Medis",
    color: Colors.white,
  ),
  // Services(
  //   image: 'assets/icons/noun-medical-test.svg',
  //   color: const Color(0xffD6F6FF),
  //   title: "Service 3",
  // ),
  // Services(
  //   image: 'assets/icons/noun-corona.svg',
  //   color: const Color(0xffF2E3E9),
  //   title: "Service 4",
  // ),
];

/// Upcoming Artikel

class Artikel {
  final String image;
  final String title;
  final Color color;

  Artikel({
    required this.image,
    required this.color,
    required this.title,
  });
}

// Upcoming Artikel List OF DATA

List<Artikel> upcomingArtikelList = [
  Artikel(
    image: 'assets/images/rainn.jpg',
    title: "Sudah Musim Hujan Nih! Simak Tips Berikut Agar Tetap Fit Menjalani Kegiatan.",
    color: const Color(0xffFFFDFA),
  ),
  Artikel(
    image: 'assets/images/kid.jpg',
    title: "Saatnya Imunisasi! Ini Daftar Vaksin Anak yang Diwajibkan Pemerintah",
    color: const Color(0xffFFFDFA),
  ),
];
