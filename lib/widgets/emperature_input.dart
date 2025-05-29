import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/constants.dart';

class TemperatureInput extends StatelessWidget {
  final TextEditingController controller;
  final String conversionType;
  final String convertedValue;
  final VoidCallback onConvert;

  const TemperatureInput({
    Key? key,
    required this.controller,
    required this.conversionType,
    required this.convertedValue,
    required this.onConvert,
  }) : super(key: key);

  String get inputLabel {
    return conversionType == AppConstants.fahrenheitToCelsius
        ? AppConstants.fahrenheitLabel
        : AppConstants.celsiusLabel;
  }

  String get inputUnit {
    return conversionType == AppConstants.fahrenheitToCelsius
        ? AppConstants.fahrenheitUnit
        : AppConstants.celsiusUnit;
  }

  String get outputLabel {
    return conversionType == AppConstants.fahrenheitToCelsius
        ? AppConstants.celsiusLabel
        : AppConstants.fahrenheitLabel;
  }

  String get outputUnit {
    return conversionType == AppConstants.fahrenheitToCelsius
        ? AppConstants.celsiusUnit
        : AppConstants.fahrenheitUnit;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\-?\d*\.?\d*'),
                      ),
                    ],
                    decoration: InputDecoration(
                      labelText: inputLabel,
                      border: const OutlineInputBorder(),
                      suffixText: inputUnit,
                    ),
                    onSubmitted: (_) => onConvert(),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  '=',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey.shade50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          outputLabel,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          convertedValue.isEmpty ? '0.00' : convertedValue,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          outputUnit,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onConvert,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(AppConstants.convertButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
