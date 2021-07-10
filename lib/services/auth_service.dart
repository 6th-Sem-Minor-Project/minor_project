import 'package:firebase_auth/firebase_auth.dart';
import '../models/auth_result.dart';
import '../models/user.dart';
import 'database.dart';

// class AuthService {
//   final FirebaseAuth _instance = FirebaseAuth.instance;

//   Stream<User> get authStateChanges => _instance.authStateChanges();

//   UserModel createUserInstanceFromUser(user) {
//     UserModel userModel = UserModel(user.uid);
//     return userModel;
//   }

//   Future<String> signIn(String email, String password) async {
//     try {
//       UserCredential userCredential = await _instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       return userCredential.user.uid;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }

//   Future<String> signUp(String email, String password) async {
//     try {
//       UserCredential userCredential = await _instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       return userCredential.user.uid;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }

//   Future<String> signOut() async {
//     try {
//       await _instance.signOut();
//       return 'Signed Out Successfully';
//     } catch (e) {
//       return e.message;
//     }
//   }
// }
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _uidFromFirebaseUser(User user) {
    return user != null ? user.uid : null;
  }

  Stream<String> get user {
    return _auth.authStateChanges().map(_uidFromFirebaseUser);
  }

  Future signInEmail(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return AuthResult(true, null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AuthResult(false, e.code);
      } else if (e.code == 'wrong-password') {
        return AuthResult(false, e.code);
      }
    }
  }

  Future signup(String name, String usn, String branch, int sem, String email,
      String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user.uid;

      await DatabaseService(uid: uid)
          .addUserData(name, usn, sem, branch, email);

      return AuthResult(true, null);
    } on FirebaseAuthException catch (e) {
      return AuthResult(false, e.code);
    }
  }

  Future signOut() async {
    await _auth.signOut();
    return "signout successful";
  }
}
