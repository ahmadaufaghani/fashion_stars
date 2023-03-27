import 'dart:convert';

import 'package:fashion_stars/models/FashionsModel.dart';
import 'package:fashion_stars/models/UserModels.dart';
import 'package:http/http.dart' as http;

class FashionsService{

  var data = [];
  List<FashionsModel> results = [];

  String baseUrl = 'https://fashions-stars-api.000webhostapp.com/api';

  Future<List<FashionsModel>> getFashions() async {
    var url = Uri.parse('$baseUrl/fashions');

    var headers = {'Content-Type' : 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if(response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List <FashionsModel> fashions = [];

      for(var item in data) {
        fashions.add(FashionsModel.fromJson(item));
      }

      return fashions;
    } else {
      throw Exception('Retrieved Fahions failed!');
    }
  }

  Future<List<FashionsModel>> getFashionList(String? query) async {
    var url = Uri.parse('$baseUrl/fashions');
    var headers = {'Content-Type' : 'application/json'};
    var response = await http.get(url, headers: headers);
    try {
      if(response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e)=> FashionsModel.fromJson(e)).toList();
        if(query != null) {
          results = results.where((element) => element.title!.toLowerCase().contains(query.toLowerCase())).toList();
        } else {
          print("api error");
        }
      }
    } catch(e) {
        print("error $e");
    }
    return results;
  }
}