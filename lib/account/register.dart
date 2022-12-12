import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ariculture/main.dart';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});

    @override
    State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    final _registerFormKey = GlobalKey<FormState>();

    String username = "";
    String password1 = "";
    String password2 = "";
    String error = "";

    bool isPasswordVisible = false;

    void togglePasswordView() {
        setState(() {
        isPasswordVisible = !isPasswordVisible;
        });
    }

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar : AppBar(
                title: Text('Register Page'),
                leading: GestureDetector(
                    child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        
                    ),
                    onTap: () {
                        Navigator.pop(context);
                    }
                )
            ),
            body: Form(
                key: _registerFormKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Username",
                                            labelText: "Username",
                                            // Add icons to make it more intuitive
                                            icon: const Icon(Icons.people),
                                            // Added a circular border to make it neater
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                            ),
                                        ),
                                        // Added behavior when name is typed 
                                        onChanged: (String? value) {
                                            setState(() {
                                                username = value!;
                                            });
                                        },
                                        // Added behavior when data is saved
                                        onSaved: (String? value) {
                                            setState(() {
                                                username = value!;
                                            });
                                        },
                                        // Validator as form validation
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Username cannot be empty!';
                                            }
                                            return null;
                                        },
                                    )
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                            labelText: "Password",
                                            // Add icons to make it more intuitive
                                            icon: const Icon(Icons.password),
                                            // Added a circular border to make it neater
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            suffixIcon: IconButton(
                                                icon: Icon(
                                                    isPasswordVisible
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                    color: Theme.of(context).primaryColorDark,
                                                ),
                                                onPressed: () {
                                                    togglePasswordView();
                                                }
                                            )
                                        ),
                                        obscureText: !isPasswordVisible,
                                        // Added behavior when name is typed 
                                        onChanged: (String? value) {
                                            setState(() {
                                                password1 = value!;
                                            });
                                        },
                                        // Added behavior when data is saved
                                        onSaved: (String? value) {
                                            setState(() {
                                                password1 = value!;
                                            });
                                        },
                                        // Validator as form validation
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Password cannot be empty!';
                                            }
                                            return null;
                                        },
                                    )
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Repeat Password",
                                            labelText: "Repeat Password",
                                            // Add icons to make it more intuitive
                                            icon: const Icon(Icons.repeat),
                                            // Added a circular border to make it neater
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            suffixIcon: IconButton(
                                                icon: Icon(
                                                    isPasswordVisible
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                    color: Theme.of(context).primaryColorDark,
                                                ),
                                                onPressed: () {
                                                    togglePasswordView();
                                                }
                                            )
                                        ),
                                        obscureText: !isPasswordVisible,
                                        // Added behavior when name is typed 
                                        onChanged: (String? value) {
                                            setState(() {
                                                password2 = value!;
                                            });
                                        },
                                        // Added behavior when data is saved
                                        onSaved: (String? value) {
                                            setState(() {
                                                password2 = value!;
                                            });
                                        },
                                        // Validator as form validation
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Repeat your password!';
                                            }
                                            return null;
                                        },
                                    )
                                ),
                                SizedBox(height: 16),
                                TextButton(
                                    child: const Text(
                                        "Register",
                                        style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.green),
                                    ),
                                    onPressed: () async {
                                        if (_registerFormKey.currentState!.validate()) {
                                            final response = await request.post("https://web-production-19b0.up.railway.app/account/register_f/", {
                                            'username': username,
                                            'password1': password1,
                                            'password2': password2,
                                        });
                                        
                                        if (response['status']) {
                                            Navigator.pop(context);
                                        } else {
                                            setState(() {
                                                error = "Invalid Input!";
                                            });
                                        }
                                        }
                                    }
                                ),
                                SizedBox(height: 16),
                                Text(
                                    error,
                                    style: TextStyle(color: Colors.red)
                                )
                            ]
                        )
                    )
                )
            )
        );
    }
}