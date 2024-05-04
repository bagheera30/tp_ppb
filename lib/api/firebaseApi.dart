import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tp/main.dart';

class firebaseApi {
  final _fibaseMassegaing = FirebaseMessaging.instance;
  Future<void> firebaseInit() async {
    await _fibaseMassegaing.requestPermission();
    final token = await _fibaseMassegaing.getToken();
    print('token: $token');
    initPushNotifation();
  }

  void handleMessage(RemoteMessage? message) async {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed('/notification', arguments: message);
    print('A new FCM message arrived!');
    print(message.notification.toString());
  }

  Future initPushNotifation() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
