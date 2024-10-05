import 'package:flutter/cupertino.dart';
import 'package:news_assessment/models/news_model.dart';
import 'package:news_assessment/sevices/helper/news_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sevices/config.dart';

class HomeNotifier extends ChangeNotifier{

  String _fName = "Tip";

  String get fName => _fName;

  late Future<List<NewsModel>> newsList;


   Future<void> firstName () async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name =  prefs.getString(Config.firstName);
    print(name);
    _fName = name!;
  }

  Future<List<NewsModel>> getNews(){
    newsList = NewsHelper.getNews();
    return newsList;
  }
}
