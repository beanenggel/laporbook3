import 'package:flutter/material.dart';
import 'package:laporbook/components/input_widget.dart';
import '../components/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    Text('Login', style: headerStyle(level: 2)),
                    Container(
                      child: const Text(
                        'Login to your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Tempat inputan
                            buildEmailInput(),
                            SizedBox(height: 20),
                            buildPasswordInput(),
                            SizedBox(height: 20),
                            buildLoginButton(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Belum punya akun? '),
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, '/register'),
                          child: const Text('Daftar di sini',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget buildEmailInput() {
    return TextFormField(
      onChanged: (String value) => setState(() {
        email = value;
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }
        // Tambahan validasi email sesuai kebutuhan
        return null;
      },
      decoration: customInputDecoration("Email"),
    );
  }

  Widget buildPasswordInput() {
    return TextFormField(
      onChanged: (String value) => setState(() {
        password = value;
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }
        // Tambahan validasi password sesuai kebutuhan
        return null;
      },
      obscureText: true,
      decoration: customInputDecoration("Password"),
    );
  }

  Widget buildLoginButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Aksi login
          }
        },
        child: Text('Login', style: headerStyle(level: 2)),
      ),
    );
  }
}
