import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lawaoup/services/auth.service.dart';
import 'package:lawaoup/utils/color.dart';

class Login extends StatefulWidget {
  const Login({Key? key, this.auth}) : super(key: key);
  final BaseAuth? auth;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  String _error = " ";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'lib/assets/banner1.png',
                height: MediaQuery.of(context).padding.top + 50,
                color: primaryColor,
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _error,
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red),
              ),
            ),
            Image.asset('lib/assets/login_bg.png'),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  // await widget.auth!.signInWithGoogle(context: context);
                  await widget.auth!.getAuth().signInWithCustomToken(
                      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsImlhdCI6MTYzMjIxNzA4NiwiZXhwIjoxNjMyMjIwNjg2LCJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay1yanR4ekBsYXdvdXAtNGI0ZjUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay1yanR4ekBsYXdvdXAtNGI0ZjUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJ1aWQiOiJReG42QTdDUnAyU0ZHam1vYmUyRXd3OGI0WE0yIn0.lY_4KxQ3rgXRJp5jJHAtFR8decIZFT99CDYV9OVNEqioq3qYkRS8eber4DU28Wc-rBWHsuUno6syTtpotiyMtjQf2f-4vFGrblKTs91ksdzqdiYpHW7JntBIuuGM1dv_AX1iq2oaupYqJBYqb3ChPAKoIihpZ5fAgt8RS3xKapBs-m3EoAdOl338zq5C16RUDm12TLCBASR4i5u4oWVe5boWpC9HFU4R0myJXOqzjwXQS1hA4IBBKyRXikMBijPvguP_aYhUslQ56rIpBv8J62VL70X6Na_IVuR6OcnFmz2SkbLRBEfjljj9mtQU9gZgg5cRkBFPo5YLL4jgXDVxmA");
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: Ink(
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Image.asset(
                            'lib/assets/google.png',
                          ),
                        ), // <-- Use 'Image.asset(...)' here
                        SizedBox(width: 12),
                        Text(
                          'Sign in with Google',
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'lib/assets/bannerbt.png',
                height: MediaQuery.of(context).padding.top,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
