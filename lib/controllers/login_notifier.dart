import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier{
  bool _firstName = false;
  bool _lastName = false;

  bool get firstName => _firstName;
  bool get lastName => _lastName;

  set setFirstName(bool newState){
    _firstName = newState;
    notifyListeners();
  }

  set setLastName(bool newState){
    _lastName = newState;
    notifyListeners();
  }

  final loginFormKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = loginFormKey.currentState;

    if(form!.validate()){
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
