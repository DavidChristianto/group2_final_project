import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ariculture/account/login.dart';
import 'package:ariculture/account/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ariculture/main.dart';
import 'package:ariculture/account/profile.dart';

import 'package:ariculture/myland/landlist.dart';
import 'package:ariculture/news/screens/navpage.dart';
import 'package:ariculture/review/review.dart';
import 'package:ariculture/Advertisement/Page/show_advert_user.dart';
import 'package:ariculture/homepage/page/comment.dart';

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
                    '',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30
                        )
                    ),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                actions: [
                    IconButton(
                        onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                    return AlertDialog(
                                        title: const Text('Confirm Logout'),
                                        content: const Text('Are you sure you want to logout?'),
                                        actionsPadding: EdgeInsets.all(16.0),
                                        actions: [
                                            TextButton(
                                                onPressed: () {
                                                    Navigator.pop(context);
                                                },
                                                child: const Text('No')
                                            ),
                                            TextButton(
                                                onPressed: () async {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => const LoginPage()),
                                                    );
                                                    final logout = await request.logout('https://web-production-19b0.up.railway.app/account/logout_user_f/');
                                                    user = '';
                                                    userMap = {};

                                                },
                                                style: TextButton.styleFrom(
                                                    primary: Colors.white,
                                                    backgroundColor: Colors.green,
                                                ),
                                                child: const Text('Yes')
                                            ),
                                        ],
                                    );
                                },
                            );
                        },
                        icon: Icon(
                            Icons.logout,
                            color: Colors.green,
                        )
                    )
                ],
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Ariculture",
                            style: TextStyle(
                                fontSize: 60, color: Color.fromARGB(255, 0, 0, 0))),
                        ),
                    ),
                    Center(
                        child: Text("Aspiring farmers around the globe",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5))),
                    ),
                    Center(
                        child: Text("",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Cairo',
                                color: const Color(0xffFFFFFF).withOpacity(0.5))),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                        child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image(
                            image: NetworkImage("https://w7.pngwing.com/pngs/150/217/png-transparent-green-seedling-illustration-chicken-skin-plant-planting-trees-leaf-plants-crop-thumbnail.png"),
                            fit: BoxFit.contain,
                            width: 300,
                            height: 300,
                        ),
                        ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(20),
                        child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LandListPage()),
                                );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffd3462c),
                                shape: const StadiumBorder(),
                                minimumSize: const Size(280, 50)),
                            child: const Text("Your Farmland!",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Quicksand',
                                    color: Color(0xffFFFFFF)))),
                    ),

                    // Added behavior when budget is typed
                    ],
                )
            ),

            bottomNavigationBar: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                ),
                child: BottomNavigationBar(
                    elevation: 0.0,
                    currentIndex: _selectedIndex,
                    items: [
                        BottomNavigationBarItem(
                            backgroundColor: Colors.green,
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
                        BottomNavigationBarItem(
                            backgroundColor: Colors.transparent,
                            icon: Icon(Icons.people),
                            label: "Meet",
                        ),
                    ],
                    onTap: (index) {
                        switch(index) {
                            case 0: {
                                setState(() {
                                    _selectedIndex = 0;
                                });

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ActualPage()),
                                );
                                break;
                            }
                            case 1: {
                                setState(() {
                                    _selectedIndex = 0;
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MainPage()),
                                );
                                break;
                            }
                            case 2: {
                                setState(() {
                                    _selectedIndex = 0;
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MyReviewListPage()),
                                );
                            break;
                            }
                            case 3: {
                                setState(() {
                                    _selectedIndex = 0;
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Show_advert_user()),
                                );
                                break;
                                }
                            case 4: {
                                setState(() {
                                    _selectedIndex = 0;
                                });
                                
                                Navigator.push(                                        
                                    context,
                                    MaterialPageRoute(builder: (context) => const CommentPage()),
                                );
                                break;
                            }

                            case 5: {
                                setState(() {
                                    _selectedIndex = 0;
                                });
                                
                                Navigator.push(                                        
                                    context,
                                    MaterialPageRoute(builder: (context) => const UserPage()),
                                );
                                break;
                            }
                        }
                    },
                ),
            )
        );
    }
}