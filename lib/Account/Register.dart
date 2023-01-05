
import 'package:cbt_flutter/Account/login.dart';
import 'package:cbt_flutter/PublicFunction/mainFunctions.dart';
import 'package:cbt_flutter/Users/Home.dart';
import 'package:cbt_flutter/api\'s/apiService.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'Change.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _password=TextEditingController();
  TextEditingController _username=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _first_name=TextEditingController();
  TextEditingController _last_name=TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
  String? _validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Name is required';
    }

    if (!nameExp.hasMatch(value!)) {
      return 'alphabetic characters only';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: GFLoader(
          type: GFLoaderType.circle,
          loaderColorOne: GFColors.DANGER,
          loaderColorTwo: GFColors.WARNING,
          loaderColorThree: GFColors.SUCCESS,
          size: 50,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 40,),
                      const SizedBox(
                        height: 100,
                        width: 100,
                        child: Image(image: AssetImage('assets/dem.jpg')),
                      ),
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
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: true,
                        enableSuggestions: true,
                        validator: (val) {
                          if (val!.isEmpty && val.length < 4) {
                            return 'Email is too short';
                          } else if (val.isEmpty) {
                            return 'Email field cant be empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            // fillColor: Colors.grey,
                            labelText: 'Email'
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        // keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: _password,
                        validator: (val) {
                          if (val!.isEmpty && val.length < 6) {
                            return 'Password is too short';
                          } else if (val.isEmpty) {
                            return 'password field cant be empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'Password'
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: _username,
                        // keyboardType: TextInputType.,
                        validator: (val) {
                          if (val!.isEmpty && val.length < 4) {
                            return 'Username is too short';
                          } else if (val.isEmpty) {
                            return 'Username field cant be empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'Username'
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: _first_name,
                        validator: _validateName,
                        // keyboardType: TextInputType.,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'First_Name'
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: _last_name,
                        validator: _validateName,
                        // keyboardType: TextInputType.,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'Last_Name'
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
                      ElevatedButton(onPressed: (){
                      }, child: Text("help")),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.6,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: ElevatedButton(onPressed: () async{
                            if(_form.currentState!.validate()){
                              context.loaderOverlay.show();
                              // await ApiService().getUsers().then((value) {
                              //   context.loaderOverlay.hide();
                              // });
                              String response=await ApiService().registerUser(
                                _password.text, 
                                _username.text, 
                                _first_name.text, 
                                _last_name.text, 
                                _email.text);

                              if(response=='success'){
                                context.loaderOverlay.hide();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                              }else{
                                context.loaderOverlay.hide();
                                MainFunction().dispDial(context, 'Error', response);
                              }
                            }
                  
                            // Get.to(()=> const Confirmation());
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
                            // Get.off(() => const Login());
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
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
                      SizedBox(height: 40,)
                      // Text('this'),
                      // Text('data')
                  
                  
                    ],),
                  // Expanded(flex: 0,child: Text('TWO'))
                ],
              ),
            ),
          ),
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
                    // Get.to(()=> const Home());
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
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

