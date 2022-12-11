import 'package:flutter/material.dart';
import 'package:review/form.dart';

import 'package:review/review.dart';
import 'package:review/main.dart';




class drawer extends StatelessWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          children: [

            ListTile(
              title: const Text('Add Review'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Show Review'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyReviewListPage()),
                );
              },
            ),
          ],
      ),
    );
  }
}