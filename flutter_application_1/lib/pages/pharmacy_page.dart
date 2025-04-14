import 'package:flutter/material.dart';
import 'package:mediqu/widgets/pharmacy_card.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nearby Pharmacies',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            const Text('Find pharmacies close to your location'),
            const SizedBox(height: 16),
            const SearchBar(
              hintText: 'Enter Your Location',
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const PharmacyCard(
                  name: 'Care Pharmacy',
                  address: '123 Changong Street, Asulia',
                  distance: '0.7 km',
                  rating: '4.6',
                  phone: '+8801700000000',
                  hours: '9:00 AM - 10:00 PM',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}