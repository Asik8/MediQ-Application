import 'package:flutter/material.dart';
import 'package:mediqu/pages/medicine_shop_page.dart';
import 'package:mediqu/pages/pharmacy_page.dart';
import 'package:mediqu/pages/price_page.dart';
import 'package:mediqu/pages/reminder_page.dart';
import 'package:mediqu/pages/symptom_page.dart';
import 'package:mediqu/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const _HomeContent(),
    const PharmacyPage(),
    const PricePage(),
    const MedicineShopPage(),
    const SymptomPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'MediQ'),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy),
            label: 'Pharmacy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Price',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Symptom',
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Medicine Search',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          const SearchBar(
            hintText: 'Search...',
          ),
          const SizedBox(height: 16),
          const Text(
            'Quick Actions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _QuickActionButton(
                icon: Icons.search,
                label: 'Check Price',
                onTap: () {},
              ),
              _QuickActionButton(
                icon: Icons.alarm,
                label: 'Set Reminder',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReminderPage()),
                  );
                },
              ),
              _QuickActionButton(
                icon: Icons.local_pharmacy,
                label: 'Nearby',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            "Today's Schedule",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _ReminderItem(
                    medicine: 'Vitamin D',
                    dosage: 'Morning - 1 Tablet',
                    isChecked: false,
                  ),
                  const Divider(),
                  _ReminderItem(
                    medicine: 'Vitamin C ≥50mg',
                    dosage: 'Morning - 2 Tablet',
                    isChecked: false,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Health Tips',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HealthTipItem(
                    tip: 'Store medicines in a cool, dry place',
                  ),
                  SizedBox(height: 8),
                  _HealthTipItem(
                    tip: 'Check expiration dates regularly',
                  ),
                  SizedBox(height: 8),
                  _HealthTipItem(
                    tip: 'Keep a list of current medications',
                  ),
                  SizedBox(height: 8),
                  _HealthTipItem(
                    tip: 'Never share prescription medicines',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReminderItem extends StatelessWidget {
  final String medicine;
  final String dosage;
  final bool isChecked;

  const _ReminderItem({
    required this.medicine,
    required this.dosage,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {},
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                medicine,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                dosage,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HealthTipItem extends StatelessWidget {
  final String tip;

  const _HealthTipItem({
    required this.tip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.circle, size: 8, color: Colors.green),
        const SizedBox(width: 8),
        Expanded(child: Text(tip)),
      ],
    );
  }
}