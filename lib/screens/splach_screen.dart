

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_app_flutter/screens/home_screen.dart';
import 'package:movies_app_flutter/screens/onboarding_screen.dart';
import 'package:sizer/sizer.dart';
import '../utils/navi.dart'as navi;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    doDelayed(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          SizedBox(height:20.h,),
           Image.asset('assets/logo.png'),
            SizedBox(height:20.h,),
           SpinKitRing(
            color: Colors.red,
            size: 35.0.sp,
            lineWidth: 2.0.sp,
          ),
      ],
      ),
    );
  }
}
void doDelayed(context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  await Future.delayed(Duration(seconds:3));
  ( _auth.currentUser != null) ?
  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:
  (context)=>HomeScreen()
   ), (route) => false) :
      Navigator.push(context,MaterialPageRoute(builder:(context)=>OnBoardingScreen()));




}
