
import 'package:flutter/material.dart';

class MainFunction{

  void dispDial(BuildContext context, String title, String content){

    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      
    ),);
  }

}
