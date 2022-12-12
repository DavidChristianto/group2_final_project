import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ariculture/main.dart';
import 'dart:convert';
import 'package:ariculture/actual.dart';

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final _loginFormKey = GlobalKey<FormState>();

    String username = "";
    String password = "";
    String error = "";

    bool isPasswordVisible = false;

    void togglePasswordView() {
        setState(() {
        isPasswordVisible = !isPasswordVisible;
        });
    }

    Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('Do you want to exit app?'),
            actions: [
                ElevatedButton(
                    child: Text('No'),
                    onPressed: () => Navigator.pop(context, false),
                ),
                ElevatedButton(
                    child: Text('Yes'),
                    onPressed: () => Navigator.pop(context, true),
                ),
            ]
        )
    );

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return WillPopScope(
            onWillPop: () async {
                final shouldPop = await showWarning(context);

                return shouldPop ?? false;
            },
            child: Scaffold(
                appBar : AppBar(
                    title: Text('', style: TextStyle(color: Colors.black)),
                    elevation: 0.0,
                    backgroundColor: Colors.transparent
                ),
                body: Form(
                    key: _loginFormKey,
                    child: SingleChildScrollView(
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.15),
                                        child: Column(
                                            children: [
                                                Padding(
                                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
                                                    child: Text(
                                                        "ARICULTURE",
                                                        style: TextStyle(
                                                            fontSize: 65,
                                                            fontWeight: FontWeight.bold,
                                                            )
                                                    )
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.025),
                                                    child: Text(
                                                        "LOGIN",
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.green
                                                            )
                                                    )
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
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
                                                SizedBox(height: 10),
                                                Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
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
                                                Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                            SizedBox(
                                                                child: TextButton(
                                                                    child: const Text(
                                                                        "Register",
                                                                        style: TextStyle(color: Colors.green),
                                                                    ),
                                                                    style: ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                                                    ),
                                                                    onPressed: () async {
                                                                        Navigator.pushNamed(context, '/register');
                                                                    }
                                                                )
                                                            ),
                                                            SizedBox(
                                                                child: TextButton(
                                                                    child: const Text(
                                                                        "Login",
                                                                        style: TextStyle(color: Colors.white),
                                                                    ),
                                                                    style: ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all(Colors.green),
                                                                    ),
                                                                    onPressed: () async {
                                                                        if (_loginFormKey.currentState!.validate()) {
                                                                            final response = await request.login("http://127.0.0.1:8000/account/login_f/", {
                                                                            'username': username,
                                                                            'password': password,
                                                                        });
                                                                        if (request.loggedIn) {
                                                                            print("before");

                                                                            final data = await request.get("http://127.0.0.1:8000/account/json/");

                                                                            print("after");

                                                                            userMap = {};

                                                                            for (var d in data) {
                                                                                if (d != null) {
                                                                                    userMap[d['pk'].toString()] = d['fields']['username'];
                                                                                }
                                                                            }

                                                                            user = username;

                                                                            Navigator.pushReplacement(
                                                                                context,
                                                                                MaterialPageRoute(builder: (context) => const ActualPage()),
                                                                            );
                                                                            
                                                                        } else {
                                                                            print(request.loggedIn);
                                                                        }
                                                                        }
                                                                    }
                                                                ),
                                                            ),
                                                        ]
                                                    ),
                                                ),
                                                
                                            ]
                                        )
                                    )
                                ]
                            )
                        )
                    )
                )
            )
        );
    }
}