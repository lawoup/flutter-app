import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawaoup/services/auth.service.dart';
import 'package:lawaoup/services/backendService.dart';
import 'package:lawaoup/utils/color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({@required this.user, this.auth});
  final User? user;
  final BaseAuth? auth;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BackendService _backendService = BackendService();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    setupFirebase();
  }

  void setupFirebase() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print(settings.authorizationStatus.index);
    String? token = await messaging.getToken();
    FirebaseMessaging.onMessage.listen((event) {
      if (event.notification != null) {
        print(event.notification!.title);
        print(event.notification!.body);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(event.notification!.title!),
            content: Text(event.notification!.body!),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Open"),
              )
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/assets/banner1.png',
                    height: MediaQuery.of(context).padding.top + 50,
                    color: primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      "Lawoup",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              statusCard('lib/assets/task.png', "Add Task", "10"),
              statusCard('lib/assets/project.png', "Add Project", "10"),
              statusCard('lib/assets/role.png', "Add Role", "10"),
              statusCard('lib/assets/client.png', "Add Client", "10"),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                      onPressed: () {
                        widget.auth!.getAuth().signOut();
                      },
                      child: Row(
                        children: [
                          Text(
                            "Logout",
                            style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.logout),
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    'lib/assets/bannerbt.png',
                    height: MediaQuery.of(context).padding.top + 50,
                    color: primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget statusCard(String asset, String label, String count) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 90,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: GoogleFonts.ubuntu(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset(
                  asset,
                  height: 40,
                  width: 40,
                ),
              ],
            ),
          )),
    ),
  );
}
