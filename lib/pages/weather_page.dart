import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/service/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weatherService = WeatherService("a817bb512b71489dafb575990dc1859d");

  Weather? _weather;
  fetchweather() async {
    String cityName = await weatherService.getCurrentCity();
    try {
      final weather = await weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) {
      return "assets/lottie/Animation - 1701961533032.json";
    }

    switch (mainCondition.toLowerCase()) {
      case 'Cloud':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'fog':
        return "assets/lottie/Animation - 1701961356315.json";
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return "assets/lottie/Animation - 1701961441085.json";
      case 'Thunderstorm':
        return "assets/lottie/Animation - 1701961533032.json";
      case "clear":
        return "assets/lottie/Animation - 1701961598427.json";
      default:
        return 'assets/lottie/Animation - 1701961712961.json';
    }
  }

  @override
  void initState() {
    fetchweather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weather?.cityName ?? "Loading city...",
              style: const TextStyle(fontSize: 35),
            ),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            Text(
              '${_weather?.temperature.round()}°C',
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              _weather?.mainCondition ?? "",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
