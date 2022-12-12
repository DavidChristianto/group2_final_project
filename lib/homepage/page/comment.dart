import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ariculture/account/login.dart';
import 'package:ariculture/account/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ariculture/main.dart';
import 'package:ariculture/homepage/page/actual.dart';
import 'package:ariculture/homepage/model/commentmodel.dart';
import 'package:ariculture/homepage/page/createcomment.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  int _selectedIndex = 0;
  Future<List<Comment>> fetchComment() async {
    final request = context.watch<CookieRequest>();

    var data =
        await request.get('https://web-production-19b0.up.railway.app/get/');

    

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
        appBar: AppBar(
          title: Text('Ariculture',
              style: TextStyle(color: Colors.black, fontSize: 30)),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {},
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
                          "There are no comments currently :(",
                          style:
                              TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 2.0)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text("${snapshot.data![index].fields.comment}"),
                                ],
                              ),
                            ));
                  }
                }
          }),
        ),
        floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child:
        FloatingActionButton(
          onPressed: () =>
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCommentPage()),
            )
          },
          child: Icon(Icons.add),
        ),
      ),
      );
  }
}
