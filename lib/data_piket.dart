import 'package:flutter/material.dart';
import 'package:ucp1/detail_data_piket.dart';

class DataPiketPage extends StatefulWidget {
  const DataPiketPage({super.key});

  @override
  _DataPiketPageState createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  final List<Map<String, String>> _tasks = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();
  DateTime? _selectedDate;

  String? _nameError;
  String? _dateError;
  String? _taskError;

  @override
  void dispose() {
    _nameController.dispose();
    _taskController.dispose();
    super.dispose();
  }

  String formatDate(DateTime date) {
    final List<String> hariIndo = [
      'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'
    ];
    final List<String> bulanIndo = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    String dayName = hariIndo[date.weekday - 1];
    String day = date.day.toString().padLeft(2, '0');
    String month = bulanIndo[date.month - 1];
    String year = date.year.toString();
    return '$dayName, $day $month $year';
  }

  