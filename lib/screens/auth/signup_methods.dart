
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<UserCredential> signInWithGoogle() async {
  // Trigger the Google authentication flow.
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  // Obtain the auth details from the request.
  final GoogleSignInAuthentication googleAuth =
  await googleUser!.authentication;

  // Create a new credential.
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await _auth.signInWithCredential(credential);
}


Future<UserCredential> LoginWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleSignInAccount!.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await _auth.signInWithCredential(credential);
}
