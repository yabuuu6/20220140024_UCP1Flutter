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

  void _addTask() {
    setState(() {
      _nameError = null;
      _dateError = null;
      _taskError = null;

      bool hasError = false;

      if (_nameController.text.isEmpty) {
        _nameError = 'Nama anggota tidak boleh kosong';
        hasError = true;
      }
      if (_selectedDate == null) {
        _dateError = 'Tanggal harus dipilih';
        hasError = true;
      }
      if (_taskController.text.isEmpty) {
        _taskError = 'Tugas piket tidak boleh kosong';
        hasError = true;
      }

      if (!hasError) {
        _tasks.add({
          'name': _nameController.text,
          'date': formatDate(_selectedDate!),
          'task': _taskController.text,
        });
        _nameController.clear();
        _taskController.clear();
        _selectedDate = null;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tugas piket berhasil ditambahkan!'),
            backgroundColor: Color.fromARGB(255, 104, 96, 248),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

 