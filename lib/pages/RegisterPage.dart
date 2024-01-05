import 'package:flutter/material.dart';
import 'package:laporbook/components/input_widget.dart';
import 'package:laporbook/components/styles.dart';
import 'package:laporbook/components/validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String? nama;
  String? email;
  String? noHP;

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    Text('Register', style: headerStyle(level: 1)),
                    Container(
                      child: const Text(
                        'Create your profile to start your journey',
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
                            InputLayout(
                                'Nama',
                                TextFormField(
                                    onChanged: (String value) => setState(() {
                                          nama = value;
                                        }),
                                    validator: notEmptyValidator,
                                    decoration:
                                        customInputDecoration("Nama Lengkap"))),
                            InputLayout(
                                'Email',
                                TextFormField(
                                    onChanged: (String value) => setState(() {
                                          email = value;
                                        }),
                                    validator: notEmptyValidator,
                                    decoration: customInputDecoration(
                                        "email@email.com"))),
                            InputLayout(
                                'No. Handphone',
                                TextFormField(
                                    onChanged: (String value) => setState(() {
                                          noHP = value;
                                        }),
                                    validator: notEmptyValidator,
                                    decoration:
                                        customInputDecoration("+62 80000000"))),
                            InputLayout(
                                'Password',
                                TextFormField(
                                    controller: _password,
                                    validator: notEmptyValidator,
                                    obscureText: true,
                                    decoration:
                                        customInputDecoration("Password"))),
                            InputLayout(
                                'Konfirmasi Password',
                                TextFormField(
                                    validator: (value) =>
                                        passConfirmationValidator(
                                            value, _password),
                                    obscureText: true,
                                    decoration: customInputDecoration(
                                        "Konfirmasi Password"))),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: double.infinity,
                              child: FilledButton(
                                  style: buttonStyle,
                                  child: Text('Register',
                                      style: headerStyle(level: 2)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Aksi registrasi
                                    }
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sudah punya akun? '),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text('Login di sini',
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
}
