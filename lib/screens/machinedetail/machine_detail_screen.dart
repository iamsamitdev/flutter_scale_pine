// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_scale/utils/constant.dart';

class MachineDetailScreen extends StatefulWidget {
  const MachineDetailScreen({super.key});

  @override
  State<MachineDetailScreen> createState() => _MachineDetailScreenState();
}

class _MachineDetailScreenState extends State<MachineDetailScreen> {
  
  // ตัวแปรไว้เก็บสถานะของ Checkbox
  bool dailyCheck = false;
  bool weeklyCheck = false;
  
  @override
  Widget build(BuildContext context) {

    // รับค่าที่ส่งมาจากหน้า dashboard_screen.dart
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    // print(arguments['image_url']);

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['name']),
      ),
      body: ListView(
        children: [
          Image.network(
           baseURLAPIPLC + arguments['image_url'],
            height: 300.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ID: '),
                    Text(
                      arguments['id'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name: '),
                    Text(
                      arguments['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Location: '),
                    Text(
                      arguments['location'] ,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status: '),
                    Text(
                      arguments['status'] ,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Maintenence: '),
                    Text(
                      arguments['maintenanceStatus'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('รุ่น: '),
                    Text(
                      'Model XYZ-1234',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ผู้ผลิต: '),
                    Text(
                      'ABC Company',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ปีที่ผลิต: '),
                    Text(
                      '2020',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Daily check: '),
                    Checkbox(
                      value: dailyCheck, 
                      onChanged: (value){
                        setState(() {
                          dailyCheck = value!;
                        });
                      }
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Weekly check: '),
                    Checkbox(
                      value: weeklyCheck, 
                      onChanged: (value){
                        setState(() {
                          weeklyCheck = value!;
                        });
                      }
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  child: Text('SUBMIT'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
