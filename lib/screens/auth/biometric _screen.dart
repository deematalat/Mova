import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:movies_app_flutter/screens/home_screen.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:movies_app_flutter/utils/navi.dart' as navi;


class FingerprintScreen extends StatefulWidget {
  @override
  _FingerprintScreenState createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  final LocalAuthentication localAuth = LocalAuthentication();
  bool _canCheckBiometrics=false;
  bool _didAuthenticate = false;

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
  }

  Future<void> _checkBiometrics() async {
    try {
      _canCheckBiometrics = await localAuth.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
  }

  Future<void> _authenticate() async {
    try {
      _didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please authenticate to continue',
        options:const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      setState(() {

      });
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text('Fingerprint Authentication'),
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.navigate_before, size: 30,),
            ),
          ),
          body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.fingerprint, size: 80.0),
                    SizedBox(height: 20.0),
                    Text(
                      _canCheckBiometrics == null
                          ? 'Checking biometrics...'
                          : _canCheckBiometrics
                          ? 'Touch the fingerprint sensor'
                          : 'Fingerprint authentication not available',
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.0),
                    _didAuthenticate
                        ? Text(
                      'Authentication succeeded',
                      style: TextStyle(fontSize: 20.0, color: Colors.green),
                      textAlign: TextAlign.center,
                    )
                        : SizedBox(),
                  ],
                ),
              ),
          floatingActionButton: FloatingActionButton(
            onPressed: _canCheckBiometrics == true ? _authenticate : null,
            tooltip: 'Authenticate',
            child: Icon(Icons.lock),
            backgroundColor: _canCheckBiometrics == true ?kMainRedColor: Colors
                .grey,
          ),
        ),
        _didAuthenticate
            ? Container(
          decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(25),
            color: Colors.black.withOpacity(0.5),
          ),
          child: AlertDialog(
             backgroundColor:Colors.grey.shade900,
            title: Text(kcongratulationsText,style:kTitleTextStyle.copyWith(color: kMainRedColor,
              fontSize:32

            ),
            textAlign: TextAlign.center,
            ),
            content: Container(
              height:150,
                child:Text(ksubcongText)
            ),
            actions: [
              ElevatedButton(
                style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(
                    kMainRedColor
                  )
                ),
                child: Text('ok'),
                onPressed: () async {
                  await Future.delayed(Duration(seconds:1));
                   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
              ),
            ],
          ),
        )
            : SizedBox(),
      ],
    );
  }

}
