import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SubjectRequest{

  Map result={};
  Future postSubject(String accessKey, String title, String code) async{

    var headers = {
      'Authorization': 'Bearer $accessKey',
      'Content-Type': 'application/json'
    };
    try{
    var request = http.Request('POST', Uri.parse('https://jamb-api.onrender.com/api/subjects/'));
    request.body = json.encode({
      "subject_title": title,
      "subject_code": code
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    // http.StreamedResponse response = await request.send();
    var ans=await Response.fromStream(response);
    result = jsonDecode(ans.body) as Map<String, dynamic>;
    print("${response.statusCode}");
  
    if (response.statusCode == 200) {
      result.addAll({"code": "success"});
      print(result);
      print(result);
      // print(await response.stream.bytesToString());
    }else if(response.statusCode == 201){
      // result.addAll({"code": "success"});
      print(result);
      // print(result);
    }
    else {
      print(result);
      // print(response.reasonPhrase);
    }
    }catch (e){
      result={
        "code": "unable to connect",
      };
      print('no internet');
      print(e);
    }

    return result;
  }

  Future getSubjects(String accessKey) async{

    Map result={};
    var headers = {
    'Authorization': 'Bearer $accessKey'
    };
    var request = http.Request('GET', Uri.parse('https://jamb-api.onrender.com/api/subjects/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var ans=await Response.fromStream(response);
    result = jsonDecode(ans.body) as Map<String, dynamic>;

    // print(result);
    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // }
    // else {
    //   print(response.reasonPhrase);
    // }
    return result;
  }
}