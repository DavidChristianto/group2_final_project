import 'package:ariculture/homepage/page/actual.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ariculture/homepage/page/comment.dart';

class AddCommentPage extends StatefulWidget {
  const AddCommentPage({super.key});

  @override
  State<AddCommentPage> createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String _comment = "";

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
      ),
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
                        _comment = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _comment = value!;
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
                          'https://web-production-19b0.up.railway.app/save_comment_f/',
                          {
                            'name': name,
                            'comment': _comment,
                          });
                      clearText();

                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(                                        
                          context,
                          MaterialPageRoute(builder: (context) => const CommentPage()),
                      );


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
