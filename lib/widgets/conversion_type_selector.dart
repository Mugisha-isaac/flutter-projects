import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ConversionTypeSelector extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;

  const ConversionTypeSelector({
    Key? key,
    required this.selectedType,
    required this.onTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.conversionLabel,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade700,
              ),
            ),
            const SizedBox(height: 12),
            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: const Text(AppConstants.fahrenheitToCelsiusLabel),
              value: AppConstants.fahrenheitToCelsius,
              groupValue: selectedType,
              onChanged: (value) => onTypeChanged(value!),
            ),
            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: const Text(AppConstants.celsiusToFahrenheitLabel),
              value: AppConstants.celsiusToFahrenheit,
              groupValue: selectedType,
              onChanged: (value) => onTypeChanged(value!),
            ),
          ],
        ),
      ),
    );
  }
}
