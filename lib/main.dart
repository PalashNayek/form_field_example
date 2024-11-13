import 'package:flutter/material.dart';
import 'package:form_field_example/di/service_locator.dart';
import 'package:form_field_example/screens/form_field_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormFieldScreen(),
    );
  }
}
