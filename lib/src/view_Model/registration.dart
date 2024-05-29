import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  int _rewardPoints = 0;

  bool get isLoggedIn => _isLoggedIn;
  int get rewardPoints => _rewardPoints;

  LoginProvider() {
    logininitialize();
  }

  Future<void> logininitialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _isLoggedIn = sharedPreferences.getBool('isLogin') ?? false;
    _rewardPoints = sharedPreferences.getInt('rewardPoints') ?? 0;
    notifyListeners();
  }

  Future<void> saveLoginState(bool isLoggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isLogin', isLoggedIn);
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }

  Future<void> addRewardPoints(int points) async {
    _rewardPoints += points;
    await saveRewardPoints();
    notifyListeners();
  }

  Future<void> saveRewardPoints() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('rewardPoints', _rewardPoints);
  }

  void logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('isLogin');
    _isLoggedIn = false;
    notifyListeners();
  }
}
