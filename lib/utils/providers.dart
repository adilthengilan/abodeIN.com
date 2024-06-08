import 'dart:developer';

import 'package:abodein/src/view_Model/Timer_provider.dart';
import 'package:abodein/src/view_Model/bookingfun_provider.dart';
import 'package:abodein/src/view_Model/calender_provider.dart';
import 'package:abodein/src/view_Model/contact_provider.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/src/view_Model/hotel_detail_provider.dart';
import 'package:abodein/src/view_Model/hotel_rooms_provider.dart';
import 'package:abodein/src/view_Model/privacyPolicyprovider.dart';
import 'package:abodein/src/view_Model/profile_provider.dart';
import 'package:abodein/src/view_Model/login_provider.dart';
import 'package:abodein/src/view_Model/search_provider.dart';
import 'package:abodein/src/view_Model/services_category.dart';
import 'package:abodein/src/view_Model/smart_checking_provider.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider<ChangeNotifier>> providers = [
  ChangeNotifierProvider<SplashProvider>(create: (context) => SplashProvider()),
  ChangeNotifierProvider<DashBoardProvider>(
      create: (context) => DashBoardProvider()),
  ChangeNotifierProvider<HotelDetailProvider>(
      create: (context) => HotelDetailProvider()),
  ChangeNotifierProvider<HotelRoomsProvider>(
    create: (context) => HotelRoomsProvider(),
  ),
  ChangeNotifierProvider<LoginProvider>(
    create: (context) => LoginProvider(),
  ),
  ChangeNotifierProvider<ProfileProvider>(
    create: (context) => ProfileProvider(),
  ),
  ChangeNotifierProvider<ServiceProvider>(
    create: (context) => ServiceProvider(),
  ),
  ChangeNotifierProvider<BookingFuncProvider>(
    create: (context) => BookingFuncProvider(),
  ),
  ChangeNotifierProvider<CalendarProvider>(
    create: (context) => CalendarProvider(),
  ),
  ChangeNotifierProvider<SmartChekingProvider>(
    create: (context) => SmartChekingProvider(),
  ),
  ChangeNotifierProvider<SearchProvider>(
    create: (context) => SearchProvider(),
  ),
  ChangeNotifierProvider<ExpansionState>(
    create: (context) => ExpansionState(),
  ),
ChangeNotifierProvider<ContactDetailsProvider>(
    create: (context) => ContactDetailsProvider(),
  ),
  // ChangeNotifierProvider<TimerProvider>(create: (context) => TimerProvider()),
];
