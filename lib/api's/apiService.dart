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

  Future addQuestion() async{

    var headers = {
  'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc0NDY0MjE4LCJpYXQiOjE2NzQ0NjI0MTgsImp0aSI6ImZlNzIzOWU2MTRhYjQyODJiYTY5YTllMDhmNjg1ZjZiIiwidXNlcl9pZCI6IjQxY2E3ZGNmLTNkYmEtNDg5ZS05N2JiLWMwODEwZDk1MWNkMCJ9.wqVIRR93Z7YbfK_Y2osaVNtRnHF9VYiTjmYO2aIp8lY'
};
var request = http.MultipartRequest('POST', Uri.parse('jamb-api.onrender.com/api/questions/'));
request.fields.addAll({
  'subject': 'b62ad4be-bf71-4706-a678-d5030e9d6a6e'
});
request.files.add(await http.MultipartFile.fromPath('file', '/C:/Users/USER/Documents/jamb sample question.xlsx'));
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

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