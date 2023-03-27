import 'package:fashion_stars/models/UserModels.dart';
import 'package:fashion_stars/providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    logout() async {

      String baseUrl = 'https://fashions-stars-api.000webhostapp.com/api';
      var token = user.token;
      var url = Uri.parse('$baseUrl/logout');
      var headers = {'Content-Type' : 'application/json', 'Authorization' : 'Bearer $token' };

      var response = await http.get(
          url, headers : headers
      );

      if(response.statusCode == 200) {
        Navigator.pushNamed(context,'/login');
      } else {
        throw Exception('Logout Failed!');
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
        actions: [
          TextButton(onPressed: () {},
              child: Text(
                'Edit',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black
                ),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal : 38),
        alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/profile_picture.jpg', width: 150,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {},
                    child: Image.asset('assets/images/edit_profile_picture.png', width: 50,),
                  )
                ],
              ),
              SizedBox(height: 67),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username', style: TextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: TextFormField(
                              initialValue: user.username,
                              decoration: InputDecoration.collapsed(hintText: ""),
                            )
                        )],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: TextStyle(fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: TextFormField(
                              initialValue: user.email,
                              decoration: InputDecoration.collapsed(hintText: ""),
                            )
                        )],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text('Password', style: TextStyle(fontWeight: FontWeight.w600),),
              //     SizedBox(height: 10,),
              //     Container(
              //       height: 50,
              //       padding: EdgeInsets.symmetric(horizontal: 15),
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 1.5, color: Colors.grey),
              //           borderRadius: BorderRadius.circular(15)
              //       ),
              //       child: Row(
              //         children: [
              //           SizedBox(
              //             width: 5,
              //           ),
              //           Expanded(
              //               child: TextFormField(
              //                 initialValue: "1234",
              //                 decoration: InputDecoration.collapsed(hintText: ""),
              //               )
              //           )],
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(
                height: 30,
              ),
              new MaterialButton(
                minWidth: MediaQuery. of(context). size. width,
                onPressed: () {
                  logout();
                },
                padding: EdgeInsets.all(18),
                child: Text('Log Out',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )
                ),
                color: Colors.black,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ],
          ),
      ),
    );
  }
}
