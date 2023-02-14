import 'package:flutter/material.dart';

class providerModel extends ChangeNotifier{

  String _uid='null';
  String _access='';

  String get uid => _uid;

  void setUid(String id){
    this._uid=id;
    notifyListeners();
  }

  String get access => _access;

  void setAccess(String access){
    this._access=access;
    notifyListeners();
  }

}