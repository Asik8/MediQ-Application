import 'package:flutter/material.dart';

class ReminderCard extends StatelessWidget {
  final String medicineName;
  final String dosage;
  final String time;
  final bool isActive;

  const ReminderCard({
    super.key,
    required this.medicineName,
    required this.dosage,
    required this.time,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              medicineName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Dosage: $dosage'),
            const SizedBox(height: 8),
            Text('Time: $time'),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Active'),
              value: isActive,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}