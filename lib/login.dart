import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:review/main.dart';
import 'dart:convert';
import 'package:review/review.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar : AppBar(
          title: Text('Login Page'),
        ),
        body: Form(
            key: _loginFormKey,
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
                                    password = value!;
                                  });
                                },
                                // Added behavior when data is saved
                                onSaved: (String? value) {
                                  setState(() {
                                    password = value!;
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
                                if (_loginFormKey.currentState!.validate()) {
                                  final response = await request.login("https://web-production-19b0.up.railway.app/account/login_f/", {
                                    'username': username,
                                    'password': password,
                                  });
                                  if (request.loggedIn) {
                                    final data = await request.get("https://web-production-19b0.up.railway.app/account/json/");
                                    print(data);

                                    userMap = {};

                                    for (var d in data) {
                                      if (d != null) {
                                        print(d['pk']);
                                        print(d['pk'] is int);
                                        userMap[d['pk'].toString()] = d['fields']['username'];
                                      }
                                    }
                                    user = username;
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => const MyReviewListPage()),
                                            (Route route) => false
                                    );
                                  } else {
                                    print(request.loggedIn);
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