import 'package:flutter/material.dart';
import 'package:ucp1/detail_barang.dart';


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

  void _submitForm() {
    setState(() {
      _transactionDateError = null;
      _transactionTypeError = null;
      _itemTypeError = null;
      _quantityError = null;
      _unitPriceError = null;
      bool hasError = false;
      if (_transactionDate == null) {
        _transactionDateError = "Tanggal tidak boleh kosong";
        hasError = true;
      }
      if (_selectedTransactionType == null) {
        _transactionTypeError = "Jenis transaksi harus dipilih";
        hasError = true;
      }
      if (_selectedItemType == null) {
        _itemTypeError = "Jenis barang harus dipilih";
        hasError = true;
      }
      if (_quantityController.text.isEmpty) {
        _quantityError = "Jumlah barang tidak boleh kosong";
        hasError = true;
      }
      if (_unitPriceController.text.isEmpty) {
        _unitPriceError = "Harga satuan tidak boleh kosong";
        hasError = true;
      }
      if (!hasError) {
        final int quantity = int.tryParse(_quantityController.text) ?? 0;
        final double unitPrice = _defaultPrices[_selectedItemType]!;
        final double computedTotalPrice = quantity * unitPrice;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BarangMasukDetailPage(
              transactionDate: _transactionDate!,
              transactionType: _selectedTransactionType!,
              itemType: _selectedItemType!,
              quantity: quantity,
              unitPrice: unitPrice,
              computedTotalPrice: computedTotalPrice,
            ),
          ),
        );
      } 
    });
  }

   @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Pendataan Barang",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 104, 96, 248),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Tanggal Transaksi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              InkWell(
                onTap: _pickTransactionDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        _transactionDate == null
                            ? "Tanggal Transaksi"
                            : formatDate(_transactionDate!),
                        style: TextStyle(
                          fontSize: 16,
                          color: _transactionDate == null ? Colors.grey : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_transactionDateError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 4),
                  child: Text(_transactionDateError!, style: const TextStyle(color: Colors.red, fontSize: 12)),
                ),
              const SizedBox(height: 16),
              const Text("Jenis Transaksi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: const Text("Pilih jenis transaksi"),
                    value: _selectedTransactionType,
                    items: _transactionTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedTransactionType = value;
                      });
                    },
                  ),
                ),
              ),
              if (_transactionTypeError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 4),
                  child: Text(_transactionTypeError!, style: const TextStyle(color: Colors.red, fontSize: 12)),
                ),
              const SizedBox(height: 16),
              const Text("Jenis Barang", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: const Text("Pilih jenis barang"),
                    value: _selectedItemType,
                    items: _itemTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedItemType = value;
                        _updateComputedPrice();
                      });
                    },
                  ),
                ),
              ),
              if (_itemTypeError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 4),
                  child: Text(_itemTypeError!, style: const TextStyle(color: Colors.red, fontSize: 12)),
                ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Jumlah Barang", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        TextField(
                          controller: _quantityController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _updateComputedPrice();
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Jumlah Barang",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            errorText: _quantityError,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Harga Satuan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        TextField(
                          controller: _unitPriceController,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "Rp. Harga Satuan",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            errorText: _unitPriceError,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 104, 96, 248),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text(
                    "Submit", 
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: 
                      FontWeight.bold, 
                      color: Colors.white
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}