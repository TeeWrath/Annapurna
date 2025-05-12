import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<bool> {
  AuthController() : super(false);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // getter and setters for user Id
  String _userId = "";
  String get userId => _userId;

  void setLoading(bool load) {
    state = load;
  }

  // setter function for user Id
  void _setUserId(String id) {
    _userId = id;
  }

  Future<String> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    setLoading(true);
    String res = 'some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty || userName.isNotEmpty) {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        
        // Saves user Id
        _setUserId(cred.user!.uid);
        
        // saves other details of the user
        await _firestore
            .collection('user')
            .doc(cred.user!.uid)
            .set({'email': email, 'password': password, 'username': userName});
        res = 'signup successful';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The email is badly formatted.';
      } else if (err.code == 'weak-password') {
        res = 'The password should be at least 6 characters';
      }
    } finally {
      setLoading(false);
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    setLoading(true);
    String res = 'some error occured';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      }
      res = 'login successful';
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        res = 'User not found for this email';
      } else if (err.code == 'wrong-password') {
        res = 'Entered password is wrong';
      }
    } catch (e) {
      res = e.toString();
    } finally {
      setLoading(false);
    }
    return res;
  }

  void logOut() async {
    await auth.signOut();
  }
}

final authProvider = StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController();
});
