import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._();
  static final FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();

  //TODO: Anonymously

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> signAnonymously() async {
    try {
      UserCredential userCredential = await firebaseAuth.signInAnonymously();

      User? user = userCredential.user;

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'admin-restricted-operation':
          print("admin-restricted-operation");
          break;
        case 'operation-not-allowed':
          print("operation-not-allowed");
          break;
      }
    }
  }

  //TODO: SignUp user

  Future<User?> signUpUser(
      {required String email, required String password}) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return user;
  }

  //TODO: SignIn User

  Future<User?> signInUser(
      {required String email, required String password}) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return user;
  }

  //TODO: SignIn With Google

  //TODO: Sign Out
  //
  signOut() async {
    await firebaseAuth.signOut();
    // await googleSignIn.signOut();
  }
}
