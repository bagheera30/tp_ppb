import 'package:flutter/material.dart';

import 'package:tp/tp13.dart';

// import 'package:tp/api/firebaseApi.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  // await firebaseApi().firebaseInit();
  runApp(MaterialApp(
    home: Tp13(),
  ));
}
