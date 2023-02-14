import 'package:cbt_flutter/Providers/provider1.dart';
import 'package:cbt_flutter/api\'s/subject.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewSubjects extends StatelessWidget {
  const ViewSubjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final prov= Provider.of<providerModel>(context);
    String accessKey= prov.access;
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: FutureBuilder(
          future: SubjectRequest().getSubjects(accessKey),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            print(snapshot.data);
            if(snapshot.hasData){

              return Column(
                children: [
                  SizedBox(height: 20),
                  // Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data["count"],
                      itemBuilder: (context, index) {
                        final result = snapshot.data["results"][index]["subject_title"];
                        // final DocumentSnapshot documentSnapshot =
                            // streamSnapshot.data!.docs[index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.book),
                                      SizedBox(width: 20,),
                                      Text(result),
                                    ],
                                  ),
                                  IconButton(onPressed: (){
                                  
                                  }, icon: Icon(Icons.upload_file,),)
                                  
                                ],
                              ),
                            ),
                            Divider()
                          ],
                        );
                    },),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },),
      ),
    );
  }
}