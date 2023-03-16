

import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/navi.dart';
import 'package:sizer/sizer.dart';
import '../utils/constants.dart';
import '../widgets/custom_movies_button.dart';
import 'auth/intro.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          Opacity(
            opacity: 0.5,child: Container(
            decoration:BoxDecoration(
                image:DecorationImage(
                  image:AssetImage("assets/poster.jpg",
                  ),
                  fit: BoxFit.cover,

                )
            ),

          ),
          ),
         Padding(padding:EdgeInsets.all(16.sp) ,child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Text(konBordingScreenTitleText,style:kBoldTitleTextStyle.copyWith(
                fontSize:32.sp
              ) ,),
              SizedBox(height:16.sp,),
              Text(kSlognText,
                textAlign:TextAlign.center,
              ),
              SizedBox(height:16.sp,),
              CustomMoviesButton(text:kStartedButton, color:kMainRedColor,
              onPressed:(){
                  newScreen(newScreen:()=>Intro(), context: context);//login
              },
              )
            ],
          )
         ),
        ],
      )


      ),
    );
  }
}
