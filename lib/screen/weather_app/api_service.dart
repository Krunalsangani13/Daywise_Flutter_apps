// api_service.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = dotenv.env['API_KEY'] ?? '';

  // Method to fetch weather data
  Future<Map<String, dynamic>?> getWeatherData(String city) async {
    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to load weather data');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }
}
