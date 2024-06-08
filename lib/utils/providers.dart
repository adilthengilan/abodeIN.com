import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/src/view_Model/hotel_rooms_provider.dart';
import 'package:abodein/src/view_Model/login_provider.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:abodein/src/view_model/Smart_Checkin_Provider.dart';
import 'package:abodein/src/view_model/booking_func.dart';
import 'package:abodein/src/view_model/bools_provider.dart';
import 'package:abodein/src/view_model/calendar.dart';
import 'package:abodein/src/view_model/hotel_detail_provider.dart';
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
  ChangeNotifierProvider<ProfileProvider>(
    create: (context) => ProfileProvider(),
  ),
  ChangeNotifierProvider<Reg>(
    create: (context) => Reg(),
  ),
  ChangeNotifierProvider<BookingFuncProvider>(
    create: (context) => BookingFuncProvider(),
  ),
  ChangeNotifierProvider<HotelDetailProvider>(
    create: (context) => HotelDetailProvider(),
  ),
  ChangeNotifierProvider<SmartChekingProvider>(
    create: (context) => SmartChekingProvider(),
  ),
  ChangeNotifierProvider<LoginProvider>(
    create: (context) => LoginProvider(),
  ),
  ChangeNotifierProvider<HotelRoomsProvider>(
    create: (context) => HotelRoomsProvider(),
  ),
  ChangeNotifierProvider<CalendarProvider>(
    create: (context) => CalendarProvider(),
  ),
  ChangeNotifierProvider<boolsProvider>(
    create: (context) => boolsProvider(),
  )
];
