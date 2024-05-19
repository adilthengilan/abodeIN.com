import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/src/view_Model/hotel_rooms_provider.dart';
import 'package:abodein/src/view_Model/profile_provider.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:abodein/src/view_model/hote_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider<ChangeNotifier>> providers = [
  ChangeNotifierProvider<SplashProvider>(create: (context) => SplashProvider()),
  ChangeNotifierProvider<DashBoardProvider>(create: (context) => DashBoardProvider()),
  ChangeNotifierProvider<HotelDetailProvider>(create: (context) => HotelDetailProvider()),
  ChangeNotifierProvider<HotelRoomsProvider>(create: (context) => HotelRoomsProvider(),),
  ChangeNotifierProvider<ProfileProvider>(create: (context) => ProfileProvider(),)
];
