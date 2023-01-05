import 'package:cbt_flutter/Account/login.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Change_Password extends StatelessWidget {
  const Change_Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('Forget Pasword',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Form(child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    // fillColor: Colors.grey,
                    labelText: 'Email'
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    labelText: 'New Password'
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    labelText: 'Confirm New Password'
                ),
              ),
              const SizedBox(height: 40,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.6,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: ElevatedButton(onPressed: (){
                    // Get.to(()=> const Sent_Email_Message());
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Sent_Email_Message()));
                  }, child: const Text('Continue',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      // elevation: 15,
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Visibility(
                visible: false,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: ElevatedButton(onPressed: (){
              
                    }, child: const Text('Cancel',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.orange, backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.orange,
                            width: 2,
                            style: BorderStyle.solid,
                          )
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        // elevation: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],),
      ),
    );
  }
}


// ignore: camel_case_types
class Sent_Email_Message extends StatelessWidget {
  const Sent_Email_Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
              width: 100,
              child: Image(image: AssetImage('assets/dem.jpg')),
            ),
          const SizedBox(height: 15,),
          const Text('Email Sent',
            style: TextStyle(
                fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 15,),
          const Text('We sent an email to y***@gmail.com with a link to get back into your account'),
          const SizedBox(height: 55,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.6,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: ElevatedButton(onPressed: (){
                // Get.to(() => const Login());
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
              }, child: const Text('Close',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange, backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.orange,
                      width: 2,
                      style: BorderStyle.solid,
                    )
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  // elevation: 15,
                ),
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
