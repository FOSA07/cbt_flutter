import 'dart:convert';
import 'dart:io';

import 'package:cbt_flutter/Providers/provider1.dart';
import 'package:cbt_flutter/api\'s/contants.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AccountRequest{

  Future<String> registerUser(String password, String username, String first_name,
    String last_name, String email) async{
    String status='unable to connect';

    try{
      var url=Uri.parse(ApiConstants.baseUrl + '/api/accounts');
    final response =await http.post(
      Uri.parse(ApiConstants.baseUrl + '/api/accounts/'),
      // Uri.parse("https://"),
      headers: <String,String>{
        // 'Content-Type': 'application/json',
        HttpHeaders.contentTypeHeader: "application/json",
        "Connection": "Keep-Alive"
      },
      
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
        "username": username,
        "last_name": last_name,
        "first_name": first_name
      }),
      
    );

    // print(response.body);
    status=response.body;
    // print(response.);
    
    if(response.statusCode == 200 || response.statusCode==201){
      status='success';
      
    }else if(response.statusCode == 400){
      status='an error occured';
      String resp=response.body;
      if(resp.contains('Enter a valid email address.')){
        status='Enter a valid email address.';
      }
    }
    if(response.body.contains("user with this Email address already exists.")){
      status='user with the Email address already exists.';
    }else if(response.body.contains("A user with that username already exists.")){
      status='A user with the username already exists.';
    }
  
  }catch(e){
    status='unable to connect';
  }

  return status;   
  }



  Future login(String username, String password) async{
    String status='pending';
    print(status);
    try{
      var url=Uri.parse(ApiConstants.baseUrl + '/api/token');
    final response =await http.post(
      Uri.parse(ApiConstants.baseUrl + '/api/token/'),
      // Uri.parse("https://"),
      headers: <String,String>{
        // 'Content-Type': 'application/json',
        HttpHeaders.contentTypeHeader: "application/json",
        "Connection": "Keep-Alive"
      },
      
      body: jsonEncode(<String, String>{
        "password": password,
        "username": username,
      }),
      
    );


    status=response.body;
    if(status.contains('No active account found with the given credentials')){
      status='user not found';
    }
    if(response.statusCode == 200){
      status='success';
      // print(response.body);

      Map<String, dynamic> _model= jsonDecode(response.body);
      print(_model["refresh"]);
      Access().setRef(_model["refresh"]);
      status='success${_model["access"]}';
      // Access(access: _model["refresh"]);
    }else if(response.statusCode == 400){
      status='unable to connect';
    }else{
      status='unable to connect';
    }
  
  }catch(e){
    status='heroku error';

  }
    return status;
  }
}

class Access{
  String ref='';

  String get reff => ref;

  void setRef(String access){
    this.ref=access;
  }  
}