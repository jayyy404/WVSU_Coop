import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream to track authentication state
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign Up with Email and Password
  Future<UserCredential?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName('New User');
      await userCredential.user?.reload();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw 'The email address is already in use.';
      } else if (e.code == 'weak-password') {
        throw 'The password is too weak.';
      } else {
        throw e.message ?? 'An unknown error occurred during sign-up.';
      }
    }
  }

  // Sign In with Email and Password
  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Incorrect password.';
      } else {
        throw e.message ?? 'An unknown error occurred during sign-in.';
      }
    }
  }

  // Sign In as a guest
  Future<void> signInAsGuest() async {
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      throw 'Failed to sign in as guest: ${e.toString()}';
    }
  }

  // Link Anonymous Account to Email/Password
  Future<void> linkAnonymousAccount({
    required String email,
    required String password,
  }) async {
    try {
      final currentUser = _auth.currentUser;

      if (currentUser == null || !currentUser.isAnonymous) {
        throw 'No anonymous user to link.';
      }

      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      await currentUser.linkWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'credential-already-in-use') {
        throw 'This email is already linked to another account.';
      } else {
        throw e.message ?? 'An error occurred while linking the account.';
      }
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw 'Failed to sign out: ${e.toString()}';
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
