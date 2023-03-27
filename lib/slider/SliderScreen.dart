import 'package:fashion_stars/authentication/LoginRegister.dart';
import 'package:flutter/material.dart';
import 'package:fashion_stars/slider/SliderPage.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();


  List <Widget> _pages = [
    SliderPage(
        title: "Up-to-date",
        description: "Keep up-to-date with the latest fashions!",
        image: "assets/images/slides.jpg"),
    SliderPage(
        title: "Easy to Use",
        description: "The easiest way to keep up with the lates fashions!",
        image: "assets/images/slides2.jpg"
    ),
    SliderPage(
        title: "Convenient",
        description: "A convenient way to keep it up everywhere!",
        image: "assets/images/slides3.jpg"
    )
  ];


  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index) {
                return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (int index) {
                  return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10, width: (index == _currentPage) ? 10 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage) 
                            ? Colors.black
                            : Colors.black.withOpacity(0.5)
                      ),
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  (_currentPage == (_pages.length - 1)) 
                      ? Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRegister()))
                      : _controller.nextPage(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeInOutQuint
                      
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 30,
                          alignment: Alignment.center,
                          width: (_currentPage == (_pages.length - 1)) ? 100 : 70,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child : (_currentPage == (_pages.length - 1))
                              ? Text("Get Started", style: TextStyle(color: Colors.white))
                              : Text("Next", style: TextStyle(color: Colors.white)
                          )
                      ),
                    ],
                  )
                )
              )],
          )
        ],
      ),
    );
  }
}
