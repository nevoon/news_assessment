import 'package:flutter/cupertino.dart';

class IntroNotifier extends ChangeNotifier{

  bool _notice = false;

  bool get notice => _notice;

  set setNotice(bool newState){
    _notice = newState;
    notifyListeners();
  }

}