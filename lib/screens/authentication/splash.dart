import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawaoup/utils/color.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Lawaoup",
                        style: GoogleFonts.ubuntu(
                          fontSize: 30,
                          color: Color.fromRGBO(8, 54, 67, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Seamlessly update your time sheets with lawaoup",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntu(
                            fontSize: 28,
                            color: Color.fromRGBO(8, 54, 67, 1),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Image.asset('lib/assets/splash.png'),
                  Padding(padding: EdgeInsets.all(12)),
                  SpinKitDoubleBounce(
                    color: primaryColor,
                    size: 40,
                  )
                ],
              )
            ]),
      ),
    );
  }
}
