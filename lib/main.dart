import 'package:flutter/material.dart';
import 'package:bisklet/app/sign_in/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: true,
    title: 'Bisklet',
    theme: ThemeData(
      primaryColor: Colors.grey[200],

    ),
    home: SplashScreen(),

    );
  }
}
