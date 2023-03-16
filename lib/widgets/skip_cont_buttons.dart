

import 'package:flutter/material.dart';
import 'package:movies_app_flutter/screens/home_screen.dart';
import 'package:movies_app_flutter/utils/constants.dart';

import 'custom_movies_button.dart';

class SkipOrContinue extends StatelessWidget {
  const SkipOrContinue({Key? key, required this.onPressed}) : super(key: key);
     final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomMoviesButton(text: '      Skip     ', color:kLightGrey,onPressed:(){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
          (context)=>HomeScreen()
          )
              ,
                  (route) => false);
        },),
        CustomMoviesButton(text: 'Continue', color: kMainRedColor,onPressed:onPressed,),
      ],
    );
  }
}
