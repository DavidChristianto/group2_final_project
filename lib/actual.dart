import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ariculture/account/login.dart';
import 'package:ariculture/account/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ariculture/main.dart';

class ActualPage extends StatefulWidget {
    const ActualPage({super.key});

    @override
    State<ActualPage> createState() => _ActualPageState();
}

class _ActualPageState extends State<ActualPage> {

    int _selectedIndex = 0;

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar : AppBar(
                title: Text(
                    'Ariculture',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30
                        )
                    ),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                actions: [
                    IconButton(
                        onPressed: () {
                        },
                        icon: Icon(
                            Icons.people,
                            color: Colors.green,
                    ))
                ],
            ),
            body: SingleChildScrollView(
                // NA
            ),

            bottomNavigationBar: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
                ),
                child: BottomNavigationBar(
                    elevation: 0.0,
                    currentIndex: _selectedIndex,
                    items: [
                        BottomNavigationBarItem(
                            backgroundColor: Colors.transparent,
                            icon: Icon(Icons.home),
                            label: "Home",
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.transparent,
                            icon: Icon(Icons.newspaper),
                            label: "News",
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.transparent,
                            icon: Icon(Icons.border_color),
                            label: "Review",
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.transparent,
                            icon: Icon(Icons.broadcast_on_personal),
                            label: "Advertisement",
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.transparent,
                            icon: Icon(Icons.add_comment),
                            label: "Comment",
                        ),
                    ],
                    onTap: (index) {
                        switch(index) {
                            case 0: {
                                setState(() {
                                    _selectedIndex = index;
                                });

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ActualPage()),
                                );
                                print('home');
                                break;
                            }
                            case 1: {
                                setState(() {
                                    _selectedIndex = index;
                                });

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ActualPage()),
                                );
                                print('news');
                                break;
                            }
                            case 2: {
                                setState(() {
                                    _selectedIndex = index;
                                });

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ActualPage()),
                                );
                                print('rev');
                            break;
                            }
                            case 3: {
                                setState(() {
                                    _selectedIndex = index;
                                });

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ActualPage()),
                                );
                                print('adv');
                                break;
                                }
                            case 4: {
                                setState(() {
                                    _selectedIndex = index;
                                });
                                
                                Navigator.pushReplacement(                                        
                                    context,
                                    MaterialPageRoute(builder: (context) => const ActualPage()),
                                );
                                print('com');
                                break;
                            }
                        }
                    },
                ),
            )
        );
    }
}