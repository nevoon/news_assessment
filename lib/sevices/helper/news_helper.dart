import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:news_assessment/models/news_model.dart';
import '../config.dart';

class NewsHelper{
  static var client = https.Client();



  static Future<List<NewsModel>> getNews() async{

    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    //String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'X-Finnhub-Token' : Config.apiKey
    };

    var url = Uri.https(Config.apiUrl, Config.link);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );


    if(response.statusCode == 200){
      print("Seennn" + response.body);

      var newsList = newsModelFromJson(response.body);
      return newsList;
    } else {
      throw Exception("Failed to load messages");

    }
  }
}