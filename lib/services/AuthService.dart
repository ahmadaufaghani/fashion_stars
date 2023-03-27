import 'dart:convert';

import 'package:fashion_stars/models/UserModels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthService{
  late SharedPreferences preferences;
  late String token;
  String baseUrl = 'https://fashions-stars-api.000webhostapp.com/api';

  Future<UserModel> register({
    required String username,
    required String email,
    required String password}) async {

      var url = Uri.parse('$baseUrl/register');
      var headers = {'Content-Type' : 'application/json'};
      var body = jsonEncode(
          {
            'username' : username,
            'email' : email,
            'password' : password
          }
      );

      var response = await http.post(
        url, headers : headers, body: body
      );


      if(response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        var data = jsonDecode(response.body)['data'];
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer '+ data['access_token'];
        await preferences.setString('token', user.token!);


    return user;
      } else {
        throw Exception('Register Failed!');
      }
  }

  Future<UserModel> login({
    required String email,
    required String password}) async {

    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type' : 'application/json'};
    var body = jsonEncode(
        {
          'email' : email,
          'password' : password
        }
    );

    var response = await http.post(
        url, headers : headers, body: body
    );


    if(response.statusCode == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer '+ data['access_token'];

      return user;
    } else {
      throw Exception('Login Failed!');
    }
  }
}