class Reminder {
  final String id;
  final String medicineId;
  final String medicineName;
  final String dosage;
  final List<String> times;
  final bool isActive;

  Reminder({
    required this.id,
    required this.medicineId,
    required this.medicineName,
    required this.dosage,
    required this.times,
    required this.isActive,
  });
}