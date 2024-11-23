import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential?> signUp(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw 'The email address is already in use.';
      } else if (e.code == 'weak-password') {
        throw 'The password is too weak.';
      } else {
        throw e.message ?? 'An unknown error occurred.';
      }
    }
  }

  Future<UserCredential?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw e.toString();
    }
  }

  // Sign In as a guest (without credentials)
  Future<void> signInAsGuest(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
      Navigator.pushReplacementNamed(context, '/guest_home');
    } catch (e) {
      throw e.toString();
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
