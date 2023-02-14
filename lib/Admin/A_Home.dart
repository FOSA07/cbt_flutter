import 'package:cbt_flutter/Admin/CreateSubject.dart';
import 'package:cbt_flutter/Admin/SubjectList.dart';
import 'package:flutter/material.dart';


import 'Question_Upload.dart';


// ignore: camel_case_types
class A_Home extends StatefulWidget {
  const A_Home({Key? key}) : super(key: key);

  @override
  State<A_Home> createState() => _A_HomeState();
}

// ignore: camel_case_types
class _A_HomeState extends State<A_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: const Text('Home'),
        centerTitle: true,
        actions: const [
          // Icon(Icons.admin_panel_settings,color: Colors.lightGreen,),
          CircleAvatar(
            backgroundColor: Colors.green,
            child: Text('A'),
          ),
          // IconButton(onPressed: (){ }, icon: Icon(Icons.admin_panel_settings, color: Colors.green,)),
          SizedBox(width: 20,)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  elevation: 1,
                  child: const ListTile(
                    // leading: Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Icon(Icons.search_rounded),
                    //     Text('search',style: TextStyle(),textDirection: TextDecoration(),)
                    //   ],
                    // ),
                    leading: Icon(Icons.search_rounded),
                    title: Text('Search'),
                    // onTap: () => showSearch(context: context, delegate: MySearchDelegate()),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('Subjects',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Card(
                      color: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 10,
                      child: ListTile(
                        onTap: (){
                          // Get.to(() => const Question_Upload());
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateSubject()));
                        },
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green[200],
                              child: const Icon(Icons.notifications,color: Colors.white,),
                            ),
                            FittedBox(
                              child: const Text('Create Subject',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewSubjects()));
                      },

                      child: Card(
                        color: Colors.green[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green[200],
                              child: const Icon(Icons.notifications,color: Colors.white,),
                            ),
                            const Text('View Subject',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Question_Upload()));
                      },
                      child: Card(
                        color: Colors.green[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green[200],
                              child: const Icon(Icons.notifications,color: Colors.white,),
                            ),
                            const Text('Upload Questions',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Card(
                      color: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green[200],
                            child: const Icon(Icons.notifications,color: Colors.white,),
                          ),
                          const Text('View Questions',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Card(
                      color: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green[200],
                            child: const Icon(Icons.notifications,color: Colors.white,),
                          ),
                          const Text('Delete Questions',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Card(
                      color: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green[200],
                            child: const Icon(Icons.notifications,color: Colors.white,),
                          ),
                          const Text('Sample Test',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class delegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // ignore: todo
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // ignore: todo
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // ignore: todo
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // ignore: todo
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }


}


// class MySearchDelegate extends SearchDelegate {
//
//   List<String> searchResults = [
//     'English',
//     'Mathematics',
//     'Physics'
//   ];
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     IconButton(onPressed: (){
//       if(query.isEmpty){
//         close(context, null);
//       }else{
//         query='';
//       }
//     }, icon: const Icon(Icons.clear));
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     IconButton(onPressed: (){
//       close(context, null);
//     }, icon: const Icon(Icons.arrow_back));
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//
//     Center(
//       child: Text(query,style: TextStyle(
//         fontSize: 50,
//         fontWeight: FontWeight.bold
//       ),),
//     );
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//
//     // List<String> suggestions = searchResults.where((searchResult) {
//     //   final result = searchResult.toLowerCase();
//     //   final input = query.toLowerCase();
//     //
//     //   return result.contains(input);
//     // }).toList();
//     //
//     // return ListView.builder(itemCount: suggestions.length,itemBuilder: (context, index) {
//     //
//     //   final suggestion = suggestions[index];
//     //
//     //   return ListTile(
//     //     title: Text(suggestion),
//     //     onTap: (){
//     //       query=suggestion;
//     //
//     //       showResults(context);
//     //     },
//     //   );
//     //
//     // });
//     throw UnimplementedError();
//   }
//
//
// }