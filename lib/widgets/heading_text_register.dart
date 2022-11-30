import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadTextRegister extends StatelessWidget {
  const HeadTextRegister({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.005,
        vertical: size.height * 0.005,
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Center(
            child: Text(
              'BM Shopping',
              style: GoogleFonts.robotoMono(
                fontSize: size.width * 0.09,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(
          //   height: size.width * 0.05,
          // ),
          Center(
            child: Text(
              'Create Account',
              style: GoogleFonts.robotoMono(
                color: Colors.black87,
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
