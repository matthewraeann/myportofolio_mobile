import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/item_homepage.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

/// Kartu aksi portofolio dengan warna, ikon, dan umpan balik sentuhan.
///
/// [ItemHomepage] menjadi satu-satunya sumber data kartu sehingga penambahan
/// aksi baru cukup dilakukan pada daftar data di halaman utama.
class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final ItemHomepage item;

  Future<void> _handleTap(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    if (item.isLogout) {
      final auth = context.read<AuthState>();
      final wasLoggedIn = auth.isLoggedIn;
      await auth.logout();
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              wasLoggedIn ? 'Kamu berhasil logout.' : 'Kamu belum login.',
            ),
          ),
        );
      return;
    }

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('Kamu telah menekan tombol ${item.name}!')),
      );

    if (item.requiresAuth && !await ensureLoggedIn(context)) return;

    // Navigate ke halaman tujuan kartu, jika ada
    final pageBuilder = item.pageBuilder;
    if (pageBuilder != null) {
      navigator.push(MaterialPageRoute(builder: pageBuilder));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _handleTap(context),
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
