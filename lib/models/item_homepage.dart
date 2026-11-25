import 'package:flutter/material.dart';

/// Menyimpan data yang diperlukan untuk menampilkan satu kartu aksi portofolio.
///
/// Menempatkan nama, ikon, warna, dan tujuan navigasi dalam satu model membuat
/// [ItemCard] dapat dibangun dari data tanpa percabangan yang berulang.
class ItemHomepage {
  const ItemHomepage({
    required this.name,
    required this.icon,
    required this.color,
    this.pageBuilder,
    this.requiresAuth = false,
    this.isLogout = false,
  });

  final String name;
  final IconData icon;
  final Color color;

  /// Pembangun halaman tujuan; kartu tanpa tujuan hanya menampilkan SnackBar.
  final WidgetBuilder? pageBuilder;

  /// Jika true, pengguna harus login sebelum membuka halaman tujuan.
  final bool requiresAuth;

  /// Jika true, kartu ini mengeluarkan pengguna (logout) saat ditekan.
  final bool isLogout;
}
