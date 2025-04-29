import 'package:flutter/material.dart';
import 'package:ucp1/home_page.dart';
import 'package:ucp1/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  void _login() {
  if (_formKey.currentState?.validate() ?? false) {
    String email = _emailController.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selamat datang, $email!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            userName: email,
          ),
        ),
      );
    }
  }

  void _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
    required String validatorMessage,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(icon, color: const Color.fromARGB(255, 62, 62, 61)),
            suffixIcon: toggleVisibility != null
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: const Color.fromARGB(255, 62, 62, 61),
                    ),
                    onPressed: toggleVisibility,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Color.fromARGB(255, 104, 96, 248)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/logo.jpg',
                    width: 250,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    'SELAMAT DATANG KEMBALI',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  hintText: 'Masukkan Email',
                  icon: Icons.email,
                  validatorMessage: 'Email tidak boleh kosong',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hintText: 'Masukkan Password',
                  icon: Icons.lock,
                  validatorMessage: 'Password tidak boleh kosong',
                  obscureText: _obscurePassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 104, 96, 248),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: _login,
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: _goToRegister,
                    child: const Text.rich(
                      TextSpan(
                        text: 'Belum memiliki akun? ',
                        style: TextStyle(color: Colors.black87),
                        children: [
                          TextSpan(
                            text: 'Daftar disini!',
                            style: TextStyle(color: Color.fromARGB(255, 104, 96, 248)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
