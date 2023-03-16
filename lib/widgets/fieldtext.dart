

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/constants.dart';

Widget textField({required TextEditingController controller,
  required String hint,required Icon icon,bool isObscure=false,Widget? suffixIcon,
  Color ?suffixIconColor
}){
  return Container(
    decoration:BoxDecoration(
      borderRadius:BorderRadius.circular(10),
      color:kInactiveButtonColor,
    ),
    height: 6.0.h,
    child:TextField(
      obscureText:isObscure,
      controller:controller,
      decoration:InputDecoration(
        suffixIcon:suffixIcon,
        suffixIconColor:suffixIconColor,
        hintText:hint ,
        prefixIcon:icon,
        prefixIconColor:kDrawerTextColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:kInactiveButtonColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:kInactiveButtonColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),);
}