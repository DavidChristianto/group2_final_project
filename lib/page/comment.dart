import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ariculture/account/login.dart';
import 'package:ariculture/account/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ariculture/main.dart';
import 'package:ariculture/actual.dart';
import 'package:ariculture/model/commentmodel.dart';

class CommentPage extends StatefulWidget {
    const CommentPage({super.key});

    @override
    State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

    int _selectedIndex = 0;
    Future<List<Comment>> fetchComment() async {
        var url = Uri.parse('https://web-production-19b0.up.railway.app/get/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // decode the response into the json form
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // convert the json data into ToDo object
        List<Comment> listComment = [];
        for (var d in data) {
            if (d != null) {
                listComment.add(Comment.fromJson(d));
            }
        }

        return listComment;
    }
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
              child: FutureBuilder(
        future: fetchComment(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } else {
            if (!snapshot.hasData) {
                return Column(
                children: const [
                    Text(
                    "To do list is empty :(",
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
                    itemBuilder: (_, index)=> Container(
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
                            "${snapshot.data![index].name}",
                            style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].comment}"),
                        ],
                    ),
                    )
                );
            }
            }
        }
    ),
                //NA
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
                                    MaterialPageRoute(builder: (context) => const CommentPage()),
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