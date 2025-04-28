import 'package:flutter/material.dart';
import 'package:ucp1/data_piket.dart';

class HomePage extends StatelessWidget {
  final String userName;
  final String role;

  const HomePage({super.key, required this.userName, required this.role});

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

  