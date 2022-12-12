
import 'package:flutter/material.dart';
import 'package:review/form.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:review/main.dart';
import 'package:review/drawer.dart';
import 'package:review/modelsReview.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:review/user.dart';



class MyReviewListPage extends StatefulWidget {
  const MyReviewListPage({Key? key}) : super(key: key);

  @override
  _MyReviewListState createState() => _MyReviewListState();
}

class _MyReviewListState extends State<MyReviewListPage> {


  Future<List<Review>> fetchModel() async {

    var url = Uri.parse('https://web-production-19b0.up.railway.app/review/json/'); // pake method hhttp get untuk dapetin data json
    print('fetching');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    print('fetched!');

    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes)); // decode menjadi json string, lalu abis itu harus dimasukin ke models

    // convert the json data into ToDo object
    List<Review> listReview = []; // conver data yg di fetch dlm json ke dalam models
    for (var d in data) {
      if (d != null) {
        listReview.add(Review.fromJson(d));
      }
    }

    print('parsed');

    return listReview;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Page'),
      ),
      drawer: drawer(),
      body: FutureBuilder( // utk build widget berdasarkan hasil yg didapat dr widget future, yg menghasilkan list
        // listnya itu sbg snapshot, datanya bisa diakses melalui index
          future: fetchModel(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                  child: CircularProgressIndicator()); // klo dia masih fetch data, kek liatin animasi buffer
            } else {
              if (!snapshot.hasData) { // ! klo ga ada datanya munculin pesan
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
                return ListView.builder( // klo ada data masuk ke sini
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) =>
                      GestureDetector( //merupakan wrapper,
                        // jadi bisa membuat event handler yang bermacam-macam untuk 1 child (contohnya handle ontap
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
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
                                  leading:

                                  Image.asset(
                                    'assets/images/gambar.png',
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                  ),
                                  title:
                                  Text(
                                    "${userMap[snapshot.data![index].fields.user.toString()]}",
                                    style: const TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
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
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                // Text("${snapshot.data![index].completed}"),
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
              MaterialPageRoute(builder: (context) => MyFormPage()), //validasi data pasti ga null
            )
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}