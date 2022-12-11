import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ariculture/screens/comment/model/feedback_model.dart';
import 'package:ariculture/screens/comment/fetch.dart';
import 'package:flutter/material.dart';
import 'package:ariculture/screens/home_screen.dart';


class DisplayFeedbackPage extends StatefulWidget {
  const DisplayFeedbackPage({Key? key}) : super(key: key);

  @override
  State<DisplayFeedbackPage> createState() => _DisplayFeedbackState();
}

class _DisplayFeedbackState extends State<DisplayFeedbackPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        title: const Text('Reccomendation Topic from the website'),
        backgroundColor: Colors.lightGreen.shade300,
      ),
      body: FutureBuilder(
        
        future: fetchFeedbackObject(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "No Feedback Available",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, i) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        elevation: 2,
                                        shadowColor: Colors.black,
                                        child: ListTile(
                                          title: Text(
                                            "${snapshot.data![i].fields.name}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(
                                              "${(snapshot.data![i].fields.review)}"),
                                          trailing: Text(
                                            "${snapshot.data![i].fields.date}",
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),

                      ));
            }
          }
        },
      ),
    );
  }
}
