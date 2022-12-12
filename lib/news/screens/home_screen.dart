import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ariculture/news/components/breaking_news_card.dart';
import 'package:ariculture/news/components/news_list_tile.dart';
import 'package:ariculture/news/models/news_model.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Ariculture",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
           ),    
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Breaking News",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselSlider.builder(
                  itemCount: NewsData.breakingNewsData.length,
                  itemBuilder: (context, index, id) =>
                      BreakingNewsCard(NewsData.breakingNewsData[index]),
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                  )),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Recent News",
                style: TextStyle(fontSize: 26, color: Colors.black),
              ),
              SizedBox(
                height: 16.0,
              ),
              Column(
                children: NewsData.recentNewsData
                    .map((e) => NewsListTile(e))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
