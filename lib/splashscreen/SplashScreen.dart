import 'package:flutter/material.dart';
import 'package:fashion_stars/authentication/LoginRegister.dart';
import 'package:fashion_stars/slider/SliderScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int splashtime = 6;

  void initState() {
    Future.delayed(Duration(seconds : splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return SliderScreen();
        }
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body : Container(
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [SizedBox(
                  height: 400,
                  width: 400,
                  child: Image.asset('assets/images/logo_fs.png')
              )],
            ),
          ),
        )
    );
  }
}
