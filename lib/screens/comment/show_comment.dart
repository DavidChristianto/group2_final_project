import 'package:flutter/material.dart';



class ShowCommentPage extends StatefulWidget {
  const ShowCommentPage({super.key});

  @override
  State<ShowCommentPage> createState() => _ShowCommentPageState();
}

class _ShowCommentPageState extends State<ShowCommentPage> {

  static List<DateTime> date = [];
  static List<String> name = [];
  static List<String> reccomendation = [];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        backgroundColor: Colors.lightGreen.shade300,
      ),
      backgroundColor: Colors.lightGreen.shade100,
      body:ListView.builder(
        itemBuilder: (context, index) {
          return Card(
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
                title:Text(
              name[index], style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.left),
                subtitle: Text(
                    reccomendation[index].toString()),
                trailing: Text(date[index].toString(),
                  style: const TextStyle(
                      color: Colors.grey),
                ),
              ),
            );
        },
        itemCount: name.length,
      ),
    );
  }
}


void showcomment(String name, String reccomendation, DateTime date){
  _ShowCommentPageState.name.add(name);
  _ShowCommentPageState.reccomendation.add(reccomendation);
  _ShowCommentPageState.date.add(date);
}
