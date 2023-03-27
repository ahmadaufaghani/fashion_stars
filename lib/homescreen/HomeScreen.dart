import 'package:fashion_stars/authentication/LoginRegister.dart';
import 'package:fashion_stars/providers/FashionsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_stars/homescreen/HotProducts.dart';
import 'package:fashion_stars/homescreen/Products.dart';
import 'package:fashion_stars/homescreen/SearchPage.dart';
import 'package:fashion_stars/homescreen/WishlistPage.dart';
import 'package:fashion_stars/homescreen/ProfilePage.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'assets/images/carousel-1.png',
    'assets/images/carousel-1.png'
  ];
  @override
  Widget build(BuildContext context) {
    FashionsProvider fashionsProvider = Provider.of<FashionsProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: Icon(Icons.search),onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
          },),
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistPage()));
          },),
          Container(
            padding: EdgeInsets.all(12),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset('assets/images/profile_picture.jpg'),
                ),
            )
          )
        ],
      ),
      body : ListView(
        children: [
          CarouselSlider(
              items: imgList
                  .map((item) => Container(
                child: Container(
                  child: ClipRRect(
                      child: Stack(
                        children: <Widget>[
                          ColorFiltered(
                              colorFilter: const ColorFilter.mode(Colors.black, BlendMode.color),
                              child: Image.asset(item, fit: BoxFit.cover),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                )
                            ),
                          ),
                        ],
                      )),
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                  height: 240,
                  viewportFraction: 1,
                  aspectRatio: 16/9,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  reverse: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  })
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hot Fashion Products', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),),
                Text('Detail', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
              ],
            ),
          ),
          HotProducts(),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Fashion Products', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),),
              Text('Detail', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
              ],
            )
          ),
          Products()
        ],
      )
    );
  }
}
