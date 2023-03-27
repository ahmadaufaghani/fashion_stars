import 'package:fashion_stars/models/UserModels.dart';
import 'package:fashion_stars/services/AuthService.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier{
  late UserModel _user;
  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String username,
    required String email,
    required String password}) async {
    try {
      UserModel user = await AuthService().register(
          username: username,
          email: email,
          password: password
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  Future<bool> login({
    required String email,
    required String password}) async {
    try {
      UserModel user = await AuthService().login(
          email: email,
          password: password
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}