import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app_flutter/screens/auth/signin_screen.dart';
import 'package:movies_app_flutter/screens/auth/signup_methods.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:movies_app_flutter/utils/navi.dart' as navi;
import 'package:sizer/sizer.dart';
import '../../utils/toast_alert.dart';
import '../../widgets/custom_movies_button.dart';
import '../../widgets/fieldtext.dart';
import '../interest_screen.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController  _email= TextEditingController();
  TextEditingController _password=TextEditingController();
  bool remmeberMe=false;
  bool isObscure=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kPrimaryColor,
        elevation:0,
        leading:IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:Icon(Icons.navigate_before,size:30,),
        ),
      ),
      body: SingleChildScrollView(child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width:100,
              height:200,
              child: Image.asset('assets/logo.png'),),
            Text("Create your account",style:kBoldTitleTextStyle.copyWith(
              fontSize:26
            ),),
            SizedBox(height:16.sp,),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height:8.sp,),
                  textField(controller:_email, hint:'Email',
                    icon:Icon(Icons.email),),
                  SizedBox(height:16.sp,),
                  textField(controller:_password, hint:'Password',
                      icon:Icon(Icons.lock),
                    isObscure:isObscure,
                    suffixIconColor:isObscure?Colors.white:kDrawerTextColor,
                    suffixIcon:IconButton(onPressed: (){
                      setState(() {
                        isObscure=!isObscure;
                      });
                    }, icon:Icon( isObscure? Icons.visibility : Icons.visibility_off,)
                    ),
                  ),
                  SizedBox(height:8.sp,),
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
                    Text('Remmeber me',style:kSubTitleCardBoxTextStyle.copyWith(
                      color:kMainRedColor
                    ),)
                  ],
                ),
                CustomMoviesButton(text:'Sign up', color:kMainRedColor,
                  onPressed:() {
                     signUp();
                  },
                ),
                  SizedBox(height:16.sp,),
                  Row(
                    children: [
                     Expanded(child:  Divider(
                        color:kDrawerTextColor,
                      ),),
                      SizedBox(width:16.sp,),
                      Text('or continue with'),
                      SizedBox(width:16.sp,),
                      Expanded(child:  Divider(
                        color: kDrawerTextColor,
                      ),)
                    ],
                  )
                ],
              ),
            ),
            SizedBox( height:16.sp,),
            CustomMoviesButton(text:'Sign up with Google', color:kInactiveButtonColor,
              onPressed:() async {
               await signInWithGoogle();
                navi.newScreen(newScreen:()=>GenreListScreen(), context: context);
              },
            ),
            SizedBox( height:16.sp,),
             RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: ksigninTitle,
            children: <TextSpan>[
              TextSpan(
                recognizer:TapGestureRecognizer()
            ..onTap = () {
              navi.newScreen(newScreen:()=>SignInScreen(), context: context);
            },
                text: 'Sign in',
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

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email.text, password: _password.text);
        print(user);
         navi.newScreen(newScreen:()=>GenreListScreen(), context: context);

      } catch (e) {
        print(e.toString());
        toastAlert(message:e.toString(),themeColor:kSubTitleCardBoxColor);
      }
    }
  }
}



