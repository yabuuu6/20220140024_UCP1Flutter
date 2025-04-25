import 'package:flutter/material.dart';
import 'package:ucp1/home_page.dart';
import 'package:ucp1/register_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlutterLogo(
                      size:100.0
                    ),
                  ],
                ),
              ),
              
                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  child:TextFormField(
                      keyboardType: TextInputType.emailAddress, 
                      decoration:InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(29.20)),
                          hintText: 'Email',
                          labelText: 'Email',
                          icon:Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                }
              )
            ),
            
            Container(
              padding: const EdgeInsets.only(top:10.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(29.20)),
                  hintText: 'Password',
                  labelText: 'Enter your password',
                  icon:Icon(Icons.lock)

                      ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              )
            ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: 
                    BorderRadius.circular(20)
                  )
                ),

                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                child: const
                Text(
                  'Login',
                  style:TextStyle(
                    color:Colors.black
                  ),
                  ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text('Belum punya akun? Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
