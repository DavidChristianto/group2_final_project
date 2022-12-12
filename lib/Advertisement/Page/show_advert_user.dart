import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ariculture/Advertisement/Model/advert.dart';
import 'package:ariculture/Advertisement/Page/advert_create.dart';

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
                actions: [
                    IconButton(
                        onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MyFormPage()),
                            );
                        },
                        icon: Icon(
                            Icons.logout,
                            color: Colors.white,
                    ))
                ],
            ),
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
                        image: DecorationImage(
                            image:(snapshot.data![index].fields.adType == 'FARMLAND')? NetworkImage(
                                'https://imageio.forbes.com/specials-images/imageserve/62be10f32ce37625d88bca9b/Tractor-spraying-pesticides-on-soybean-field--with-sprayer-at-spring/960x0.jpg?format=jpg&width=960'
                            ):NetworkImage(
                                'https://www.jbtc.com/foodtech/wp-content/uploads/sites/2/2021/08/Fresh-Produce-Collage.jpg'
                            ),
                            fit:BoxFit.fill
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                        BoxShadow(
                            color: Colors.white,
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
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                            Text(
                                "${snapshot.data![index].fields.description}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                ),
                            ),
                            Text(
                                "by : ${snapshot.data![index].fields.username}",
                                style: const TextStyle(
                                    color: Colors.white,
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