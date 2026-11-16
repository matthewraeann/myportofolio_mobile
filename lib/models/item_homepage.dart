import 'package:flutter/material.dart';

/// Menyimpan data yang diperlukan untuk menampilkan satu kartu aksi portofolio.
///
/// Menempatkan nama, ikon, dan warna dalam satu model membuat [ItemCard]
/// dapat dibangun dari data tanpa percabangan warna yang berulang.
class ItemHomepage {
  const ItemHomepage({
    required this.name,
    required this.icon,
    required this.color,
  });

  final String name;
  final IconData icon;
  final Color color;
}
