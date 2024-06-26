// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:littlegrowth/auth_service.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexToColor().hexStringToColor("62C9D8"),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                'Selamat\nDatang!',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Masuk',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: Icon(
                              CupertinoIcons.mail,
                              color: Colors.white,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                              ),
                              style: ButtonStyle(
                                iconColor:
                                    WidgetStatePropertyAll<Color>(Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: !_isPasswordVisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 50),
                        Center(
                          child: SizedBox(
                            width: 315,
                            height: 72,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    try {
                                      await authService.login(
                                        _usernameController.text,
                                        _passwordController.text,
                                      );

                                      if (authService.currentUser != null) {
                                        _showSuccessSnackbar('Login Success');
                                        Navigator.pushReplacementNamed(
                                            context, '/home');
                                      } else {
                                        _showErrorSnackbar(
                                            'Invalid username or password');
                                      }
                                    } catch (e) {
                                      setState(() {
                                        _showErrorSnackbar(
                                            'Invalid username or password');
                                        print(e.toString());
                                      });
                                    }
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Masuk'),
                                    SizedBox(
                                        width: 8), // Spasi antara teks dan ikon
                                    Icon(CupertinoIcons.arrow_right),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
    );
  }
}
