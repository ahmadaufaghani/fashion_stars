import 'package:fashion_stars/homescreen/HomeScreen.dart';
import 'package:fashion_stars/models/FashionsModel.dart';
import 'package:fashion_stars/providers/WishlistProvider.dart';
import 'package:flutter/material.dart';
import 'package:fashion_stars/homescreen/SearchPage.dart';
import 'package:fashion_stars/homescreen/WishlistProducts.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('My Wishlist', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
          ),),
          actions: [
            IconButton(icon: Icon(Icons.search),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
            },),
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () {},),
            Container(
                padding: EdgeInsets.all(12),
                child: InkWell(
                  onTap: (){},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset('assets/images/profile_picture.jpg'),
                  ),
                )
            )
          ],
        ),
        body:
        wishlistProvider.wishlist.length == 0
            ?
        Container(
            alignment: Alignment.center,
            child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Your wishlist is empty!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Let\'s find yours now!', style: TextStyle(color: Colors.grey),),
                    SizedBox(
                      height: 20,
                    ),
                    new MaterialButton(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        child: Text('Find now!', style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    )
                  ],
                )
            )
        )
            :
        ListView(
          children: wishlistProvider.wishlist.map<Widget>(
                  (fashion) => WishlistProducts(fashions: fashion)
          ).toList(),
        )
    );
  }
}
