import 'package:flutter/material.dart';


class BarangMasukPage extends StatefulWidget {
  const BarangMasukPage({Key? key}) : super(key: key);

  @override
  _BarangMasukPageState createState() => _BarangMasukPageState();
}

class _BarangMasukPageState extends State<BarangMasukPage> {
  DateTime? _transactionDate;
  String? _transactionDateError;
  String? _selectedTransactionType;
  String? _transactionTypeError;
  final List<String> _transactionTypes = ['Barang Masuk', 'Barang Keluar'];
  String? _selectedItemType;
  String? _itemTypeError;
  final List<String> _itemTypes = ['Elektronik', 'Pakaian', 'Makanan', 'Minuman'];
  final Map<String, double> _defaultPrices = {
    'Elektronik': 300000,
    'Pakaian': 75000,
    'Makanan': 20000,
    'Minuman': 5000,
  };
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  String? _quantityError;
  String? _unitPriceError;

  @override
  void dispose() {
    _quantityController.dispose();
    _unitPriceController.dispose();
    super.dispose();
  }

  String formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  }

  Future<void> _pickTransactionDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _transactionDate = picked;
        _transactionDateError = null;
      });
    }
  }

  void _updateComputedPrice() {
    if (_selectedItemType != null && _defaultPrices.containsKey(_selectedItemType)) {
      int quantity = int.tryParse(_quantityController.text) ?? 0;
      double defaultPrice = _defaultPrices[_selectedItemType]!;
      double computedPrice = quantity * defaultPrice;
      _unitPriceController.text = computedPrice.toStringAsFixed(0);
    } else {
      _unitPriceController.clear();
    }
  }

  