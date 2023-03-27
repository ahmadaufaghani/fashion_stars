import 'package:fashion_stars/models/FashionsModel.dart';
import 'package:fashion_stars/providers/FashionsProvider.dart';
import 'package:flutter/material.dart';
import 'package:fashion_stars/homescreen/DetailProductsAll.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FashionsProvider fashionsProvider = Provider.of<FashionsProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          padding: EdgeInsets.all(5),
          childAspectRatio: 1,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: fashionsProvider.fashions.map<Widget>((product)=> ImageGridItem(all_fashions: product)).toList(),
        ),
    );
  }
}

class ImageGridItem extends StatelessWidget {
  ImageGridItem({required this.all_fashions});

  final FashionsModel all_fashions;
  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://fashions-stars-api.000webhostapp.com/';
    return InkWell(
      child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(baseUrl+all_fashions!.image!,
                  width: 100,)
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(all_fashions!.title!, style: TextStyle(fontWeight: FontWeight.w600, fontSize:14),maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(all_fashions!.brand!.name!, style: TextStyle(fontSize: 12),)
                ],
              )
            ],
          ),
        ),

      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProductsAll(fashions: all_fashions,)));
      },
    );
  }
}



