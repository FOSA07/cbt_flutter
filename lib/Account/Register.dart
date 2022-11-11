
import 'package:cbt_flutter/Account/login.dart';
import 'package:cbt_flutter/Users/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Change.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Expanded(flex: 1, child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 5,),
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: Image(image: AssetImage('assets/dem.jpg')),
                ),
                Form(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Create account',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            // fillColor: Colors.grey,
                            labelText: 'Email'
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        // keyboardType: TextInputType.,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'Password'
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        // keyboardType: TextInputType.,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'Date of Birth'
                        ),
                      ),
                      const SizedBox(height: 15,),
                      RichText(text: const TextSpan(
                        children: [
                          TextSpan(text: 'By signing up, you agree to our ', style: TextStyle(color: Colors.black)),
                          TextSpan(text: 'Terms, Data Policy ' ,style: TextStyle(color: Colors.orange)),
                          TextSpan(text: 'and ', style: TextStyle(color: Colors.black)),
                          TextSpan(text: 'Cookies Policy', style: TextStyle(color: Colors.orange))
                        ]
                      )),
                      const SizedBox(height: 40,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.6,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: ElevatedButton(onPressed: (){
                            Get.to(()=> const Confirmation());
                          }, child: const Text('Register',
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.6,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: ElevatedButton(onPressed: (){
                            Get.off(() => const Login());
                          }, child: const Text('Login',
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
                // Text('this'),
                // Text('data')


              ],)
            ),
            // Expanded(flex: 0,child: Text('TWO'))
          ],
        ),
      ),
    );
  }
}

class Confirmation extends StatelessWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
                height: 140,
                width: 140,
                child: Image(image: AssetImage('assets/dem.jpg'))),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Confirmation code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            RichText(text: const TextSpan(
              children: [
                TextSpan(text: 'Enter the confirmation code sent to ', style: TextStyle(color: Colors.black)),
                TextSpan(text: 'your@gmail.com' ,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
              ]
            )),
            const SizedBox(height: 15,),
            Form(child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    labelText: 'Confirmation code'
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(text: const TextSpan(
                      children: [
                        TextSpan(text: 'Didn\'t receive the code?  ', style: TextStyle(color: Colors.black)),
                        TextSpan(text: 'Resend' ,style: TextStyle(color: Colors.orange))
                      ]
                  )),
                ],
              ),
              const SizedBox(height: 40,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.6,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: ElevatedButton(onPressed: (){
                    Get.to(()=> const Home());
                  }, child: const Text('Submit',
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
              SizedBox(
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
            ],))
          ],
        ),
      ),
    );
  }
}

