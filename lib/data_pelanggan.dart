import 'package:flutter/material.dart';

class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({super.key});

  @override
  _DataPelangganPageState createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _phoneError;
  String? _addressError;
  String? _provinceError;
  String? _zipcodeError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _provinceController.dispose();
    _zipcodeController.dispose();
    super.dispose();
  }

  void _saveForm() {
    setState(() {
      _nameError = null;
      _emailError = null;
      _phoneError = null;
      _addressError = null;
      _provinceError = null;
      _zipcodeError = null;

      bool hasError = false;
      if (_nameController.text.isEmpty) {
        _nameError = 'Nama pelanggan tidak boleh kosong';
        hasError = true;
      }
      if (_emailController.text.isEmpty) {
        _emailError = 'Email tidak boleh kosong';
        hasError = true;
      }
      if (_phoneController.text.isEmpty) {
        _phoneError = 'No Hp tidak boleh kosong';
        hasError = true;
      }
      if (_addressController.text.isEmpty) {
        _addressError = 'Alamat tidak boleh kosong';
        hasError = true;
      }
      if (_provinceController.text.isEmpty) {
        _provinceError = 'Provinsi tidak boleh kosong';
        hasError = true;
      }
      if (_zipcodeController.text.isEmpty) {
        _zipcodeError = 'Kode Pos tidak boleh kosong';
        hasError = true;
      }

      if (!hasError) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPelangganPage(
              name: _nameController.text,
              email: _emailController.text,
              phone: _phoneController.text,
              address: _addressController.text,
              province: _provinceController.text,
              zipcode: _zipcodeController.text,
            ),
          ),
        );
      }
    });
  }

  void _resetForm() {
    setState(() {
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _addressController.clear();
      _provinceController.clear();
      _zipcodeController.clear();
      _nameError = null;
      _emailError = null;
      _phoneError = null;
      _addressError = null;
      _provinceError = null;
      _zipcodeError = null;
    });
  }

 