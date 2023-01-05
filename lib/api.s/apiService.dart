import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cbt_flutter/Providers/provider1.dart';
import 'package:cbt_flutter/api\'s/contants.dart';
import 'package:cbt_flutter/api\'s/model.dart';
import 'package:http/http.dart' as http;

class ApiService{

  Future<Map<String, dynamic>> getUsers() async{
    try{
      var url= Uri.parse(ApiConstants.baseUrl + '/api/accounts');
      var response = await http.get(url,
        headers: <String,String>{
        // 'Content-Type': 'application/json',
        HttpHeaders.contentTypeHeader: "application/json",
        "Connection": "Keep-Alive"
      },
      );

      if(response.statusCode == 200){
        var resp={response.body};
        var dar=jsonDecode(response.body);
        
        Map<String, dynamic> _model= jsonDecode(response.body);
        int len=_model["count"];
        for(int a=0;a<len;a++){

        }
        // print(_model);

        return _model;
      }

      
    }catch (e){
      log(e.toString());
    }

    return {};
  }

  Future postQuestions(String subject_title, String subject_code) async{
    try{
    var response = http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.postSubjectEndPoint),
      body: {
        "subject_title": subject_title,
        "subject_code": subject_code
      }
    );

    // print(response.statusCode);
  
  }catch(e){

  }
  }

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
      
    }else if(response.statusCode == 400){
    }
  
  }catch(e){
    status='heroku error';

  }
    return status;
  }

  
}

class Album{

  Album({
        // this.userId,
        required this.password,
        // this.lastLogin,
        // this.isSuperuser,
        required this.username,
        // this.isStaff,
        // this.isActive,
        // this.dateJoined,
        required this.firstName,
        required this.lastName,
        required this.email,
        // this.createdOn,
        // this.updatedOn,
        // this.groups,
        // this.userPermissions,
    });

      // String userId;
    String password;
    // DateTime lastLogin;
    // bool isSuperuser;
    String username;
    // bool isStaff;
    // bool isActive;
    // DateTime dateJoined;
    String firstName;
    String lastName;
    String email;

    factory Album.fromjson(Map<String, dynamic> json){
      return Album(
        password: json["results"]["password"], 
        username: json["results"]["username"], 
        firstName: json["results"]["first_name"], 
        lastName: json["results"]["last_name"], 
        email: json["results"]["email"]);
    }
}