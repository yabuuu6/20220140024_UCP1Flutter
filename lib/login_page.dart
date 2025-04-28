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

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    if (widget.registeredEmail != null) {
      _emailController.text = widget.registeredEmail!;
    }
    if (widget.registeredPassword != null) {
      _passwordController.text = widget.registeredPassword!;
    }
  }

  