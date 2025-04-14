import 'package:flutter/material.dart';

class MedicineShopPage extends StatelessWidget {
  const MedicineShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Medicine Shop',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            const Text('Purchase medicines and healthcare products'),
            const SizedBox(height: 16),
            const SearchBar(
              hintText: 'Search Products...',
            ),
            const SizedBox(height: 16),
            const Text('Filter Products'),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Chip(
                      label: const Text('Vitamin'),
                      backgroundColor: Colors.green[100],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}