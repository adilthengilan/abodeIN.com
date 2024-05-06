import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


List<ChangeNotifierProvider<ChangeNotifier>> providers = [
  ChangeNotifierProvider<SplashProvider>(create: (context) => SplashProvider()),
  ChangeNotifierProvider<DashBoardProvider>(create: (context) => DashBoardProvider(),)
];