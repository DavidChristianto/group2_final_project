import 'dart:convert';
import 'package:ariculture/screens/comment/model/feedback_model.dart';
import 'package:http/http.dart' as http;


List<FeedbackObject> listMyWatchListTotal = [];

Future<List<FeedbackObject>> fetchFeedbackObject() async {
    var url = Uri.parse('https://web-production-19b0.up.railway.app/news/json/');
    var response = await http.get(
      url,
    );

    
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    
    List<FeedbackObject> listFeedbackObject = [];
    for (var d in data) {
      if (d != null) {
        listFeedbackObject.add(FeedbackObject.fromJson(d));
      }
    }
    return listFeedbackObject;
  }
