import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

void phoneNumberVerification(phoneNumber) async {
  final _auth = FirebaseAuth.instance;

  await _auth.verifyPhoneNumber(
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {});
}

class MobileNumberAuth extends ChangeNotifier {
  String verificationId = '';
}

FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> verifyPhoneNumber(BuildContext context, String phoneNumber) async {
  final verifyId = Provider.of<MobileNumberAuth>(context, listen: false);
  await _auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) {
      // Auto-retrieval of OTP completed (e.g., when SMS code is detected automatically)
      signInWithPhoneAuthCredential(context, credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      // Verification failed
      print('Phone number verification failed: ${e.message}');
    },
    codeSent: (String verificationId, int? resendToken) {
      // OTP sent successfully
      print(
          '$verificationId=================================================================================');
      verifyId.verificationId = verificationId;
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      // Auto-retrieval of OTP timed out
      print('Auto-retrieval of OTP timed out');
    },
    timeout: Duration(
        seconds:
            60), // Optional: Timeout duration for OTP auto-retrieval (default is 30 seconds)
  );
}

Future<void> signInWithPhoneAuthCredential(
    BuildContext context, PhoneAuthCredential credential) async {
  try {
    await _auth.signInWithCredential(credential);

    // User successfully signed in
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard(),
        ));
    print('User logged in successfully');
    // Navigate to next screen or perform any other actions
  } catch (e) {
    // Error signing in
    print('Error signing in: $e');
  }
}

void verifyOTP(BuildContext context, String otp) {
  final verify = Provider.of<MobileNumberAuth>(context, listen: false);
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verify.verificationId, smsCode: otp);
  signInWithPhoneAuthCredential(context, credential);
}

class Reg extends ChangeNotifier {
  bool otpfield = false;
  bool emailandnumberfield = false;
  changefield() {
    emailandnumberfield = !emailandnumberfield;
    notifyListeners();
  }

  showotpfield() {
    otpfield = true;
    notifyListeners();
  }

  editotpfield() {
    otpfield = false;
    notifyListeners();
  }
}

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth auth = FirebaseAuth.instance;

User? _user;

User? get user => _user;

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw Exception("Google Sign-In was canceled.");
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    _user = authResult.user;

    // Navigate to the home page after successful sign-in

    Navigator.pop(context);
  } catch (error) {
    print("Google Sign-In Error: $error");
  }
  // notifyListeners();
}

void signOutUser(BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.signOut();
    await googleSignIn.signOut();
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => LoginPage(),
    //     ),
    //     (route) => false);
    print('User signed out successfully');
  } catch (e) {
    print('Error signing out: $e');
  }
}
  // Future<void> signOut() async {
  //   try {
  //     FirebaseAuth.instance.signOut();
  //     googleSignIn.signOut();
  //   } catch (e) {
  //     print("Error signing out: $e");
  //   }
  //   notifyListeners();
  // }