import 'package:coffe_maker/widgets/home_bottom_bar2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 100, bottom: 40),
        decoration: BoxDecoration(
            color: Color(0xffefe0d7),
            image: DecorationImage(
              image: AssetImage("images/bg.jpg"),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Coffe Shop",
              style: GoogleFonts.laBelleAurore(
                  fontSize: 60,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Color(0xff332f28),
                    ),
                  ],
                  fontWeight: FontWeight.w700),
            ),
            Column(
              children: [
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Material(
                    color: Color(0xffd0bb93),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 35),
                        child: Text(
                          "Get Start",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Feeling Low? Take a Sip of Coffe",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
