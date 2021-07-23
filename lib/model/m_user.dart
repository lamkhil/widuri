import 'package:firebase_auth/firebase_auth.dart';
import 'package:translator/translator.dart';

// ignore: camel_case_types
class M_User {
  static final translator = GoogleTranslator();
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<dynamic> registerUser(
      String email, String password, String nama) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      var result = await translator.translate(e.toString().split('] ')[1],
          from: 'en', to: 'id');
      return result.toString();
    }
  }

  static Future<dynamic> loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      var result = await translator.translate(e.toString().split('] ')[1],
          from: 'en', to: 'id');
      return result.toString();
    }
  }

  static Future<dynamic> lupaPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 1;
    } catch (e) {
      var result = await translator.translate(e.toString().split('] ')[1],
          from: 'en', to: 'id');
      return result.toString();
    }
  }

  static Future<dynamic> logOut() async {
    await _auth.signOut();
  }
}
