// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Question_List extends StatefulWidget {
  const Question_List({Key? key}) : super(key: key);

  @override
  State<Question_List> createState() => _Question_ListState();
}

// ignore: camel_case_types
class _Question_ListState extends State<Question_List> {

  bool isdone=false;
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios_rounded)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('00:00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width*0.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      color: Colors.black,
                      child: const ListTile(
                        title: Text('Math',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width*0.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      color: Colors.black12,
                      child: const ListTile(
                        title: Text('Phy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width*0.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      color: Colors.black12,
                      child: const ListTile(
                        title: Text('Chem',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width*0.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      color: Colors.black12,
                      child: const ListTile(
                        title: Text('Bio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_rounded)),
                  const Text('Question 2 of 50',
                    style: TextStyle(
                      color: Colors.orange
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_rounded)),
                ],
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.grey[300],
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(child: Text('Loreum ipsum dolor sit amet la maryame dor suit colondeum',
                      textAlign: TextAlign.center,
                    )),
                  )
                ),
              ),
              const SizedBox(height: 10,),
              CheckboxListTile(onChanged: (bool? value) {  }, title: const Text('Loreum ipsum dolor sit amet'), value: false,),
              CheckboxListTile(onChanged: (bool? value) {  }, title: const Text('Loreum ipsum dolor sit amet'), value: false,),
              CheckboxListTile(onChanged: (bool? value) {  }, title: const Text('Loreum ipsum dolor sit amet'), value: false,),
              CheckboxListTile(onChanged: (bool? value) {  }, title: const Text('Loreum ipsum dolor sit amet'), value: false,),

              // SizedBox(
              //   child: Flexible(
              //     child:
                  SizedBox(
                    height: 280,
                    child: Flexible(
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20.0),
                        crossAxisSpacing: 10,
                          crossAxisCount: 7,

                          children: List<Widget>.generate(51, (index) {
                            if(index==0){
                              return Container();
                            }
                            if(index>=2 && index<6 || index==25){
                              isdone=true;
                            }else{
                              isdone=false;
                            }
                            return GridTile(

                                child: Card(
                              color: isdone==true? Colors.orange: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color: isdone==true? Colors.white: Colors.orange,
                                  ),
                                ),
                              elevation: isdone==true? 10: 0,
                              child: Center(child: Text(index.toString(),style: TextStyle(
                                color: isdone==true? Colors.white: Colors.black
                              ),)),
                            ));
                          }),
                      ),
                    ),
                  ),
              Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width*0.2,
                    child: Card(
                      color: Colors.black,
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width*0.2,
                    child: Card(
                        color: Colors.black,
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios),
                        color: Colors.white,
                    )),
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width*0.45,
                    child: Card(
                        color: Colors.orange,
                        child: TextButton(onPressed: () {  },
                        child: const Text('Submit',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),),
                        )),
                  // )
                ],
              ),
              const SizedBox(height: 50,)
              //   ),
              // )
            ],
          ),
        ),
      )
    );
  }
}
