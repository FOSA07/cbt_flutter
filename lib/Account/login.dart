import 'package:cbt_flutter/Account/Change.dart';
import 'package:cbt_flutter/Account/Register.dart';
import 'package:cbt_flutter/Admin/A_Home.dart';
import 'package:cbt_flutter/Providers/provider1.dart';
import 'package:cbt_flutter/PublicFunction/mainFunctions.dart';
import 'package:cbt_flutter/Users/Home.dart';
import 'package:cbt_flutter/api\'s/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:cbt_flutter/api\'s/apiService.dart';
import 'package:getwidget/getwidget.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _password=TextEditingController();
  TextEditingController _username=TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  bool check_val=false;
  // LoginClassController control=Get.put(LoginClassController());


  @override
  Widget build(BuildContext context) {
    final hold= Provider.of<providerModel>(context);
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
                        key: _form,
                        child: Column(
                          children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('Login to your account',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: _username,
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
                            // fillColor: Colors.grey,
                            labelText: 'Email'
                          ),
                        ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: _password,
                            obscureText: true,
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
                          Row(
                            children: [
                              Checkbox(value: check_val, onChanged: (bool? val){
                                if(val!=null){
                                  setState(() {
                                    check_val=val;
                                  });
                                }
                              }),
                              const Text('Remember me')
                            ],
                          ),
                          const SizedBox(height: 15,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.8,
                            height: 50,
                            child: ElevatedButton(onPressed: () async {
                              // Get.off(() => const Home());
                              if(_form.currentState!.validate()){
                                context.loaderOverlay.show();
                                String response=await AccountRequest().login(_username.text,_password.text);
                                print(response);
                                if(response.contains('success')){
                                  hold.setAccess(response.replaceFirst('success', ''));
                                  context.loaderOverlay.hide();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const A_Home())); 
                                }else if(response=='heroku error'){
                                  context.loaderOverlay.hide();
                                  MainFunction().dispDial(context, 'Error', 'Unable to connect');
                                }
                                else{
                                  context.loaderOverlay.hide();
                                  MainFunction().dispDial(context, 'Error', 'incorrect username or password');
                                }
                              }
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
                            }, child: const Text('Login',
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
                            const SizedBox(height: 20,),
                            TextButton(onPressed: (){
                              // Get.to(()=> const Change_Password());
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const Change_Password()));
                              ApiService().addQuestion();
                            }, child: const Text('Forget Password?',
                              style: TextStyle(
                                  color: Colors.orange
                              ),
                            )),
                      ],),
                      ),
                  // Text('this'),
                  // Text('data')
                      Column(
                        children: [
                          const Text('or login with'),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SignInButtonBuilder( onPressed: (){}, text: '', backgroundColor: Colors.orange,mini: true,),
                              // SignInButton(Buttons.Google, onPressed: (){},mini: true,),
                              SignInButton(Buttons.Facebook, onPressed: (){},mini: true,),
                              SignInButton(Buttons.Twitter, onPressed: (){},mini: true,)
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Dont\'t have an account?'),
                              TextButton(onPressed: (){
                                // Get.to(() => const Register());
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                              }, child: const Text('Register',
                                style: TextStyle(
                                    color: Colors.orange
                                ),
                              ))
                            ],
                          ),
                        ],
                      ),
        
              ],)),
              // Expanded(flex: 0,child: Text('TWO'))
            ],
          ),
        ),
      ),
    );
  }
}

// class LoginClassController extends GetxController{

//   RxBool isChecked= false.obs;

//   checker(bool istrue){
//     isChecked();
//   }
// }