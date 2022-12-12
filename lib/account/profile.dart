import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ariculture/main.dart';
import 'dart:convert';
import 'package:ariculture/actual.dart';
import 'package:ariculture/account/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class UserPage extends StatefulWidget {
    const UserPage({super.key});

    @override
    State<UserPage> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
    Future<List<User>> fetchUser() async {
        final request = context.watch<CookieRequest>();
        final data = await request.get('http://127.0.0.1:8000/account/json/');

        List<User> listUser = [];
        for (var d in data) {
            if (d['fields']['last_login'] == null) {
                continue;
            }
            listUser.add(User.fromJson(d));
        }

        return listUser;
    }

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: Text('List of registered user')
            ),

            body: Center(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Text(
                                        "Here are your fellow active User!",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                ),
                                FutureBuilder(
                                    future: fetchUser(),
                                    builder: (context, AsyncSnapshot snapshot) {
                                        if (snapshot.data == null) {
                                            return const Center(child: CircularProgressIndicator());
                                        } else {
                                            if (!snapshot.hasData) {
                                                return Column(
                                                children: const [
                                                    Text(
                                                    "No active User :(",
                                                    style: TextStyle(
                                                        color: Color(0xff59A5D8),
                                                        fontSize: 20),
                                                    ),
                                                    SizedBox(height: 8),
                                                ],
                                                );
                                            } else {
                                                return ListView.builder(
                                                    itemCount: snapshot.data!.length,
                                                    shrinkWrap: true,
                                                    itemBuilder: (_, index) => Container(
                                                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                                        padding: const EdgeInsets.all(20.0),
                                                        decoration: BoxDecoration(
                                                            color:Colors.white,
                                                            borderRadius: BorderRadius.circular(15.0),
                                                            boxShadow: const [
                                                            BoxShadow(
                                                                color: Colors.black,
                                                                blurRadius: 2.0
                                                            )
                                                            ]
                                                        ),
                                                        child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                                Text(
                                                                    "${snapshot.data![index].fields.username}",
                                                                    style: const TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 18.0,
                                                                        fontWeight: FontWeight.bold,
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                );
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