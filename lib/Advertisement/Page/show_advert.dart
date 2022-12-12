import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ariculture/Advertisement/Model/advert.dart';
import 'package:ariculture/Advertisement/Page/show_advert_user.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';


class show_advert extends StatefulWidget {
    const show_advert({super.key});

    @override
    State<show_advert> createState() => _show_advert();
}

class _show_advert extends State<show_advert> {

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        Future<List<Advert>> fetchAdvert() async {
            var response = await request.get('https://web-production-19b0.up.railway.app/json/');
            List<Advert> listAdvert = [];
            for (var d in response) {
                if (d != null) {
                    listAdvert.add(Advert.fromJson(d));
                }
            }
            return listAdvert;
        }

        return Scaffold(
            appBar: AppBar(
                title: Text('Data'),
                actions: [
                    IconButton(
                        onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Show_advert_user()),
                            );
                        },
                        icon: Icon(
                            Icons.people,
                            color: Colors.white,
                    ))
                ],
            ),

            body: FutureBuilder(
                future: fetchAdvert(),
                 builder: (context, AsyncSnapshot snapshot){
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

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
                            TextButton(
                                child: const Text("Delete",style: TextStyle(color: Colors.white)),
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                                onPressed: () async {
                                    final response = await request.post("https://web-production-19b0.up.railway.app/set_remove_flutter/${snapshot.data![index].pk}",
                                    {});
                                    setState(() {});
                                },
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