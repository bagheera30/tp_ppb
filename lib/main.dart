import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tp/NotificationScreen.dart';
import 'package:tp/tp11.dart';
import 'firebase_options.dart';
import 'package:tp/api/firebaseApi.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await firebaseApi().firebaseInit();
  runApp(MaterialApp(
    home: Tp11(),
    debugShowCheckedModeBanner: false,
    navigatorKey: navigatorKey,
    routes: {
      '/notification': (context) => NotificationScreen(),
    },
  ));
}
