import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.3)
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          makeItem("assets/images/place.jpg"),
                          makeItem("assets/images/place2.jpg"),
                          makeItem("assets/images/place3.jpg")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    )
                  ],
                ),
              ),
            ),
          ),
          makePoint(140.0, 40.0),
          makePoint(190.0, 190.0),
          makePoint(219.0, 60.0)
        ],
      ),
    );
  }

  Widget makePoint(
    double top,
    double left,
  ) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: 20.0,
        width: 20.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.blue.withOpacity(0.3)),
        child: Animator<double>(
          duration: const Duration(seconds: 1),
          tween: Tween<double>(begin: 4.0, end: 6.0),
          cycles: 0,
          builder: (context, animatorState, child) => Center(
            child: Container(
              margin: EdgeInsets.all(animatorState.value),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItem(String image) {
    return AspectRatio(
      aspectRatio: 1.7 / 2,
      child: Container(
        margin: const EdgeInsets.only(right: 20.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.grey[200]),
                  child: Text(
                    "2.1 mi",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              "Golden Gate Bridge",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.star_border,
                color: Colors.yellow[700],
                size: 30.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
