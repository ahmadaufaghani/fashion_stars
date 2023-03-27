import 'package:fashion_stars/models/BrandModel.dart';

class FashionsModel{
  int? id;
  String? image;
  String? title;
  String? description;
  BrandModel? brand;
  String? size;
  String? color;

  FashionsModel({this.id, this.image, this.title, this.description, this.brand, this.size, this.color});

  FashionsModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    brand = BrandModel.fromJson(json['brand']);
    size = json['size'];
    color = json['color'];
  }

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'image' : image,
      'title' : title,
      'description' : description,
      'brand' : brand?.toJson(),
      'size' : size,
      'color' : color
    };
  }
}