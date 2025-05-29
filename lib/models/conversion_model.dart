class ConversionModel {
  final String type;
  final double inputValue;
  final double outputValue;
  final DateTime timestamp;

  ConversionModel({
    required this.type,
    required this.inputValue,
    required this.outputValue,
    required this.timestamp,
  });

  String get formattedHistory {
    if (type == "fahrenheit-to-celsius") {
      return 'F to C: ${inputValue.toString()} => ${outputValue.toStringAsFixed(2)}';
    } else {
      return 'C to F: ${inputValue.toString()} => ${outputValue.toStringAsFixed(2)}';
    }
  }
}
