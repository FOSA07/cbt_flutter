import 'package:cbt_flutter/Users/Profile.dart';
import 'package:cbt_flutter/Users/Question_List.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_rounded)),
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            // showSearch(context: context, delegate: MySearchDelegate());
            // showSearch(context: context, delegate: delegate());
          }, icon: const Icon(Icons.notifications_active_rounded), color: Colors.orange,),
          InkWell(
            onTap: (){
              Get.to(()=> const Profile());
            },
            child: const CircleAvatar(
              backgroundColor: Colors.orange
            ),
          ),
          const SizedBox(width: 10,)

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
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 10,
                      child: ListTile(
                        onTap: (){
                          Get.to(() => const Question_List());
                        },
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orange[200],
                              child: const Icon(Icons.notifications,color: Colors.white,),
                            ),
                            const Text('English',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            const Text('140 questions',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Card(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange[200],
                            child: const Icon(Icons.notifications,color: Colors.white,),
                          ),
                          const Text('Mathematics',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          const Text('250 questions',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
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
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange[200],
                            child: const Icon(Icons.notifications,color: Colors.white,),
                          ),
                          const Text('Chemistry',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          const Text('120 questions',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Card(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange[200],
                            child: const Icon(Icons.notifications,color: Colors.white,),
                          ),
                          const Text('Biology',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          const Text('80 questions',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
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
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange[200],
                            child: const Icon(Icons.notifications,color: Colors.white,),
                          ),
                          const Text('Physics',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          const Text('255 questions',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Card(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange[200],
                            child: const Icon(Icons.notifications,color: Colors.white,),
                          ),
                          const Text('Literature',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          const Text('412 questions',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
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