import 'package:fashion_stars/models/FashionItems.dart';
import 'package:fashion_stars/models/FashionsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_stars/providers/WishlistProvider.dart';
import 'package:provider/provider.dart';

class DetailProductsAll extends StatefulWidget {

  final FashionsModel fashions;

  DetailProductsAll({required this.fashions});


  @override
  _DetailProductsAllState createState() => _DetailProductsAllState();
}

class _DetailProductsAllState extends State<DetailProductsAll> {

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    String baseUrl = 'https://fashions-stars-api.000webhostapp.com/';
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
                height : height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(baseUrl+widget.fashions!.image!),
                        fit: BoxFit.cover
                    )
                )
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.5),
              padding: EdgeInsets.all(20),
              height: height * 0.55,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.fashions!.title!, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18),),
                  SizedBox(height: 10,),
                  Text(widget.fashions!.description!,
                    style: TextStyle(color: Colors.black),),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Text('Brand :', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Text(widget.fashions!.brand!.name!)
                    ],
                  ),
                  Row(
                    children: [
                      Text('Size', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width:17),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Text(widget.fashions!.size!)
                    ],
                  ),
                  Row(
                    children: [
                      Text('Color', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width:7),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Text(widget.fashions!.color!)
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  wishlistProvider.isWishlist(widget.fashions)
                  ?
                  Expanded(
                      child: Align(
                        alignment : Alignment.bottomCenter,
                        child: new MaterialButton(
                          onPressed: (){
                            wishlistProvider.setFashions(widget.fashions);
                          },
                          color: Colors.grey,
                          minWidth: width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('Wishlisted',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      )
                  )
                  :
                  Expanded(
                      child: Align(
                        alignment : Alignment.bottomCenter,
                        child: new MaterialButton(
                          onPressed: (){
                            wishlistProvider.setFashions(widget.fashions);
                            setState(() {
                              clicked = true;
                            });
                          },
                          color: (clicked) ? Colors.grey : Colors.black,
                          minWidth: width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text((clicked) ? 'Wishlisted' : 'Wishlist Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
