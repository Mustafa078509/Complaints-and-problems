import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:project/first.dart';

double h=0;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print(message.notification?.title);
  print(message.notification?.body);
  print("mostaffa");

  AwesomeNotifications().createNotificationFromJsonData(message.data);
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  runApp(MyApp());
}



Widget splash() {

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(

      body: EasySplashScreen(
        logo: Image.asset('assets/images/logo.jpg'),
        showLoader: true,
        navigator: const first(),
        durationInSeconds: 5,
        logoSize: 240,
      ),
    ),
  );
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(


      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.grey,
      ),
      home: splash(),
    );
  }


}


