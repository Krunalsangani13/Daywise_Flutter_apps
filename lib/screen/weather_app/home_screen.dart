import 'package:flutter/material.dart';
import 'api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService weatherService = WeatherService();
  String city = 'London';
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final data = await weatherService.getWeatherData(city);
    setState(() {
      weatherData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in $city'),
      ),
      body: Center(
        child: weatherData != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Temperature: ${weatherData!['main']['temp']}°C',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Description: ${weatherData!['weather'][0]['description']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}
