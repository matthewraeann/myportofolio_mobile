import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/item_homepage.dart';
import 'package:myportofolio_mobile/widgets/info_card.dart';
import 'package:myportofolio_mobile/widgets/item_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String npm = '2506544763';
  final String nama = 'Matthew Raeann Alexandra';
  final String kelas = 'PBP B';

  static const List<ItemHomepage> items = [
    ItemHomepage(
      name: 'Lihat Proyek',
      icon: Icons.folder_outlined,
      color: Color(0xFF4F46A5),
    ),
    ItemHomepage(
      name: 'Tambah Proyek',
      icon: Icons.add_circle_outline,
      color: Color(0xFFD97706),
    ),
    ItemHomepage(
      name: 'Logout',
      icon: Icons.logout,
      color: Color(0xFF0F766E),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth >= 600;
            final isWide = constraints.maxWidth >= 900;
            final profileCardWidth = isTablet
                ? (constraints.maxWidth - 64) / 3
                : constraints.maxWidth;
            final actionColumnCount = isWide ? 3 : (isTablet ? 2 : 1);

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      InfoCard(
                        title: 'NPM',
                        content: npm,
                        width: profileCardWidth,
                      ),
                      InfoCard(
                        title: 'Nama',
                        content: nama,
                        width: profileCardWidth,
                      ),
                      InfoCard(
                        title: 'Kelas',
                        content: kelas,
                        width: profileCardWidth,
                      ),
                    ],
                  ),
                  const SizedBox(height: 42),
                  Text(
                    'Selamat datang di MyPortfolio Mobile!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Aksi Portofolio',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: actionColumnCount,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: isWide ? 1.6 : (isTablet ? 1.3 : 3.2),
                    children: items
                        .map((item) => ItemCard(item: item))
                        .toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
