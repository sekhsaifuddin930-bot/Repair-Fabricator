import 'package:flutter/material.dart';

void main() {
  runApp(const RepairFabricatorApp());
}

class RepairFabricatorApp extends StatelessWidget {
  const RepairFabricatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repair Fabricator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange, useMaterial3: true),
      home: const OwnerAdminDashboard(),
    );
  }
}

class OwnerAdminDashboard extends StatelessWidget {
  const OwnerAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Fabricator - Director Panel'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Director: Saifuddin Sekh',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'PNB A/C: 0701200100018129 (IFSC: PUNB0070120)',
              style: TextStyle(fontSize: 16, color: Colors.deepOrange),
            ),
            SizedBox(height: 10),
            Text(
              'Platform Royalty Commission: 15% Automated Split Active',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
