import 'package:fashion_stars/models/FashionItems.dart';
import 'package:fashion_stars/models/FashionsModel.dart';
import 'package:fashion_stars/services/FashionsService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_stars/homescreen/DetailProductsAll.dart';
import 'package:provider/provider.dart';

import '../providers/FashionsProvider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController searchController = TextEditingController(text : '');

    List<FashionsModel> flist = [];
    List<FashionsModel> fashionsList = [];

    FashionsService fashionsService = FashionsService();


  // void updateList(String value) {
  //   setState(() {
  //     // display_list = allFashionList.where((element) => element.title!.toLowerCase().contains(value.toLowerCase())).toList();
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fashionsService.getFashions().then((subjectFromServer) {
      flist = subjectFromServer;
      fashionsList = flist;
    });
  }

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://fashions-stars-api.000webhostapp.com/';
    FashionsProvider fashionsProvider = Provider.of<FashionsProvider>(context);
    fashionsProvider.getFashions();
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
        title: Container(
            width: double.infinity,
            height: 35,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: TextField(
                controller: searchController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal:3),
                  prefixIcon: Icon(Icons.search, color: Colors.grey,),
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    fashionsList = flist.where((element) => element.title!.toLowerCase().contains(value.toLowerCase())).toList();
                  });
                },
              ),)
        ),
        actions: [
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child:
        fashionsList.length == 0
            ?
        Expanded(
            child: Center(
              child: Text('Search results!', style:
              TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),),
            )
        )
            :
        ListView.builder(
          itemCount: fashionsList.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProductsAll(fashions: fashionsList[index])));
                },
                child:Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.network(baseUrl+fashionsList![index].image!, width: 70, height:73),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(fashionsList![index].title!, style: TextStyle(fontWeight: FontWeight.w600),),
                          Text(fashionsList![index].brand!.name!, style: TextStyle(fontSize: 12, color: Colors.grey),)
                        ],
                      )
                    ],
                  ),
                ));
          },
        ),
        )
      );
  }
}
