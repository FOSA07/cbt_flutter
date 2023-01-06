import 'dart:async';

import 'package:cbt_flutter/Account/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {

  runApp(MaterialApp(home: const MyApp(), debugShowCheckedModeBanner: false,));
}

 class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);
 
   @override
   State<MyApp> createState() => _MyAppState();
 }
 
 class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),() => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const OnBoard())));
    // Get.off (() => const OnBoard()));
  }
  
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child: Container(
           color: Colors.white,
           alignment: const Alignment(0,0),
           width: 140,
           height: 140,
           child: const Image(
           image: AssetImage('assets/dem.jpg'),
         ),),
       )
     );
   }
 }
 
 class OnBoard extends StatefulWidget {
   const OnBoard({Key? key}) : super(key: key);
 
   @override
   State<OnBoard> createState() => _OnBoardState();
 }
 
 class _OnBoardState extends State<OnBoard> {
  final PageController _controller=PageController();
  late Timer _timer;
  int _currentPage=0;

  @override
  void initState() {
    super.initState();
    _timer=Timer.periodic(const Duration(seconds: 5), (Timer timer){
      if(_currentPage < 2){
        _currentPage++;
      }else {
        _timer.cancel();
      }

      _controller.animateToPage(_currentPage, duration: const Duration(milliseconds: 20),
          curve: Curves.easeIn);
    });
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Stack(
         children:[ PageView(controller: _controller, children: [
           Container(
            color: Colors.white,
               child:  Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       width: 140,
                       height: 140,
                       alignment: const Alignment(0,0),
                       child: const Image(image: AssetImage('assets/dem.jpg')),
                     ),
                     const SizedBox(height: 15,),
                     const Text('Title One',
                       style: TextStyle(
                         fontSize: 25,
                       ),
                       textAlign: TextAlign.center,
                     ),
                     const SizedBox(height: 15,),
                     const Text('Loreum ipsum dolor sit amet la maryame dor suit colondeum',
                       style: TextStyle(
                         fontSize: 23,
                       ),
                       textAlign: TextAlign.center,
                     ),
                     const SizedBox(height: 25,),
                     SmoothPageIndicator(controller: _controller, count: 3,effect: const WormEffect(
                     activeDotColor: Colors.orange,
                       dotColor: Colors.blueAccent,
                       dotHeight: 10,
                       dotWidth: 10,))
                   ],
                 ),
               ),
           ),
           Container(
            color: Colors.white,
             child:  Padding(
               padding: const EdgeInsets.all(18.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     width: 140,
                     height: 140,
                     alignment: const Alignment(0,0),
                     child: const Image(image: AssetImage('assets/dem1.jpg')),
                   ),
                   const SizedBox(height: 15,),
                   const Text('Title Two',
                     style: TextStyle(
                     fontSize: 25,
                   ),
                      textAlign: TextAlign.center,
                   ),
                   const SizedBox(height: 15,),
                   const Text('Loreum ipsum dolor sit amet la maryame dor suit colondeum',
                     style: TextStyle(
                       fontSize: 23,
                     ),
                     textAlign: TextAlign.center,
                   ),
                   const SizedBox(height: 25,),
                   SmoothPageIndicator(controller: _controller, count: 3,effect: const WormEffect(
                     activeDotColor: Colors.orange,
                     dotColor: Colors.blueAccent,
                     dotHeight: 10,
                     dotWidth: 10,
                   ))
                 ],
               ),
             ),
           ),
           Container(
            color: Colors.white,
             child:  Padding(
               padding: const EdgeInsets.all(18.0),
               child: Column(
                 children: [
                   Expanded(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           width: 140,
                           height: 140,
                           alignment: const Alignment(0,0),
                           child: const Image(image: AssetImage('assets/dem.jpg')),
                         ),
                         const SizedBox(height: 15,),
                         const Text('Title Three',
                           style: TextStyle(
                             fontSize: 25,
                           ),
                           textAlign: TextAlign.center,
                         ),
                         const SizedBox(height: 15,),
                         const Text('Loreum ipsum dolor sit amet la maryame dor suit colondeum',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                           textAlign: TextAlign.center,
                         ),
                         const SizedBox(height: 25,),
                         SmoothPageIndicator(controller: _controller, count: 3,effect: const WormEffect(
                           activeDotColor: Colors.orange,
                           dotColor: Colors.blueAccent,
                           dotHeight: 10,
                           dotWidth: 10,
                         ),),
                       ],
                     ),
                   ),
                   SizedBox(
                     width: MediaQuery.of(context).size.width*0.8,
                     height: 50,
                     child: ElevatedButton(onPressed: (){
                      //  Get.off(() => const Login());
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                     }, child: const Text('Get Started',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                     ),
                       style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.orange,
                         // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                           elevation: 15,
                     ),

                     ),
                   ),
                   const SizedBox(height: 50,),
                 ],
               ),
             ),
           )
         ]),

        ]
       ),
     );
   }
 }
 
class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Oops! Something went wrong',
              style: TextStyle(
                // color: Color.fromRGBO(r, g, b, opacity)
              ),
            ),
            const SizedBox(height: 15,),
            const Text('pls check your internet connection and try again'),
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: (){}, child: const Text('Retry'))
          ],
        ),
      ),
    );
  }
}

