// lib/screens/machine_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/machine.dart'; // Makine model sınıfı

class MachineDetailScreen extends StatelessWidget {
  final Machine machine;

  const MachineDetailScreen({super.key, required this.machine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(machine.name , style: const TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: machine.imageUrl != null
                      ? NetworkImage(machine.imageUrl!)
                      : const AssetImage('assets/images/image1.jpg') as ImageProvider,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 8),
                  Text(
                    'Type: ${machine.type}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Status: ${machine.status}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  // Diğer makine özellikleri buraya eklenebilir
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
