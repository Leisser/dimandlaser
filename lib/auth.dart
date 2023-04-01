import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseAuth {
  Future<String> currentUser();
  Future<void> signOut();
  Future<void> signin();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  SharedPreferences prefs;

  String country, sex, phoneNumber,address,aboutMe;


  Future<String> signin() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    if (FirebaseUser != null) {
      // Check is already sign up
      final QuerySnapshot result =
      await Firestore.instance.collection('users').where('id', isEqualTo: user.uid).getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // Update data to server if new user
        Firestore.instance.collection('users').document(user.uid).setData(
            {'nickname': user.displayName, 'photoUrl': user.photoUrl, 'id': user.uid, 'email': user.email, 'sex': sex, 'phoneNumber': phoneNumber,
            'address': address, 'country': country, 'aboutMe': aboutMe,});

          prefs = await SharedPreferences.getInstance();
          prefs.setString('id', user.uid);
          prefs.setString('nickname', user.displayName);
          prefs.setString('photoUrl', user.photoUrl);
          prefs.setString('email', user.email);
          prefs.setString('sex', sex);
          prefs.setString('phoneNumber', phoneNumber);
          prefs.setString('address', address);
          prefs.setString('country', country);
          prefs.setString('aboutMe', aboutMe);
      }else {
        // Write data to local
        prefs = await SharedPreferences.getInstance();
        prefs.setString('id', documents[0]['id']);
        prefs.setString('nickname', documents[0]['nickname']);
        prefs.setString('photoUrl', documents[0]['photoUrl']);
        prefs.setString('aboutMe', documents[0]['aboutMe']);
        prefs.setString('sex', documents[0]['sex']);
        prefs.setString('phoneNumber', documents[0]['phoneNumber']);
        prefs.setString('address', documents[0]['address']);
        prefs.setString('country', documents[0]['country']);
      }
    }
    return 'signInWithGoogle succeeded: $user';




  }

  @override
  Future<String> currentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();

    return user?.uid;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    return googleSignIn.signOut();

  }

  void setState(Null Function() param0) {}
}
