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

  Widget _buildTaskItem(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 104, 96, 248),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          _tasks[index]['task']!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Tanggal: ${_tasks[index]['date']}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPiketPage(
                name: _tasks[index]['name']!,
                date: _tasks[index]['date']!,
                task: _tasks[index]['task']!,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 104, 96, 248),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Piket Gudang',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nama Anggota',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Masukkan nama anggota',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorText: _nameError,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pilih Tanggal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: _pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'Pilih Tanggal'
                            : formatDate(_selectedDate!),
                        style: TextStyle(
                          fontSize: 16,
                          color: _selectedDate == null ? Colors.grey : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_dateError != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8),
                child: Text(
                  _dateError!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              'Tugas Piket',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _taskController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'Masukkan tugas piket',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: _addTask,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 104, 96, 248),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Tambah',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            if (_taskError != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8),
                child: Text(
                  _taskError!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 24),
            const Text(
              'Daftar Tugas Piket',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada Data',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) => _buildTaskItem(index),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}