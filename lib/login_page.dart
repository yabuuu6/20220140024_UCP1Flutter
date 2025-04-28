import 'package:flutter/material.dart';
import 'package:ucp1/register_page.dart';
import 'package:ucp1/home_page.dart';

class LoginPage extends StatefulWidget {
  final String? registeredEmail;
  final String? registeredPassword;
  final String? registeredName;

  const LoginPage({
    Key? key,
    this.registeredEmail,
    this.registeredPassword,
    this.registeredName,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

