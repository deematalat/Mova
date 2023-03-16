

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app_flutter/screens/auth/signup_methods.dart';
import 'package:movies_app_flutter/screens/auth/signup_screen.dart';
import 'package:movies_app_flutter/screens/home_screen.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:movies_app_flutter/utils/navi.dart' as navi;
import '../../utils/toast_alert.dart';
import '../../widgets/custom_movies_button.dart';
import '../../widgets/fieldtext.dart';


class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool remmeberMe = false;
  bool isObscure=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.navigate_before, size: 30,),
        ),
      ),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 100.sp,
              height: 170.sp,
              child: Image.asset('assets/logo.png',scale:6,),),
            Text("Sign to Your Account", style: kBoldTitleTextStyle.copyWith(
                fontSize: 26
            ),),
            SizedBox(height: 16.sp,),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8.sp,),
                  textField(controller: _email, hint: 'Email',
                    icon: Icon(Icons.email),),
                  SizedBox(height: 16.sp,),
                  textField(controller: _password, hint: 'Password',
                      icon: Icon(Icons.lock),
                        isObscure:isObscure,
                    suffixIconColor:!isObscure?Colors.white:kDrawerTextColor ,
                    suffixIcon:IconButton(onPressed: (){
                             setState(() {
                               isObscure=!isObscure;
                             });
                    },
                        icon:Icon( isObscure? Icons.visibility : Icons.visibility_off,)
                    ),
                  ),
                  SizedBox(height: 8.sp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor:kMainRedColor,
                        checkColor:Colors.white,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value:remmeberMe, onChanged:(value){
                        setState(() {
                          remmeberMe=value!;
                        });

                      },
                      ),
                      Text('Remmeber me',
                        style: kSubTitleCardBoxTextStyle.copyWith(
                            color: kMainRedColor
                        ),)
                    ],
                  ),
                  CustomMoviesButton(text: 'Sign in', color: kMainRedColor,
                    onPressed: () {
                      _loginWithEmailAndPassword();
                    },
                  ),
                  SizedBox(height: 16.sp,),
                  Row(
                    children: [
                      Expanded(child: Divider(
                        color: kDrawerTextColor,
                      ),),
                      SizedBox(width: 16.sp,),
                      Text('or continue with'),
                      SizedBox(width: 16.sp,),
                      Expanded(child: Divider(
                        color: kDrawerTextColor,
                      ),)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 16.sp,),
            CustomMoviesButton(
              text: 'Sign in with Google', color: kInactiveButtonColor,
              onPressed: () async {
                await LoginWithGoogle();
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder:(context)=>HomeScreen())
                    , (route) => false);

              },
            ),
            SizedBox(height: 16.sp,),
            RichText(
              text: TextSpan(
                text: 'Dont\'t have an account? ',
                style: ksigninTitle,
                children: <TextSpan>[
                  TextSpan(
                    recognizer:TapGestureRecognizer()
                      ..onTap = () {
                        navi.newScreen(newScreen:()=>SignUpScreen(), context: context);
                      },
                    text: 'Sign up',
                    style:ksigninTitle.copyWith(
                        color:kMainRedColor
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      ),
    );
  }



  Future<void> _loginWithEmailAndPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );
        // navigate to home page after successful login
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          toastAlert(message:'No user found for that email.' );
        }
        else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          toastAlert(message:'Wrong password provided for that user.');
        }
        toastAlert(message:e.toString());
      }
    }
  }
}