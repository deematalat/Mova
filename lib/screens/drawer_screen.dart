import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies_app_flutter/screens/auth/signin_screen.dart';
import 'package:movies_app_flutter/utils/navi.dart'as navi;
import 'package:movies_app_flutter/widgets/drawer_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widgets/fieldtext.dart';
import '../widgets/skip_cont_buttons.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class DrawerScreen extends StatefulWidget {
  final Function(Color) colorChanged;
  DrawerScreen({required this.colorChanged});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String _name = '';

  String _email = '';

  String _nickname='';

  String _profilePictureUrl = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nicknameController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  File? _image;

  @override
  void initState() {
    super.initState();
    if(mounted) _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = _auth.currentUser!.uid;
    DocumentSnapshot snapshot = await _firestore.collection('users')
        .doc(uid)
        .get();
    setState(() {
      _name = (snapshot.data() as Map<String, dynamic>)['name'] ??
          prefs.getString('name') ?? '';
      _email = (snapshot.data() as Map<String, dynamic>)['email'] ??
          prefs.getString('email') ?? '';
      _nickname = (snapshot.data() as Map<String, dynamic>)['nickname'] ??
          prefs.getString('nickname') ?? '';
      _profilePictureUrl =
          (snapshot.data() as Map<String, dynamic>)['profilePictureUrl'] ??
              prefs.getString('profilePictureUrl') ?? '';
    });
  }

  Future<void> _saveUserInfo() async {
    String uid = _auth.currentUser!.uid;
    await _firestore.collection('users').doc(uid).set({
      'name': _nameController.text,
      'email': _emailController.text,
      'nickname':_nicknameController,
      'profilePictureUrl': _profilePictureUrl,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('nickname', _nicknameController.text);
    await prefs.setString('profilePictureUrl', _profilePictureUrl);
    if (_image != null) {
// Upload image to Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref().child(
          'users/$uid/${Path.basename(_image!.path)}');
      UploadTask uploadTask = storageReference.putFile(_image!);
      await uploadTask.whenComplete(() async {
        _profilePictureUrl = await storageReference.getDownloadURL();
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kPrimaryColor,
        child: Padding(
          padding:
              EdgeInsets.only(top: 10.h, left: 6.w, right: 6.w, bottom: 5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? Image.memory(_image!.readAsBytesSync()).image
                        : _profilePictureUrl.isNotEmpty
                        ? Image.network(_profilePictureUrl).image
                        : null,
                    child: _image == null && _profilePictureUrl.isEmpty ? Icon(
                        Icons.person) : null,
                  )

              ),
              SizedBox(height: 20),
              textField(controller:_nameController..text = _name, hint: 'Full Name', icon:Icon(Icons.edit),),
              SizedBox(height:16.sp,),
              textField(controller:_nameController..text = _name, hint: 'Nickname', icon:Icon(Icons.edit),),
              SizedBox(height:16.sp,),
              textField(controller: _emailController..text = _email, hint: 'Email', icon:Icon(Icons.edit),),
              SizedBox(height:40.sp,),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed:(){
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder:(context)=>SignInScreen()), (route) => false);
                  }, icon:Icon(Icons.logout))
                ],
              ),
              SizedBox(height:200.sp,),
            ],
          ),
        ),
      ),
    );
  }
}
Future<void> signOut() async {
  await _auth.signOut();
  await _googleSignIn.signOut();
  _auth.currentUser==null;
}
