// ignore_for_file: file_names
// import 'dart:developer';
// import 'package:app_links/app_links.dart';
// import 'package:flutter/material.dart';
// import '../core/const.dart';
// import '../view/Auth/Sign Up/PasswordSetUpScreen.dart';

// void appLink() {
//   final appLinks = AppLinks();
//   appLinks.allUriLinkStream.listen((uri) {
//     log(uri.toString()); 
//     log(uri.queryParameters['token'].toString());
//     log(uri.queryParameters['email'].toString());
//     if (uri.toString().contains('reset')) {
//       navigatorKey.currentState?.push(MaterialPageRoute(
//           builder: (_) => PasswordSetUp(
//                 isRestPass: true,
//                 email: uri.queryParameters['email'].toString(),
//                 restToken: uri.queryParameters['token'].toString(),
//               )));
//     } else {
//       log('nananna');
//     }
//   });
// }