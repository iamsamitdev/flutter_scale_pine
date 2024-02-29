import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/login/login_screen.dart';
import 'package:flutter_scale/services/machine_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  // ทดสอบการอ่านข้อมูลเครื่องจักรจาก API
  void _getMachineData() async {
    var data = await MachineAPI().getAllMachine();
    var jsonData = jsonEncode(data);
    print(jsonData);
  }

  // ฟังก์ชันที่ทำงานก่อนการแสดงผลหน้าจอ
  @override
  void initState() {
    super.initState();
    _getMachineData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
        actions: [
          // Logout Button
          IconButton(
            onPressed: () async {
              // อ่านค่า SharedPreferences
              SharedPreferences prefs = await SharedPreferences.getInstance();
              // ลบค่า SharedPreferences
              prefs.remove('loginStatus');
     
              // กลับไปหน้า Login
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const LoginScreen())
              );
            },
            icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: const Center(
        child: Text('Dashboard Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          print(value);
        },
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Report'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
        ],
      ),
    );
  }
}