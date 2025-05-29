import 'package:temperature_converter/models/conversion_model.dart';

class TemperatureService {
  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  static double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  static ConversionModel convert(String type, double value) {
    double result;
    if (type == 'fahrenheit-to-celsius') {
      result = fahrenheitToCelsius(value);
    } else {
      result = celsiusToFahrenheit(value);
    }

    return ConversionModel(
      type: type,
      inputValue: value,
      outputValue: result,
      timestamp: DateTime.now(),
    );
  }
}
