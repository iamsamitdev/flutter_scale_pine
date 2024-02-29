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
        children: [
          Image.network(
            'https://www.itgenius.co.th/sandbox_api/plcapi/images/machines/machine-1.jpg',
            height: 400.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Machine ID: '),
                      Text(
                        '1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
