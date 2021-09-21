// import 'package:Peldano/Pages/category.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawaoup/screens/authentication/start.dart';
import 'package:lawaoup/services/auth.service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(new MaterialApp(
    home: Start(auth: new AuthService()),
    theme: ThemeData(
        canvasColor: Colors.transparent,
        fontFamily: GoogleFonts.ubuntu().fontFamily),
  ));
}
