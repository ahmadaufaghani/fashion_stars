import 'package:fashion_stars/homescreen/HomeScreen.dart';
import 'package:fashion_stars/providers/AuthProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fashion_stars/providers/FashionsProvider.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');


  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleRegister() async {
      await Provider.of<FashionsProvider>(context, listen: false).getFashions();
      if(await authProvider.register(
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text)
      ) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            content: Text('Register Failed!', textAlign: TextAlign.center,),)
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
          Text("Create your account", style: TextStyle(color: Colors.grey),),
          SizedBox(height: 15)
        ]
      )
      );
    }

    Widget UsernameInput() {
      return Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.grey),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Image.asset('assets/images/logo_user.png',
                height: 17),
            SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration.collapsed(
                      hintText: "Username"
                      , hintStyle: TextStyle(
                      fontSize: 13
                  )),
                )
            )],
        ),
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
                  controller: passwordController,
                  obscureText: true,
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
            Text("Have an account?", style: TextStyle(color: Colors.grey)),
            SizedBox(width: 5),
            InkWell(
              child: Text("Log In", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              }
            )
          ],
        )
      );
    }

    Widget RegisterButton() {
      return new MaterialButton(
        minWidth: MediaQuery. of(context). size. width,
        onPressed: handleRegister,
        padding: EdgeInsets.all(18),
        child: Text('Register',
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
      );
    }

    Widget LoadingRegisterButton() {
      return MaterialButton(
        minWidth: MediaQuery. of(context). size. width,
        onPressed: handleRegister,
        padding: EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(
                  Colors.white
                ),
              ),
            ),
            SizedBox(width: 10,),
            Text('Loading',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                )
            ),
          ],
        ),
        color: Colors.black,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
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
                  UsernameInput(),
                  SizedBox(
                    height: 10,
                  ),
                  EmailInput(),
                  SizedBox(
                    height: 10,
                  ),
                  PasswordInput(),

                SizedBox(
                  height: 10,
                ),
                RegisterButton(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
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
