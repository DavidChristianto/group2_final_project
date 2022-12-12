import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ariculture/Advertisement/model/advert.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ariculture/Advertisement/Page/show_advert_user.dart';
import 'package:ariculture/Advertisement/Page/show_advert.dart';
import 'package:ariculture/Advertisement/Page/advert_create.dart';


class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}



class _MyFormPageState extends State<MyFormPage> {
    final _formKey = GlobalKey<FormState>();

    String _title = "";
    List<String> listAdType = ['FARMLAND','PRODUCTS'];
    String description = "";
    String _adtype = "FARMLAND";

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
              title: Text('Form'),
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
              
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                    Padding(
                    // Using padding of 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Your Advert Title",
                            labelText: "Title",
                            // Added a circular border to make it neater
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Added behavior when name is typed 
                        onChanged: (String? value) {
                            setState(() {
                                _title = value!;
                            });
                        },
                        // Added behavior when data is saved
                        onSaved: (String? value) {
                            setState(() {
                                _title = value!;
                            });
                        },
                        // Validator as form validation
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Title cannot be empty!';
                            }
                            return null;
                        },
                    ),
                ),

                    Padding(
                      // Using padding of 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Example: Good tomatoes contact 081241230495\$",
                        // Added a circular border to make it neater
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        // Added behavior when name is typed 
                        onChanged: (String? value) {
                            setState(() {
                                description = value!;
                            });
                        },
                        // Added behavior when data is saved
                        onSaved: (String? value) {
                            setState(() {
                                description = value!;
                            });
                        },
                        // Validator as form validation
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                description = "";
                            }
                            return null;
                        },
                      ),
                    ),
                    Container(
                      child: DropdownButton(
                        value: _adtype,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: listAdType.map((String items) {
                        return DropdownMenuItem(value: items, child: Text(items));}).toList(),
                        
                        onChanged: (String? newValue) {
                        setState(() {
                          _adtype = newValue!;
                        });
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top:20),
                      child: Column(
                        children: [
                        TextButton(
                        child: const Text("Save",style: TextStyle(color: Colors.white)),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                        onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                            final response = await request.post('https://web-production-19b0.up.railway.app/save_ad_f/',{
                                'title' : _title ,
                                'description' : description ,
                                'ad_type' : _adtype
                            });
                        }
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Show_advert_user()),
                        );
                      },
                      ),
                        
                      ]
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