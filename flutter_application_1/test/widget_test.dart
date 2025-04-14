import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mediqu/main.dart'; // Make sure this import matches your project name

void main() {
  testWidgets('Splash screen loads and shows MediQ logo', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that splash screen shows the MediQ logo
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('MediQ'), findsOneWidget);
    expect(find.text('Your Personal Medicine Assistant'), findsOneWidget);
  });

  testWidgets('Navigation to login screen works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    // Wait for splash screen to complete
    await tester.pumpAndSettle();
    
    // Verify we're on the login screen
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2)); // Email and password fields
  });
}