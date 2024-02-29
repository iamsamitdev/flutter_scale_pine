import 'package:flutter/material.dart';

class MachineDetailScreen extends StatefulWidget {
  const MachineDetailScreen({super.key});

  @override
  State<MachineDetailScreen> createState() => _MachineDetailScreenState();
}

class _MachineDetailScreenState extends State<MachineDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Machine 1'),
        ),
        body: ListView(
          children: const [
            SizedBox(height: 10),
            Text('Machine 1',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Location: ตึก A ชั้น 2',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
          ],
        ),
        );
  }
}
