import 'package:flutter/material.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  const ItemHomepage(this.name, this.icon, this.color);
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const String npm = '2506612184';
  static const String nama = 'Rheza Abdilla';
  static const String kelas = 'PBP F';

  static const List<ItemHomepage> items = [
    ItemHomepage(
      'Lihat Experience',
      Icons.work_outline_rounded,
      Color(0xFF2563EB),
    ),
    ItemHomepage(
      'Tambah Experience',
      Icons.add_circle_outline_rounded,
      Color(0xFF15803D),
    ),
    ItemHomepage('Logout', Icons.logout_rounded, Color(0xFFB91C1C)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rheza's Portfolio",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Halo, selamat datang! 👋',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Kenali perjalanan, pengalaman, dan karya saya.',
                  style: TextStyle(fontSize: 16, color: Color(0xFF475569)),
                ),
                const SizedBox(height: 24),

                // Susunan kartu mengikuti lebar ruang yang tersedia.
                LayoutBuilder(
                  builder: (context, constraints) {
                    final bool isWide = constraints.maxWidth >= 600;
                    final double cardWidth = isWide
                        ? (constraints.maxWidth - 32) / 3
                        : constraints.maxWidth;

                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SizedBox(
                          width: cardWidth,
                          child: const InfoCard(title: 'NPM', content: npm),
                        ),
                        SizedBox(
                          width: cardWidth,
                          child: const InfoCard(title: 'Name', content: nama),
                        ),
                        SizedBox(
                          width: cardWidth,
                          child: const InfoCard(title: 'Class', content: kelas),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 32),
                const Text(
                  'Menu Utama',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pilih salah satu menu untuk mulai menjelajah.',
                  style: TextStyle(color: Color(0xFF475569)),
                ),
                const SizedBox(height: 16),

                LayoutBuilder(
                  builder: (context, constraints) {
                    final bool isWide = constraints.maxWidth >= 600;
                    final double cardWidth = isWide
                        ? (constraints.maxWidth - 32) / 3
                        : constraints.maxWidth;

                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: items.map((item) {
                        return SizedBox(
                          width: cardWidth,
                          child: ItemCard(item),
                        );
                      }).toList(),
                    );
                  },
                ),

                const SizedBox(height: 32),
                const Center(
                  child: Text(
                    'Rheza Abdilla • PBP F',
                    style: TextStyle(color: Color(0xFF64748B)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        hoverColor: Colors.white12,
        splashColor: Colors.white24,
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('Kamu telah menekan tombol ${item.name}!'),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
              ),
            );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon, size: 40, color: Colors.white),
              const SizedBox(height: 16),
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
