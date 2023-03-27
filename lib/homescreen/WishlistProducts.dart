import 'package:fashion_stars/homescreen/WishlistPage.dart';
import 'package:fashion_stars/models/FashionsModel.dart';
import 'package:flutter/material.dart';
import 'package:fashion_stars/providers/WishlistProvider.dart';
import 'package:provider/provider.dart';

class WishlistProducts extends StatefulWidget {
  WishlistProducts({this.fashions});
  FashionsModel? fashions;

  @override
  _WishlistProductsState createState() => _WishlistProductsState();
}

class _WishlistProductsState extends State<WishlistProducts> {
  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://fashions-stars-api.000webhostapp.com/';
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(baseUrl+widget.fashions!.image!, width: 70, height:73),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.fashions!.title!.substring(0,20), style: TextStyle(fontWeight: FontWeight.w600),),
                  Text(widget.fashions!.brand!.name!, style: TextStyle(fontSize: 12, color: Colors.grey),)
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: () {wishlistProvider.setFashions(widget.fashions!);
                },
              icon: Icon(Icons.delete, color: Colors.grey,))
        ],
      ),
    );
  }
}
