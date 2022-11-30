import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/account_check/account_check.dart';
import 'package:flutter_ecom/screens/screens.dart';
import 'package:flutter_ecom/widgets/widget.dart';

class InfoLogin extends StatefulWidget {
  InfoLogin({super.key});

  @override
  State<InfoLogin> createState() => _InfoLoginState();
}

class _InfoLoginState extends State<InfoLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailTextController =
      TextEditingController(text: '');

  final TextEditingController _passwordTextController =
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
            child: CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage(
                'assets/images/Logo.png',
              ),
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.width * 0.05,
          // ),
          InputField(
            hintText: 'Enter Email',
            icon: Icons.email_rounded,
            obscureText: false,
            textEditingController: _emailTextController,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          InputField(
            hintText: 'Enter Password',
            icon: Icons.lock,
            obscureText: true,
            textEditingController: _passwordTextController,
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.width * 0.02,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  //forget password
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return ForgetPasswordScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          ButtonSquare(
            text: 'Login',
            colors1: Colors.white60,
            colors2: Colors.white60,
            press: () async {
              try {
                await _auth.signInWithEmailAndPassword(
                  email: _emailTextController.text.trim().toLowerCase(),
                  password: _passwordTextController.text.trim(),
                );
                //HomeScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return HomeScreen();
                    },
                  ),
                );
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.toString()),
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          AccountCheck(
            login: true,
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return RegisterScreen();
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
