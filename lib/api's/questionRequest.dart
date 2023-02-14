import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class QuestionRequest {
  Future addQuestion(String access, String subjectId, String questionNumber,
      String time, String questionYear, String filePath) async {
    
    var headers = {
      'Authorization': 'Bearer $access',
      // 'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      // 'Content-Type': 'multipart/form-data'
      // 'Content-Type': 'application/vnd.ms-excel',
      'Content-Type': 'application/json'
    };

    try {
      var request =
          http.MultipartRequest('POST', 
            Uri.parse('https://jamb-api.onrender.com/api/questions/'));
      // request.fields['subject'] = subjectId;
      // request.fields['question_number'] = questionNumber;
      // request.fields['time_permitted'] = time;
      // request.fields['question_year'] = questionYear;
      request.fields.addAll({
       'subject': subjectId,
       'question_number': questionNumber,
       'time_permitted': time,
       'question_year': questionYear
     });
      request.headers.addAll(headers);

      request.files.add(await http.MultipartFile.fromPath('file', filePath));

      var response = await request.send();

      print(await response.statusCode);
      print(await response.stream.bytesToString());
    } catch (e) {
      print(e);
    }
  }
}
