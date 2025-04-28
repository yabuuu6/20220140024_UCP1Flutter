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

 