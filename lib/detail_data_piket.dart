import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final String name; 
  final String date; 
  final String task; 

  const DetailPiketPage({
    Key? key,
    required this.name,
    required this.date,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 104, 96, 248),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        