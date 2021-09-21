import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawaoup/routes/routes.dart';
import 'package:lawaoup/screens/authentication/login.dart';
import 'package:lawaoup/screens/authentication/splash.dart';
import 'package:lawaoup/screens/dashboard/home.dart';
import 'package:lawaoup/services/auth.service.dart';

enum AuthStatus { NOT_DETERMINED, NOT_LOGGED_IN, LOGGED_IN }

class Start extends StatefulWidget {
  const Start({Key? key, this.auth}) : super(key: key);
  final BaseAuth? auth;
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  AuthStatus authState = AuthStatus.NOT_DETERMINED;
  User? user;

  @override
  void initState() {
    super.initState();
    widget.auth!.getAuth().authStateChanges().listen((event) {
      Future.delayed(
        Duration(seconds: 2),
        () => {
          setState(() {
            authState =
                event == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
            user = user;
          })
        },
      );
    });
  }

  Widget setBody() {
    switch (authState) {
      case AuthStatus.NOT_DETERMINED:
        return WelcomePage();
      case AuthStatus.LOGGED_IN:
        return HomeScreen(user: user, auth: widget.auth);
      case AuthStatus.NOT_LOGGED_IN:
        return Login(
          auth: widget.auth,
        );
      default:
        return Container(
          child: Text("Error"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
      home: Scaffold(
        body: setBody(),
      ),
    );
  }
}
