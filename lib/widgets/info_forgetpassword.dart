import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/account_check/account_check.dart';
import 'package:flutter_ecom/screens/screens.dart';
import 'package:flutter_ecom/widgets/button_square.dart';
import 'package:flutter_ecom/widgets/input_field.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoForgetPassword extends StatefulWidget {
  InfoForgetPassword({super.key});

  @override
  State<InfoForgetPassword> createState() => _InfoForgetPasswordState();
}

class _InfoForgetPasswordState extends State<InfoForgetPassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailTextController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Center(
              child: Image.asset(
                'assets/images/support.png',
                width: 120.0,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          InputField(
            hintText: 'Enter Email',
            icon: Icons.email_rounded,
            obscureText: false,
            textEditingController: _emailTextController,
            keyboardtType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          ButtonSquare(
            text: 'Send to Email',
            colors1: Colors.white60,
            colors2: Colors.white60,
            press: () async {
              try {
                await _auth.sendPasswordResetEmail(
                    email: _emailTextController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Password reset email has been sent!',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                );
              } on FirebaseAuthException catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.toString()),
                  ),
                );
              }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.width * 0.05,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'If you don\'t have any account',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return RegisterScreen();
                      },
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ),
            ],
          ),
          AccountCheck(
            login: false,
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
