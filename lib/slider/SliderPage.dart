import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage({required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Image.asset(image,
            width: 350,
            ),
          SizedBox(height : 30),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
            child: Text(description, style: TextStyle(height: 1.5,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.7,),
            textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
