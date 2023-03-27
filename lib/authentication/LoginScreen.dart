import 'package:fashion_stars/providers/AuthProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fashion_stars/homescreen/HomeScreen.dart';
import 'package:fashion_stars/providers/FashionsProvider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');


  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async {
      await Provider.of<FashionsProvider>(context, listen: false).getFashions();
      if(await authProvider.login(
          email : emailController.text,
          password : passwordController.text
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black,
              content: Text('Login Failed!', textAlign: TextAlign.center,),)
        );
      };
    }

    Widget imageAsset() {
      return Center(
          child: Column(
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/logo_fs.png'))
                ),
              )
            ],
          ),
      );
    }
    Widget WelcomeScreen() {
      return Container(
        child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          Text("Welcome!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          Text("Enter your account", style: TextStyle(color: Colors.grey),),
          SizedBox(height: 20)
        ]
      )
      );
    }
    Widget EmailInput() {
      return Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Image.asset('assets/images/logo_email.png',
            height: 17),
            SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration.collapsed(
                    hintText: "Email"
                      , hintStyle: TextStyle(
                    fontSize: 13
                  )),
                    )
                  )],
        ),
      );
    }

    Widget PasswordInput() {
      return Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Image.asset('assets/images/logo_password.png',
            height: 17),
            SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration.collapsed(
                    hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: 13
                  )
                      ),
                    )
                  )],
        ),
      );
    }

    Widget SignUp() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
       child : Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Doesn't have an account?", style: TextStyle(color: Colors.grey)),
            SizedBox(width: 5),
            InkWell(
              child:Text("Register", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushNamed(context, '/register');
              })
          ],
        )
      );
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body : SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children :[
                  imageAsset(),
                  WelcomeScreen(),
                  EmailInput(),
                  SizedBox(
                    height: 10,
                  ),
                  PasswordInput(),
                SizedBox(
                  height: 10,
                ),
                 Container(
                   alignment: Alignment.topRight,
                   child: Text("Forgot your password?", style: TextStyle(
                     color: Colors.grey
                   ),),
                 ),
                SizedBox(
                  height: 20,
                ),
                new MaterialButton(
                  minWidth: MediaQuery. of(context). size. width,
                  onPressed: handleLogin,
                  padding: EdgeInsets.all(18),
                  child: Text('Login',
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
                SizedBox(
                  height: 28,
                ),
                SizedBox(
                  height: 28,
                ),
                Spacer(),
                SignUp()
              ],
          )
        ),
      )
    );
  }
}
