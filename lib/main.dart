import 'package:animation_weather_forecast/cloud_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WeatherForecast(),
    );
  }
}

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade600.withOpacity(0.8),
      child: Stack(
        children: const [
          FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: 0.2,
            child: CloudEmoji(),
          ),
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Tempreture(),
            ),
          ),
        ],
      ),
    );
  }
}

class Tempreture extends StatelessWidget {
  const Tempreture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "東京",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(8),
            child: SvgPicture.network("https://www.jma.go.jp/bosai/forecast/img/200.svg"),
          ),
          Text(
            "最低: ${6}° 最高: ${18}°",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: WeekyForecaseCard(),
          ),
        ],
      ),
    );
  }
}

class WeekyForecaseCard extends StatelessWidget {
  const WeekyForecaseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        color: Colors.grey.shade200,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "2023/03/06",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SvgPicture.network("https://www.jma.go.jp/bosai/forecast/img/200.svg"),
                  Text(
                    "晴れときどき曇り",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "最低 9° 最高 18°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
