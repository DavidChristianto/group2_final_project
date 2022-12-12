import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ariculture/model/advert.dart';
import 'package:ariculture/drawer.dart';

class Show_advert_user extends StatefulWidget {
    const Show_advert_user({super.key});

    @override
    State<Show_advert_user> createState() => _Show_advert_user_state();
}

class _Show_advert_user_state extends State<Show_advert_user> {
    Future<List<Advert>> fetchAdvert() async {
        var url = Uri.parse('https://web-production-19b0.up.railway.app/advertisement/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // decode the response into the json form
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        List<Advert> listAdvert = [];
        for (var d in data) {
            if (d != null) {
                listAdvert.add(Advert.fromJson(d));
            }
        }

        return listAdvert;
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Data'),
            ),

            drawer: drawer(),
            body: FutureBuilder(
                future: fetchAdvert(),
                 builder: (context, AsyncSnapshot snapshot){

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
                    itemBuilder: (_, index)=>GestureDetector(
                    child:  Container(
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
                            "${snapshot.data![index].fields.title}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                            Text(
                                "${snapshot.data![index].fields.description}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                ),
                            ),
                            Text(
                                "by : ${snapshot.data![index].fields.username}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ],
                    ),
                    ),
                  ) 
                );
            }
            }
        }
                
            ),

        );

    }
}