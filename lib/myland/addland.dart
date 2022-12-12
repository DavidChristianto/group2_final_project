import 'package:ariculture/myland/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:ariculture/myland/landlist.dart';

class AddLandPage extends StatefulWidget {
    const AddLandPage({super.key});

    @override
    State<AddLandPage> createState() => _AddLandPageState();
}

class _AddLandPageState extends State<AddLandPage> {
    final _formKey = GlobalKey<FormState>();
    int? landSize;
    String? cropChoosen;
    final cropList = {
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

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: Text('Add a new land'),
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
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                            hintText: "Input land size here ...",
                                            labelText: "Land Size",
                                            // Added a circular border to make it neater
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Added behavior when name is typed 
                                        onChanged: (String? value) {
                                            setState(() {
                                                landSize = int.parse(value!);
                                            });
                                        },
                                        // Added behavior when data is saved
                                        onSaved: (String? value) {
                                            setState(() {
                                                landSize = int.parse(value!);
                                            });
                                        },
                                        // Validator as form validation
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Amount cannot be empty!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    // Using padding of 8 pixels
                                    padding: const EdgeInsets.all(12.0),
                                    child: DropdownButtonFormField(
                                        hint: const Text('Choose Crop'),
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items: cropList.entries.map((crop) {
                                            return DropdownMenuItem(
                                                value: crop.key,
                                                child: Text(crop.value),
                                            );
                                        }).toList(),
                                        value: cropChoosen,
                                        onChanged: (String? newValue) {
                                            setState(() {
                                                cropChoosen = newValue!;
                                            });
                                        },
                                        onSaved: (String? newValue) {
                                            setState(() {
                                                cropChoosen = newValue!;
                                            });
                                        },
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Please choose a crop!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: TextButton(
                                        child: const Text(
                                            "Calculate",
                                            style: TextStyle(color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.green),
                                        ),
                                        onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                        return Dialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            elevation: 15,
                                                            child: Container(
                                                                child: ListView(
                                                                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                                                                    shrinkWrap: true,
                                                                    children: <Widget>[
                                                                        Center(child: const Text('Summary')),
                                                                        SizedBox(height: 20),
                                                                        DataTable(
                                                                            headingRowHeight: 0,
                                                                            columns:const <DataColumn> [
                                                                                DataColumn(label: Text('')),
                                                                                DataColumn(label: Text('')),
                                                                            ],
                                                                            rows: <DataRow> [
                                                                                DataRow(
                                                                                    cells: <DataCell>[
                                                                                        DataCell(Text('Land Size: ')),
                                                                                        DataCell(Text('${landSize!} m²')),
                                                                                    ],
                                                                                ),
                                                                                DataRow(
                                                                                    cells: <DataCell>[
                                                                                        DataCell(Text('Type: ')),
                                                                                        DataCell(Text(cropList[cropChoosen!]!)),
                                                                                    ],
                                                                                ),
                                                                            ],
                                                                        ),
                                                                        SizedBox(height: 10),
                                                                        ButtonBar(
                                                                            buttonMinWidth: 100,
                                                                            alignment: MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                                TextButton(
                                                                                    onPressed: () {
                                                                                        Navigator.pop(context);
                                                                                    },
                                                                                    child:
                                                                                        Text('Close'),
                                                                                ),
                                                                                TextButton(
                                                                                    onPressed: () async {
                                                                                        Navigator.pop(context);
                                                                                        Navigator.pop(context);
                                                                                        Navigator.pop(context);
                                                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LandListPage()));
                                                                                        final response = await request.post("https://web-production-19b0.up.railway.app/farmland/addland/", {
                                                                                            'size': '${landSize!}',
                                                                                            'plant': cropChoosen!,
                                                                                        });
                                                                                    },
                                                                                    child:
                                                                                        Text('Save'),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        );
                                                    },
                                                );
                                            }
                                        },
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