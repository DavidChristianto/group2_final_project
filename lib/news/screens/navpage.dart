import 'package:flutter/material.dart';
import 'package:ariculture/screens/comment/display_feedback.dart';
import 'package:ariculture/screens/home_screen.dart';

import 'package:ariculture/screens/comment/add_comment.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
    int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List pages = [
    HomeScreen(),
    AddCommentPage(),
    DisplayFeedbackPage(),
    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.transparent,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,

        items: [
          BottomNavigationBarItem(label:"Home",icon: Icon(Icons.home)),
          BottomNavigationBarItem(label:"Add", icon: Icon(Icons.add_comment)), 
          BottomNavigationBarItem(label:"Previous Comments", icon: Icon(Icons.comment)),
        ]),
    );  }
}