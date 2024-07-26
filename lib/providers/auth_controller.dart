import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<bool> {
  AuthController() : super(false);
  final FirebaseAuth auth = FirebaseAuth.instance;

  void setLoading(bool load) {
    state = load;
  }

  Future<bool> checkIfRegistered(String email) async {
    bool res = false;
    try {
      if (email.isNotEmpty) {
        await auth.;
      }
    } catch (e) {}
  }

  Future<bool> sendOtp(String number) async {
    bool res = false;
    try{
      if(number.isNotEmpty){
        await auth.verifyPhoneNumber(verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
      }
    }catch(e){
        debugPrint('$e');
      }
  }

  Future<String> signUp(
      {required String userName,
      required String email,
      required String password}) async {
    setLoading(true);
    String res = 'some error occured';
    try {
      if (email.isNotEmpty || userName.isNotEmpty || password.isNotEmpty) {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        res = 'signup successful';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The email is badly formatted.';
      } else if (err.code == 'weak-password') {
        res = 'The password should be at least 6 characters';
      }
    } catch (e) {
      res = e.toString();
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
