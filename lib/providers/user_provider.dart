import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  bool _isNewUser = true; // Defaultnya pengguna baru

  bool get isNewUser => _isNewUser;

  // Memuat status dari SharedPreferences
  Future<void> loadUserStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isNewUser = prefs.getBool('isNewUser') ?? true;
    notifyListeners(); // Update listener jika ada perubahan
  }

  // Menyimpan status ketika pengguna menekan Get Started
  Future<void> setOldUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isNewUser = false;
    await prefs.setBool('isNewUser', false);
    notifyListeners();
  }

  // Reset status menjadi pengguna baru lagi
  Future<void> resetUserStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isNewUser = true;
    await prefs.setBool('isNewUser', true); // Reset status ke true
    notifyListeners();
  }
}
