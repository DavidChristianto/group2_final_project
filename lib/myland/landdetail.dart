import 'package:ariculture/myland/models.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
    const DetailPage({super.key, required this.land});

    final UserLand land;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Text('Detail'),
            ),
            body: Container(
                child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    shrinkWrap: true,
                    children: <Widget>[
                        Center(
                            child: Text(
                                land.fields.plant,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                        SizedBox(height: 20),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Text(
                                'Land Info',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                        DataTable(
                            headingRowHeight: 0,
                            columns:const <DataColumn> [
                                DataColumn(label: Text('')),
                                DataColumn(label: Text('')),
                            ],
                            rows: <DataRow> [
                                DataRow(
                                    cells: <DataCell>[
                                        DataCell(Text('Land Size', style: TextStyle(fontWeight: FontWeight.bold))),
                                        DataCell(Text('${land.fields.size} m²')),
                                    ],
                                ),
                                DataRow(
                                    cells: <DataCell>[
                                        DataCell(Text('Amount of plants', style: TextStyle(fontWeight: FontWeight.bold))),
                                        DataCell(Text('${land.fields.amountOfPlants}')),
                                    ],
                                ),
                            ],
                        ),
                        SizedBox(height: 20),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Text(
                                'Fertilizer Needed',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                        DataTable(
                            headingRowHeight: 0,
                            columns:const <DataColumn> [
                                DataColumn(label: Text('')),
                                DataColumn(label: Text('')),
                            ],
                            rows: <DataRow> [
                                DataRow(
                                    cells: <DataCell>[
                                        DataCell(Text('Urea', style: TextStyle(fontWeight: FontWeight.bold))),
                                        DataCell(Text('${land.fields.amountOfUNeeded.toStringAsFixed(2)} kg')),
                                    ],
                                ),
                                DataRow(
                                    cells: <DataCell>[
                                        DataCell(Text('SP36', style: TextStyle(fontWeight: FontWeight.bold))),
                                        DataCell(Text('${land.fields.amountOfSNeeded.toStringAsFixed(2)} kg')),
                                    ],
                                ),
                                DataRow(
                                    cells: <DataCell>[
                                        DataCell(Text('KCl', style: TextStyle(fontWeight: FontWeight.bold))),
                                        DataCell(Text('${land.fields.amountOfKNeeded.toStringAsFixed(2)} kg')),
                                    ],
                                ),
                            ],
                        ),
                        SizedBox(height: 20),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Text(
                                'Expectation',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                        DataTable(
                            headingRowHeight: 0,
                            columns:const <DataColumn> [
                                DataColumn(label: Text('')),
                                DataColumn(label: Text('')),
                            ],
                            rows: <DataRow> [
                                DataRow(
                                    cells: <DataCell>[
                                        DataCell(Text('Yields', style: TextStyle(fontWeight: FontWeight.bold))),
                                        DataCell(Text('${land.fields.expectedYield} kg')),
                                    ],
                                ),
                                DataRow(
                                    cells: <DataCell>[
                                        DataCell(Text('Gross Income', style: TextStyle(fontWeight: FontWeight.bold))),
                                        DataCell(Text('Rp ${land.fields.grossIncome}')),
                                    ],
                                ),
                                DataRow(
                                    cells: <DataCell>[
                                        DataCell(Text('Net Income', style: TextStyle(fontWeight: FontWeight.bold))),
                                        DataCell(Text('Rp ${land.fields.netIncome}')),
                                    ],
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }
}