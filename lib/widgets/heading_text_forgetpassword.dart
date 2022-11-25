import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadTextForgetPassword extends StatelessWidget {
  const HeadTextForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Center(
            child: Text(
              'Forget Password',
              style: GoogleFonts.robotoMono(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Reset Here',
               style: GoogleFonts.robotoMono(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}