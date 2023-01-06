import 'package:flutter/material.dart';

class providerModel extends ChangeNotifier{

  String _uid='null';

  String get uid => _uid;

  void setUid(String id){
    this._uid=id;
  }

}