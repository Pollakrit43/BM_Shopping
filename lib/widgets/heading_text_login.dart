import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadTextLogin extends StatelessWidget {
  const HeadTextLogin({super.key});

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
                fontSize: size.width * 0.1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Login',
              style: GoogleFonts.robotoMono(
                color: Colors.black87,
                fontSize: size.width * 0.09,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
