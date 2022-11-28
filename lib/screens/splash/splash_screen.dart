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
    return Scaffold(
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
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          CircularProgressIndicator(),
          SizedBox(
            height: 180,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Create By : BB',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
