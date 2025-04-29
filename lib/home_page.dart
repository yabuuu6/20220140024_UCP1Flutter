import 'package:flutter/material.dart';
import 'package:ucp1/data_piket.dart';
import 'package:ucp1/data_pelanggan.dart';
import 'package:ucp1/data_barang.dart';

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({
    super.key,
    required this.userName,
  });

  Widget buildMenuCard({
    required IconData icon,
    required String label,
    bool isFullWidth = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isFullWidth ? double.infinity : null,
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 104, 96, 248),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 104, 96, 248),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/profil.jpg'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat Datang',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            // Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/benner.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: buildMenuCard(
                    icon: Icons.assignment_outlined,
                    label: 'Data Piket',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DataPiketPage(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: buildMenuCard(
                    icon: Icons.group_add,
                    label: 'Data Pelanggan',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DataPelangganPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            buildMenuCard(
              icon: Icons.receipt_long,
              label: 'Barang Masuk/Keluar',
              isFullWidth: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BarangMasukPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
