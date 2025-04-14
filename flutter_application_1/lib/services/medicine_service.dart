import 'package:mediqu/models/medicine.dart';
import 'package:mediqu/models/pharmacy.dart';
import 'package:mediqu/models/reminder.dart';

class MedicineService {
  Future<List<Medicine>> getMedicines() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Medicine(
        id: '1',
        name: 'Paracetamol 500mg',
        brand: 'Tijdend',
        price: 7.67,
        dosage: '1 tablet every 6 hours',
        quantity: '30 Tablets',
        imageUrl: '',
        description: 'For pain relief and fever reduction',
      ),
      Medicine(
        id: '2',
        name: 'Amoxicillin 250mg',
        brand: 'Amoxil',
        price: 10.67,
        dosage: '1 capsule every 8 hours',
        quantity: '20 Capsules',
        imageUrl: '',
        description: 'Antibiotic for bacterial infections',
      ),
    ];
  }

  Future<List<Pharmacy>> getPharmacies() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Pharmacy(
        id: '1',
        name: 'Care Pharmacy',
        address: '123 Changong Street, Asulia',
        distance: 0.7,
        rating: 4.6,
        phone: '+8801700000000',
        hours: '9:00 AM - 10:00 PM',
        lat: 23.8103,
        lng: 90.4125,
      ),
    ];
  }

  Future<List<Reminder>> getReminders() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Reminder(
        id: '1',
        medicineId: '1',
        medicineName: 'Vitamin D',
        dosage: '1 Tablet',
        times: ['Morning'],
        isActive: true,
      ),
    ];
  }
}