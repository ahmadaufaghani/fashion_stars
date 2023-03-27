import 'package:fashion_stars/models/FashionsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_stars/homescreen/DetailProductsAll.dart';
import 'package:provider/provider.dart';

import '../providers/FashionsProvider.dart';

class HotProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FashionsProvider fashionsProvider = Provider.of<FashionsProvider>(context);
    String baseUrl = 'https://fashions-stars-api.000webhostapp.com/';
    return Container(
      height: 260,
      width: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(20),
        itemCount: fashionsProvider.fashions.length,
        itemBuilder: (context, index) {

          return InkWell(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(baseUrl+fashionsProvider.fashions[index].image!,
                      width: 148,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fashionsProvider.fashions[index].title!.substring(0,14), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis,),
                      Text(fashionsProvider.fashions[index].brand!.name!, style: TextStyle(fontSize: 12),)
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProductsAll(fashions: fashionsProvider.fashions[index])));
            },
          );
      },
      )
    );
  }
}

// class _Item extends StatelessWidget {
//   _Item({required this.image_card});
//
//   final FashionItems image_card;
//   @override
//   Widget build(BuildContext context) {
//
//
//   }
// }





