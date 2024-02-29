import 'package:flutter/material.dart';

class MachineDetailScreen extends StatefulWidget {
  const MachineDetailScreen({super.key});

  @override
  State<MachineDetailScreen> createState() => _MachineDetailScreenState();
}

class _MachineDetailScreenState extends State<MachineDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset('https://www.itgenius.co.th/sandbox_api/plcapi/images/machines/machine-1.jpg'),
        const SizedBox(height: 10),
        const Text(
          'Machine 1', 
          textAlign: TextAlign.center, 
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
        ),
        const SizedBox(height: 10),
        const Text(
          'Location: ตึก A ชั้น 2', 
          textAlign: TextAlign.center, 
          style: TextStyle(fontSize: 16)
        ),
      ],
    );
  }
}