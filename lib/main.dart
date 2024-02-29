import 'package:flutter/material.dart';
import 'package:flutter_scale/app_router.dart';
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
    initRoute = AppRouter.welcome;
    // ตรวจสอบว่าเคย Login หรือยัง
    if(prefs.getBool('loginStatus') == true) {
      initRoute = AppRouter.dashboard;
    }
  } else {
    initRoute = AppRouter.welcome;
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
      initialRoute: initRoute,
      routes: AppRouter.routes,
    );
  }
}