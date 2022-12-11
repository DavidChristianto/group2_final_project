import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:review/main.dart';


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

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar : AppBar(
          title: Text('Register Page'),
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
                                    borderRadius: BorderRadius.circular(5.0),
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
                                  icon: const Icon(Icons.people),
                                  // Added a circular border to make it neater
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
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
                                  icon: const Icon(Icons.people),
                                  // Added a circular border to make it neater
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
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
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
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
                                    Navigator.pushNamed(
                                        context, '/login'
                                    );
                                  } else {
                                    print('nopers');
                                  }
                                }
                              }
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}