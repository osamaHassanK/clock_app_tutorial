import 'package:flutter/material.dart';

import 'clockview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var currentTime = DateTime.now();
    var hour = currentTime.hour;
    var minute = currentTime.minute;
    var second = currentTime.second;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/menu-burger.png',
                    scale: 4,
                  ),
                  Image.asset(
                    'assets/world.png',
                    scale: 15,
                  ),
                ],
              ),
            ),
            ClockView(),
            SizedBox(height: height*0.098,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$hour:$minute:$second",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                const Text(
                  "PM",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: height*0.02,),
            const Text(
              "Karachi, Pak | PST",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3),
            ),
          ],
        ),
      ),
    );
  }
}
