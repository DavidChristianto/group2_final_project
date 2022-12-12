import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:ariculture/myland/models.dart';
import 'package:ariculture/myland/landdetail.dart';
import 'package:ariculture/myland/addland.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class LandListPage extends StatefulWidget {
    const LandListPage({super.key});

    @override
    _LandListPageState createState() => _LandListPageState();
}

class _LandListPageState extends State<LandListPage> {

    Future<List<UserLand>> fetchLandList(request) async {
        final plantMap = {
            'PD': 'Rice',
            'JG': 'Corn',
            'KT': 'Peanut',
            'SK': 'Cassava',
            'UJ': 'Sweet Potato',
            'KE': 'Potato',
            'WO': 'Carrot',
            'BW': 'Onion',
            'TM': 'Tomato',
            'PS': 'Banana',
            'JR': 'Orange'
        };

        var data = await request.get('http://localhost:8000/account/profile/json');
        // convert the json data into LandList object
        List<UserLand> listLandList = [];
        for (var d in data) {
            if (d != null) {
                d['fields']['plant'] = plantMap[d['fields']['plant']];
                listLandList.add(UserLand.fromJson(d));
            }
        }

        return listLandList;
    }

    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Land List'),
            ),
            // drawer: DrawerWidget(),
            body: FutureBuilder(
                future: fetchLandList(request),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                    } else {
                        if (!snapshot.hasData) {
                            return Column(
                                children: const [
                                    Text(
                                    "No land listed yet! Go and create one now!",
                                    style: TextStyle(
                                        color: Color(0xff59A5D8),
                                        fontSize: 20),
                                    ),
                                    SizedBox(height: 8),
                                ],
                            );
                        } else {
                            return Center(
                                child: Container(
                                    padding: const EdgeInsets.all(20.0),
                                    child: ListView.separated(
                                        padding: const EdgeInsets.all(12.0),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (BuildContext context, int index) {
                                            return Card(
                                                elevation: 8.0,
                                                margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                                child: ListTile(
                                                    contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 10.0, 10.0),
                                                    leading: Container(
                                                        padding: EdgeInsets.only(right: 12.0),
                                                        decoration: new BoxDecoration(
                                                            border: new Border(
                                                                right: new BorderSide(width: 1.0, color: Colors.grey),
                                                            ),
                                                        ),
                                                        child: Icon(Icons.grass_rounded),
                                                    ),
                                                    trailing: IconButton(
                                                        icon: Icon(
                                                            Icons.delete_forever_outlined,
                                                        ),
                                                        onPressed: () => showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                                return AlertDialog(
                                                                    title: const Text('Confirm Deletion'),
                                                                    content: const Text('Are you sure you want to delete this data?'),
                                                                    actionsPadding: EdgeInsets.all(16.0),
                                                                    actions: [
                                                                        TextButton(
                                                                            onPressed: () {
                                                                                Navigator.pop(context);
                                                                            },
                                                                            child: const Text('Cancel')
                                                                        ),
                                                                        TextButton(
                                                                            onPressed: () async {
                                                                                final response = await request.post(
                                                                                    "http://localhost:8000/account/remove_land_f/${snapshot.data![index].pk!}",
                                                                                    {}
                                                                                );
                                                                                Navigator.pop(context);
                                                                                setState(() {

                                                                                });
                                                                            },
                                                                            style: TextButton.styleFrom(
                                                                                primary: Colors.white,
                                                                                backgroundColor: Colors.red,
                                                                            ),
                                                                            child: const Text('Delete')
                                                                        ),
                                                                    ],
                                                                );
                                                            },
                                                        ),
                                                    ),
                                                    title: Text(
                                                        snapshot.data![index].fields.plant!,
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                    onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(builder: (context) => DetailPage(land: snapshot.data![index])),
                                                        );
                                                    },
                                                ),
                                            );
                                        },
                                        separatorBuilder: (BuildContext context, int index) => const Divider()
                                    ),
                                ),
                            );
                        };
                    };
                },
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddLandPage()),
                    );
                },
                tooltip: 'Create Land',
                child: const Icon(Icons.add),
            ),
        );
    }
}

