import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class M_User {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<User?> registerUser(
      String email, String password, String nama) async {
    await Firebase.initializeApp();
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
