import 'package:abodein/src/view_Model/calendar_provider.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/src/view_Model/profile_provider.dart';
import 'package:abodein/src/view_Model/hotel_detail_provider.dart';
import 'package:abodein/src/view_Model/hotel_rooms_provider.dart';
import 'package:abodein/src/view_Model/room_controller_provider.dart';
import 'package:abodein/src/view_Model/search_provider.dart';
import 'package:abodein/src/view_Model/smart_cheking_provider.dart';
import 'package:abodein/src/view_Model/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


List<ChangeNotifierProvider<ChangeNotifier>> providers = [
  ChangeNotifierProvider<SplashProvider>(create: (context) => SplashProvider()),
  ChangeNotifierProvider<DashBoardProvider>(create: (context) => DashBoardProvider()),
  ChangeNotifierProvider<HotelDetailProvider>(create: (context) => HotelDetailProvider()),
  ChangeNotifierProvider<HotelRoomsProvider>(create: (context) => HotelRoomsProvider()),
  ChangeNotifierProvider<ProfileProvider>(create: (context) => ProfileProvider()),
  ChangeNotifierProvider<SearchProvider>(create: (context) => SearchProvider()),
  ChangeNotifierProvider<RoomControllerProvider>(create: (context) => RoomControllerProvider()),
  ChangeNotifierProvider<CalendarProvider>(create: (context) => CalendarProvider()),
  ChangeNotifierProvider<SmartChekingProvider>(create: (context) => SmartChekingProvider()),
];