import 'package:flutter/material.dart';
import 'package:ucp1/data_pelanggan.dart';

class DetailPelangganPage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String province;
  final String zipcode;

  const DetailPelangganPage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.province,
    required this.zipcode,
  });

 