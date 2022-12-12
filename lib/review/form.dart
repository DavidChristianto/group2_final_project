import 'dart:io';

import 'package:ariculture/review/model/modelsReview.dart';
import 'package:ariculture/review/form.dart';
import 'package:ariculture/review/review.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


List<Review> data = [];
class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});


  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage>{
  final _formKey = GlobalKey<FormState>();
  // String TitleName = "";
  // String amount = "";
  // String IncomeType = 'Choose Type';
  // List<String> option = ['income', 'expense', 'Choose Type'];

  double rates = 0.0;
  String text_review = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Review'),
        ),
        body: Form(key: _formKey, child: SingleChildScrollView(
          child: Container(

            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
              RatingBar.builder(
              initialRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                rates = rating;
              },
            ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Review Comment",
                      labelText: "Review Comment",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? text) {
                      text_review = text!;
                    },
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:TextButton(
                          child: const Text( // button save
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final response = await request.post("https://web-production-19b0.up.railway.app/review/save_review/",{
                                'rating': '${rates}',
                                'review_text': text_review,

                              });
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MyReviewListPage()),
                              );
                            }
                          },
                        ),
                      ),

                      TextButton(
                        child: const Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        )
    );
  }
}