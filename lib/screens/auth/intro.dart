

import 'package:flutter/material.dart';
import 'package:movies_app_flutter/screens/auth/signin_screen.dart';
import 'package:movies_app_flutter/screens/auth/signup_methods.dart';
import 'package:movies_app_flutter/utils/navi.dart'as navi;
import 'package:sizer/sizer.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_movies_button.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(child:SafeArea(
        child: Column(
        children: [
          Container(
            height:200.sp,
            width:200.sp,
            child: Image.asset('assets/undraw_Welcome.png',
            ),),
          Text(kIntroText,style:kBoldTitleTextStyle.copyWith(
            fontSize:32
          ),),
          SizedBox(height: 16.sp,),
          CustomMoviesButton(text: 'Continue with Email', color: kMainRedColor,
            onPressed: () {
             navi.newScreen(newScreen: ()=>SignInScreen(), context: context);
            },
          ),
          SizedBox(height: 16.sp,),
          Row(
            children: [
              Expanded(child: Divider(
                color: kDrawerTextColor,
              ),),
              SizedBox(width: 16.sp,),
              Text('or'),
              SizedBox(width: 16.sp,),
              Expanded(child: Divider(
                color: kDrawerTextColor,
              ),)
            ],
          ),
          SizedBox(height: 16.sp,),
          CustomMoviesButton(
            text: 'Continue with Google', color: kInactiveButtonColor,
            onPressed: () {
              LoginWithGoogle();
            },
          ),
          SizedBox(height: 16.sp,),
        ],
      ),),
      ),
    );
  }
}
