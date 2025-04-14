import 'package:flutter/material.dart';
import 'package:mediqu/widgets/medicine_card.dart';

class PricePage extends StatelessWidget {
  const PricePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Medicine Prices',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            const SearchBar(
              hintText: 'Search Medicine...',
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Filter'),
                const Spacer(),
                const Text('Sort'),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16),
            const MedicineCard(
              name: 'Paracetamol 500mg',
              price: '¥ 7.67',
              brand: 'Tijdend',
              quantity: '30 Tablets',
            ),
            const MedicineCard(
              name: 'Amoxicillin 250mg',
              price: '¥ 10.67',
              brand: 'Amoxil',
              quantity: '20 Capsules',
            ),
            const MedicineCard(
              name: 'Loratadine 10mg',
              price: '¥ 12.67',
              brand: 'Clanitin',
              quantity: '20 Tablets',
            ),
          ],
        ),
      ),
    );
  }
}