import 'package:flutter/material.dart';

class BarangMasukDetailPage extends StatelessWidget {
  final DateTime transactionDate;
  final String transactionType;
  final String itemType;
  final int quantity;
  final double unitPrice;
  final double computedTotalPrice;

  const BarangMasukDetailPage({
    Key? key,
    required this.transactionDate,
    required this.transactionType,
    required this.itemType,
    required this.quantity,
    required this.unitPrice,
    required this.computedTotalPrice,
  }) : super(key: key);

  String formatDate(DateTime date) {
    final List<String> hariIndo = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu'
    ];
    final List<String> bulanIndo = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];
    String dayName = hariIndo[date.weekday - 1];
    String day = date.day.toString().padLeft(2, '0');
    String month = bulanIndo[date.month - 1];
    String year = date.year.toString();
    return '$dayName, $day $month $year';
  }