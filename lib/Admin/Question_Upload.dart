import 'package:flutter/material.dart';

// ignore: camel_case_types
class Question_Upload extends StatefulWidget {
  const Question_Upload({Key? key}) : super(key: key);

  @override
  State<Question_Upload> createState() => _Question_UploadState();
}

// ignore: camel_case_types
class _Question_UploadState extends State<Question_Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Upload Question'),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_sharp), onPressed: (){ },),
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('PlaceHolder',
                            // textAlign: TextAlign.center,
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('PlaceHolder',
                            // textAlign: TextAlign.center,
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('PlaceHolder',
                            // textAlign: TextAlign.center,
                          ),
                        )
                    ),
                  ),

                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.8,
                  child: ElevatedButton(onPressed: (){ }, child: const Text('Upload'),
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
    );
  }
}

