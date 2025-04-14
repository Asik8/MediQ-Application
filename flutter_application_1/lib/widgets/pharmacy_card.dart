import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PharmacyCard extends StatelessWidget {
  final String name;
  final String address;
  final String distance;
  final String rating;
  final String phone;
  final String hours;

  const PharmacyCard({
    super.key,
    required this.name,
    required this.address,
    required this.distance,
    required this.rating,
    required this.phone,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(address),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('$distance km'),
                const SizedBox(width: 16),
                const Icon(Icons.star, size: 16, color: Colors.amber),
                Text(rating),
              ],
            ),
            const SizedBox(height: 8),
            Text('Phone: $phone'),
            const SizedBox(height: 8),
            Text('Hours: $hours'),
            const SizedBox(height: 16),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Directions'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
                    if (await canLaunchUrl(phoneUri)) {
                      await launchUrl(phoneUri);
                    }
                  },
                  child: const Text('Call'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}