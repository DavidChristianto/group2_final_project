import 'package:flutter/material.dart';
import 'package:ariculture/myland/landlist.dart';

class DashboardPage extends StatefulWidget {
    const DashboardPage({super.key});

    @override
    _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Dashboard'),
            ),
            // drawer: DrawerWidget(),
            body: TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LandListPage()),
                ),
                child: Text('UwU')
            ),
        );
    }
}

