import 'package:flutter/material.dart';
import 'package:temperature_converter/screens/converter_screen.dart';
import 'package:temperature_converter/utils/app_theme.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: AppTheme.lightTheme,
      home: ConverterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
