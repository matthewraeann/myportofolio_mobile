import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/item_homepage.dart';

/// Kartu aksi portofolio dengan warna, ikon, dan umpan balik sentuhan.
///
/// [ItemHomepage] menjadi satu-satunya sumber data kartu sehingga penambahan
/// aksi baru cukup dilakukan pada daftar data di halaman utama.
class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final ItemHomepage item;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('Kamu telah menekan tombol ${item.name}!'),
              ),
            );

          // Navigate ke halaman tujuan kartu, jika ada
          final pageBuilder = item.pageBuilder;
          if (pageBuilder != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: pageBuilder),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, color: Colors.white, size: 32),
              const SizedBox(height: 8),
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
