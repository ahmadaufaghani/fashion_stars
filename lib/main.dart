import 'package:fashion_stars/providers/AuthProvider.dart';
import 'package:fashion_stars/providers/FashionsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'authentication/LoginScreen.dart';
import 'authentication/RegisterScreen.dart';
import 'homescreen/HomeScreen.dart';
import 'splashscreen/SplashScreen.dart';
import 'authentication/LoginRegister.dart';
import 'slider/SliderScreen.dart';
import 'package:provider/provider.dart';
import 'package:fashion_stars/providers/WishlistProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => AuthProvider()
          ),
          ChangeNotifierProvider(
              create: (context) => WishlistProvider(),
          ),
          ChangeNotifierProvider(
              create: (context) => FashionsProvider()
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          initialRoute: '/',
          routes: {
            '/' : (context) => SplashScreen(),
            '/slider' : (context) => SliderScreen(),
            '/loginregister': (context) => LoginRegister(),
            '/register': (context) => RegisterScreen(),
            '/login': (context) => LoginScreen(),
            '/home' : (context) => HomeScreen()
          },
        )
    );
  }
}