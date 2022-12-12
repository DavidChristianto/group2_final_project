import 'package:ariculture/review/model/modelsReview.dart';
import 'package:ariculture/review/form.dart';
import 'package:ariculture/review/review.dart';
import 'package:ariculture/main.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class MyReviewListPage extends StatefulWidget {
  const MyReviewListPage({Key? key}) : super(key: key);

  @override
  _MyReviewListState createState() => _MyReviewListState();
}

class _MyReviewListState extends State<MyReviewListPage> {


  Future<List<Review>> fetchModel() async {
    var url = Uri.parse('https://web-production-19b0.up.railway.app/review/json/');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // convert the json data into ToDo object
    List<Review> listReview = []; // conver data yg di fetch dlm json ke dalam models
    for (var d in data) {
      if (d != null) {
        listReview.add(Review.fromJson(d));
      }
    }
    return listReview;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Page'),
        leading: GestureDetector(
                    child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        
                    ),
                    onTap: () {
                        Navigator.pop(context);
                    }
                ),
      ),
      body: FutureBuilder(
          future: fetchModel(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                  child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "The review is empty :(",
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
                  itemBuilder: (_, index) =>
                      GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://i.ibb.co/MpyCMgY/gambar2.jpg'
                                    ),
                                    fit:BoxFit.fill
                                ),
                                color: Colors.grey,
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
                                ListTile(
                                  title:
                                  Text(
                                    "${userMap[snapshot.data![index].fields.user.toString()]}",
                                    style: const TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                RatingBarIndicator(
                                  rating: snapshot.data![index].fields.rating,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 50.0,
                                  direction: Axis.horizontal,
                                ),
                                Text(
                                  "${snapshot.data![index].fields.reviewText}",
                                  // untuk munculin title di cardnyaa
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          )
                      ),
                );
              }
            }
          }
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child:
        FloatingActionButton(
          onPressed: () =>
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyFormPage()),
            )
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}