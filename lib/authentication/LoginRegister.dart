import 'package:flutter/material.dart';
import 'package:fashion_stars/authentication/LoginScreen.dart';
import 'package:fashion_stars/authentication/RegisterScreen.dart';
import 'package:fashion_stars/providers/FashionsProvider.dart';
import 'package:provider/provider.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    handleToRegister() async {
      Navigator.pushNamed(context, '/register');
    }

    handleToLogin() async {
      Navigator.pushNamed(context, '/login');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery. of(context). size. width,
        height: MediaQuery. of(context). size. height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            SizedBox(
              height: 280,
              width: 280,
              child: Image.asset('assets/images/logo_fs.png')
            ),
            new MaterialButton(
                minWidth: 300,
                onPressed: handleToRegister,
              padding: EdgeInsets.all(18),
              child: Text('Register', style: TextStyle(fontSize: 16),),
              color: Colors.black,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 300,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: Colors.black,
                      side: BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                    padding:EdgeInsets.all(15)
                  ),
                  onPressed:handleToLogin,
                  child: const Text('Login',
                      style : TextStyle(fontSize: 16))),
            ),
          ],
        ),
      )
    );
  }
}
