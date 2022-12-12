import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:ariculture/account/login.dart';

String user = '';
Map <String, String> userMap = {};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Ariculture Home Page',
                theme: ThemeData(
                    primarySwatch: Colors.green,
                    brightness: Brightness.light,
                ),
                home: LoginPage()
            ),
        );
    }
}