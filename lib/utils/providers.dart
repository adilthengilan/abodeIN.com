import 'package:abodein/src/view/profile/profile_screen.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:abodein/src/view_model/booking_func.dart';
import 'package:abodein/src/view_model/hote_details_provider.dart';
import 'package:abodein/src/view_model/profile_provider.dart';
import 'package:abodein/src/view_model/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider<ChangeNotifier>> providers = [
  ChangeNotifierProvider<SplashProvider>(create: (context) => SplashProvider()),
  ChangeNotifierProvider<DashBoardProvider>(
    create: (context) => DashBoardProvider(),
  ),
  ChangeNotifierProvider<MobileNumberAuth>(
      create: (context) => MobileNumberAuth()),
  ChangeNotifierProvider<HotelDetailProvider>(
    create: (context) => HotelDetailProvider(),
  ),
  ChangeNotifierProvider<ProfileProvider>(
    create: (context) => ProfileProvider(),
  ),
  ChangeNotifierProvider<Reg>(
    create: (context) => Reg(),
  ),
  ChangeNotifierProvider<BookingFuncProvider>(
    create: (context) => BookingFuncProvider(),
  )
];
