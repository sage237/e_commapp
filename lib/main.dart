
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../SplashPage/SplashPageView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'E Commerce App',
theme: ThemeData(
  appBarTheme:  AppBarTheme(actionsIconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,shadowColor: Colors.transparent,
      iconTheme:IconThemeData(color: Colors.black),
      titleTextStyle:   TextStyle(color: Colors.black),

      elevation: 0)
),


      debugShowCheckedModeBanner: false,
      home: SplashPageView(),
    );
  }
}
