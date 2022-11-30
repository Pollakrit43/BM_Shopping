import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadTextForgetPassword extends StatelessWidget {
  const HeadTextForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(
        size.width * 0.05,
      ),
      child: Column(
        children: [
          // SizedBox(
          //   height: size.height * 0.005,
          // ),
          Center(
            child: Text(
              'Forget Password',
              style: GoogleFonts.robotoMono(
                fontSize: size.height * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          Center(
            child: Text(
              'Reset Here',
              style: GoogleFonts.robotoMono(
                color: Colors.black87,
                fontSize: size.height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
