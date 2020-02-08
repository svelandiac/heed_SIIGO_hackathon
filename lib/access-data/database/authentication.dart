import 'package:firebase_auth/firebase_auth.dart';
import 'package:heed/access-data/models/user.dart';

class Authentication{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    User newUser = User();

    newUser.email = user.email;

    return newUser;
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final AuthResult authResult = await _firebaseAuth.signInWithCredential(EmailAuthProvider.getCredential(
      email: email,
      password: password,
    ));
    return _userFromFirebase(authResult.user);
  }

  Future<User> createUserWithEmailAndPassword(String email, String password) async {
    final AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  Future<String> signOut() async {
    _firebaseAuth.signOut().then((onValue){
      return 'Successfully logged out';
    }).catchError((onError){
      return 'Oops, something went wrong';
    });
    return 'Operation was not successfully';
  }

}