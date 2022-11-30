import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //หน่วงเวลา
    Future.delayed(
      Duration(
        seconds: 2,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.grey,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/images/Logo.png'),
              ),
            ),
            Container(
              child: Text(
                'BM Shopping',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Create By : BB',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
