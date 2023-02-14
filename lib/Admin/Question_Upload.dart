import 'dart:io';

import 'package:cbt_flutter/Admin/FileManager.dart';
import 'package:cbt_flutter/Providers/provider1.dart';
import 'package:cbt_flutter/api\'s/questionRequest.dart';
import 'package:cbt_flutter/api\'s/subject.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:duration_picker_dialog_box/duration_picker_dialog_box.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Question_Upload extends StatefulWidget {
  const Question_Upload({Key? key}) : super(key: key);

  @override
  State<Question_Upload> createState() => _Question_UploadState();
}

// ignore: camel_case_types
class _Question_UploadState extends State<Question_Upload> {

  TextEditingController _hour=TextEditingController();
  TextEditingController _minute=TextEditingController();
  TextEditingController _number=TextEditingController();
  DateTime _selectedDate=DateTime.now();

  final List<String> CourseItem = [
    
  ];
  final List<String> CourseId= [

  ];
  Map map={};
  String? courseSelectedValue;
  String? subjectId;

  List<String> courseItem=["____"];
  final List<String> items = [
    '2019', '2020', '2021', '2022', '2023', '2024', '2025', '2026', '2027', '2028', '2029', '2030',
    '2031', '2031', '2032', '2033', '2034', '2035', '2036', '2037', '2038', '2039', '2040', '2041',
    '2042', '2043', '2044', '2045', '2046', '2047', '2048', '2049', '2050'
  ];
  String? selectedValue;
  String yearPicked="";

  // Future initFunc() async{

  //   final prov= 
  //   courseItem= await SubjectRequest().getSubjects()
  // }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  ValueNotifier<String> subjects=ValueNotifier('...');
  TimeOfDay time= TimeOfDay(hour: 01, minute: 00);
  String path='';

  int start=0;
  @override
  Widget build(BuildContext context) {

    final prov= Provider.of<providerModel>(context);
    final access=prov.access;
    
    Future initFunc() async{
      if(start==0){
        start=1;
        map= await SubjectRequest().getSubjects(access);
        print(map);
        
        for(int a=0;a<map["count"];a++){
          CourseItem.add(map["results"][a]["subject_title"]);
          CourseId.add(map["results"][a]["subject_id"]);
        }
      }

      print(CourseItem);
      print(CourseId);
      // map.forEach((key, value) {courseItem.add(value); });
      // print(courseItem);

      if(subjects.value=='...'){
        subjects.value='___';
      }else{
        subjects.value=='...';
      }

      // setState(() {
        
      // });
    }
    if(start==0){
      // start=1;
      initFunc();
    }
    // initFunc();    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Upload Question'),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_sharp), onPressed: (){
          Navigator.pop(context);
         },),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
          // child: Column(
            // children: [
              child: Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: double.infinity,
                      child: ValueListenableBuilder(
                        valueListenable: subjects,
                        builder:(context, value, child) => DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,
                                          hint: Row(
                                            children: const [
                                              Icon(
                                                Icons.class_,
                                                size: 16,
                                                color: Colors.green,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Select Subject',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          items: CourseItem
                                              .map((item) => DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ))
                                              .toList(),
                                          value: courseSelectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              courseSelectedValue = value as String;
                                              int index= CourseItem.indexOf(courseSelectedValue!);
                                              print(courseSelectedValue);
                                              print(CourseId[index]);
                                              subjectId= CourseId[index];
                                              // levelPicked = levelSelectedValue!;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                          ),
                                          iconSize: 14,
                                          iconEnabledColor: Colors.green,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 50,
                                          buttonWidth: 160,
                                          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(14),
                                            border: Border.all(
                                              color: Colors.grey
                                              // color: Colors.black26,
                                            ),
                                            // color: Colors.redAccent,
                                          ),
                                          buttonElevation: 2,
                                          itemHeight: 40,
                                          itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                          dropdownMaxHeight: 200,
                                          dropdownWidth: 200,
                                          dropdownPadding: null,
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(14),
                                            // color: Colors.redAccent,
                                          ),
                                          dropdownElevation: 8,
                                          scrollbarRadius: const Radius.circular(40),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(0, 0),
                                        ),
                                      ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(width: double.infinity,
                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        isExpanded: true,
                                        hint: Row(
                                          children: const [
                                            Icon(
                                              Icons.calendar_today,
                                              size: 16,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Select Year',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        items: items
                                            .map((item) => DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ))
                                            .toList(),
                                        value: selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value as String;
                                            yearPicked=selectedValue!;
                                            print(selectedValue);
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                        ),
                                        iconSize: 14,
                                        iconEnabledColor: Colors.green,
                                        iconDisabledColor: Colors.grey,
                                        buttonHeight: 50,
                                        buttonWidth: 160,
                                       
                                        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                        buttonDecoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(14),
                                          border: Border.all(
                                            color: Colors.grey
                                            // color: Colors.black26,
                                          ),
                                          // color: Colors.redAccent,
                                        ),
                                        buttonElevation: 2,
                                        itemHeight: 40,
                                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                        dropdownMaxHeight: 200,
                                        dropdownWidth: 200,
                                        dropdownPadding: null,
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14),
                                          // color: Colors.redAccent,
                                        ),
                                        dropdownElevation: 8,
                                        scrollbarRadius: const Radius.circular(40),
                                        scrollbarThickness: 6,
                                        scrollbarAlwaysShow: true,
                                        offset: const Offset(-20, 0),
                                      ),
                                    ),
                    
                    ),
                    const SizedBox(height: 15),
                    SizedBox(width: double.infinity,
                      child: TextField(
                        controller: _number,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        decoration: InputDecoration(
                          hintText: 'questionNumber',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14))
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('Hour'),
                            SizedBox(height: 7,),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: TextField(
                                controller: _hour,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                decoration: InputDecoration(
                                hintText: 'H',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14))
                                )
                              ),),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Minute'),
                            SizedBox(height: 7,),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: TextField(
                                controller: _minute,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                decoration: InputDecoration(
                                hintText: 'M',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14))
                                )
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: InkWell(
                        onTap: () async{
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['xlsx','pdf','doc','docx'],
                          );
                    
                          if (result != null) {
                            path=result.files.single.path!;
                            print(path);
                            File file = File(path);
                          } else {
                            // User canceled the picker
                          }
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowFileManager()));
                        },
                        child: Card(
                            color: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Center(
                                child: path.length>0? Icon(Icons.file_copy, size: 50,): Text(path),
                              ),
                              // child: Center(
                              //   child: Text('PlaceHolder',
                              //     // textAlign: TextAlign.center,
                              //   ),
                              // ),
                            )
                        ),
                      ),
                    ),
              
                  
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.8,
                    child: ElevatedButton(onPressed: () async {
                      if(_hour.text.length>0 && _minute.text.length>0 && _number.text.length>0
                        && yearPicked.length>0 && courseSelectedValue!.length>0
                          && path.length>0){
                        var response= await QuestionRequest().addQuestion(
                          access, 
                          subjectId!, 
                          _number.text, 
                          "${_hour.text}:${_minute.text}", 
                          yearPicked, 
                          path);
                    
                          print(response);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('fill all fields'),));
                      }
                    }, child: const Text('Upload'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 15,
                      ),
                    )),
              )
              ],
              
                ),
              ),
            // ],
          // ),
        ),
      ),
    );
  }

  Widget dial(){
    return DurationPicker(
    duration: Duration(
      hours: 1,
      minutes: 0
    ),
    onChange: (value) {
      print(value);
    },);
  }
}

