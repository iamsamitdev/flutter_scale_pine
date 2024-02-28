import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale/screens/welcome/welcome_screen.dart';
import 'package:flutter_scale/themes/styles.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // อนุญาติว่าให้หมุนทิศทางใดได้บ้าง
    // SystemChrome.setPreferredOrientations(
    //   [
    //     DeviceOrientation.portraitUp,
    //   ]
    // );

    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}