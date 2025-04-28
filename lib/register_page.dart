import 'package:flutter/material.dart';
import 'package:ucp1/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

 @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.white, 
    body: Container(
    decoration: const BoxDecoration(
      color: Colors.white, 
    ),
    child: SingleChildScrollView(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const FlutterLogo(size: 100),
                const SizedBox(height: 20),
                const Text(
                  'DAFTAR AKUN BARU',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),
                _buildTextField(
                  controller: _nameController,
                  label: 'Nama Lengkap',
                  hintText: 'Masukkan nama lengkap',
                  icon: Icons.person,
                  validatorMessage: 'Nama lengkap tidak boleh kosong',
                ),
                
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _emailController,
                        label: 'Email',
                        hintText: 'Masukkan email',
                        icon: Icons.email,
                        validatorMessage: 'Email tidak boleh kosong',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _phoneController,
                        label: 'No HP',
                        hintText: 'Masukkan no hp',
                        icon: Icons.phone,
                        validatorMessage: 'No HP tidak boleh kosong',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: 'Masukkan password',
                        icon: Icons.lock,
                        validatorMessage: 'Password tidak boleh kosong',
                        obscureText: _obscurePassword,
                        toggleVisibility: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _confirmPasswordController,
                        label: 'Konfirmasi Password',
                        hintText: 'Masukkan konfirmasi password',
                        icon: Icons.lock,
                        validatorMessage: 'Konfirmasi password tidak boleh kosong',
                        obscureText: _obscureConfirmPassword,
                        toggleVisibility: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 104, 96, 248),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: _handleRegister,
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255), // Change "Colors.red" to your desired color
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sudah memiliki akun? ', style: TextStyle(color: Colors.black87)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        'Login disini!',
                        style: TextStyle(color: Color.fromARGB(255, 104, 96, 248)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    )
  );
}
 
 