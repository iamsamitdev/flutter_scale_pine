import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_scale/screens/login/login_screen.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_scale/screens/welcome/welcome_screen.dart';
import 'package:flutter_scale/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

// สร้างตัวแปรไว้เก็บหน้าหลักที่จะโหลดมาแสดง
dynamic initRoute;

void main() async {

  // ต้องเรียกใช้ WidgetsFlutterBinding.ensureInitialized()
  WidgetsFlutterBinding.ensureInitialized();

  // อ่านค่า SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // ตรวจสอบว่าเคยผ่านหน้า Welcome หรือยัง
  if(prefs.getBool('welcomeStatus') == true) {
    initRoute = const LoginScreen();
    // ตรวจสอบว่าเคย Login หรือยัง
    if(prefs.getBool('loginStatus') == true) {
      initRoute = const DashboardScreen();
    }
  } else {
    initRoute = const WelcomeScreen();
  }

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
      home: initRoute,
    );
  }
}