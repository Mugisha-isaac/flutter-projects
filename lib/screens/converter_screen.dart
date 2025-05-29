import 'package:flutter/material.dart';
import 'package:temperature_converter/models/conversion_model.dart';
import 'package:temperature_converter/services/temperature_service.dart';
import 'package:temperature_converter/utils/app_theme.dart';
import 'package:temperature_converter/utils/constants.dart';
import 'package:temperature_converter/widgets/conversion_type_selector.dart';
import 'package:temperature_converter/widgets/emperature_input.dart';
import 'package:temperature_converter/widgets/history_panel.dart';

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  String _conversionType = AppConstants.fahrenheitToCelsius;
  final TextEditingController _inputController = TextEditingController();
  String _convertedValue = '';
  List<ConversionModel> _history = [];

  void _convertTemperature() {
    if (_inputController.text.isEmpty) return;

    double? inputValue = double.tryParse(_inputController.text);
    if (inputValue == null) return;

    ConversionModel conversion = TemperatureService.convert(
      _conversionType,
      inputValue,
    );

    setState(() {
      _convertedValue = conversion.outputValue.toStringAsFixed(2);
      _history.insert(0, conversion); // Add to beginning for most recent first
    });
  }

  void _onConversionTypeChanged(String newType) {
    setState(() {
      _conversionType = newType;
      _convertedValue = '';
    });
  }

  Widget _buildPortraitLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConversionTypeSelector(
              selectedType: _conversionType,
              onTypeChanged: _onConversionTypeChanged,
            ),
            const SizedBox(height: 20),
            TemperatureInput(
              controller: _inputController,
              conversionType: _conversionType,
              convertedValue: _convertedValue,
              onConvert: _convertTemperature,
            ),
            const SizedBox(height: 20),
            if (_history.isNotEmpty)
              SizedBox(height: 200, child: HistoryPanel(history: _history)),
          ],
        ),
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ConversionTypeSelector(
                    selectedType: _conversionType,
                    onTypeChanged: _onConversionTypeChanged,
                  ),
                  const SizedBox(height: 16),
                  TemperatureInput(
                    controller: _inputController,
                    conversionType: _conversionType,
                    convertedValue: _convertedValue,
                    onConvert: _convertTemperature,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: HistoryPanel(history: _history, isCompact: true),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.appTitle,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        elevation: 4,
      ),
      body: Container(
        decoration: AppTheme.backgroundGradient,
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? _buildPortraitLayout()
                : _buildLandscapeLayout();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
