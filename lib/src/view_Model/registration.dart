import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
