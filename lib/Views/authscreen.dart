import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen {
  final CollectionReference usersData =
      FirebaseFirestore.instance.collection('Users');

  Future<String?> signUp({
    required String email,
    required String password,
    required String family,
    required String first,
    required String gender,
    required String age,
    required String phone,
    required String address,
  }) async {
    try {
      (
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
        FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(
          {
            'uid': FirebaseAuth.instance.currentUser!.uid,
            'Family name': family,
            'First name': first,
            'Gender': gender,
            'Age': age,
            'Phone number': phone,
            'Address': address,
          },
        )
      );
      return 'Signed up successfully';
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        return 'This account already exists.';
      } else {
        return '3mitha';
      }
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Logged in successfully';
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        return 'This username does not exist.';
      } else if (error.code == 'wrong-password') {
        return 'Incorrect password';
      } else {
        return '3mitha';
      }
    }
  }
}
