import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
