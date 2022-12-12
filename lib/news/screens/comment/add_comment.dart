import 'package:ariculture/screens/comment/display_feedback.dart';
import 'package:flutter/material.dart';
import 'package:ariculture/screens/home_screen.dart';
import 'package:ariculture/screens/navpage.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AddCommentPage extends StatefulWidget {
  const AddCommentPage({super.key});

  @override
  State<AddCommentPage> createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String _reccomendation = "";
  DateTime _date = DateTime.now();

  final _controllername = TextEditingController();
  final _controllerreccomendation = TextEditingController();

  void clearText() {
    _controllername.clear();
    _controllerreccomendation.clear();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reccomendation'),
        backgroundColor: Colors.lightGreen.shade300,
      ),
      // Form
      backgroundColor: Colors.lightGreen.shade100,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllername,
                    decoration: InputDecoration(
                      hintText: "Put your Name here",
                      labelText: "Name",
                      icon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        name = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'You need to fill your name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerreccomendation,
                    decoration: InputDecoration(
                      hintText: "Put your reccomendations here",
                      labelText: "Comment",
                      icon: const Icon(Icons.comment),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _reccomendation = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _reccomendation = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'you need to fill this';
                      }

                      return null;
                    },
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black54),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await request.post(
                          'https://web-production-19b0.up.railway.app/news/save_review/',
                          {
                            'name': name,
                            'review': _reccomendation,

                          });
                      clearText();
                    }
                  },
                  child: const Text(
                    "Send",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
