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

   Widget detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$label:",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  "Data Berhasil Disimpan!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              detailRow("Tanggal", formatDate(transactionDate)),
              const Divider(thickness: 1, color: Colors.grey),
              detailRow("Jenis Transaksi", transactionType),
              const Divider(thickness: 1, color: Colors.grey),
              detailRow("Jenis Barang", itemType),
              const Divider(thickness: 1, color: Colors.grey),
              detailRow("Jumlah Barang", quantity.toString()),
              const Divider(thickness: 1, color: Colors.grey),
              detailRow("Harga Satuan", "Rp. ${unitPrice.toStringAsFixed(0)}"),
              const Divider(thickness: 1, color: Colors.grey),
              detailRow("Total Harga", "Rp. ${computedTotalPrice.toStringAsFixed(0)}"),
              const Spacer(),