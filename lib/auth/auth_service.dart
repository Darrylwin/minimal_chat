import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in
  Future<UserCredential> signInWithEmailPassword(String email, pasword) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: pasword,);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
// sign up

//sign out

//errors
}