import 'package:flutter/material.dart';
import 'package:flutter_weather_api/model/weather_model.dart'; // WeatherData 모델
import 'package:flutter_weather_api/service/weather_service.dart'; // WeatherService 서비스

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  WeatherData? weatherData; // 현재 날씨 데이터를 저장할 변수

  @override
  void initState() {
    super.initState();
    _loadWeather(); // 초기 날씨 데이터를 로드
  }

  // 날씨 데이터를 API에서 가져오는 비동기 메서드
  Future<void> _loadWeather() async {
    try {
      // WeatherService를 호출하여 날씨 데이터 가져오기
      final data = await WeatherService.getCurrentWeather();
      setState(() {
        weatherData = data; // 가져온 데이터를 상태로 설정
      });
    } catch (e) {
      print('Error loading weather: $e');
    }
  }

  // 온도에 따라 날씨 상태를 결정하는 메서드
  String determineWeatherCondition(double temperature) {
    if (temperature >= 30) {
      return "Hot";
    } else if (temperature >= 20) {
      return "Warm";
    } else if (temperature >= 10) {
      return "Cool";
    } else {
      return "Cold";
    }
  }

  // 온도에 따라 아이콘을 반환 메서드
  IconData getWeatherIcon(double temperature) {
    if (temperature >= 30) {
      return Icons.wb_sunny; // 햇빛 아이콘
    } else if (temperature >= 20) {
      return Icons.cloud; // 구름 아이콘
    } else if (temperature >= 10) {
      return Icons.ac_unit; // 눈송이 아이콘
    } else {
      return Icons.thermostat; // 온도계 아이콘
    }
  }

  // 앱의 UI를 빌드
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'), // 앱 제목
        backgroundColor: Colors.blueAccent, // 앱바 배경색
      ),
      body: Container(
        // 배경에 그라데이션 추가
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.lightBlue.shade200],
          ),
        ),
        // 로딩 중이면 로딩 스피너, 날씨 데이터를 로드했으면 UI를 표시
        child: weatherData == null
            ? const Center(child: CircularProgressIndicator()) // 로딩 상태
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // 도시와 국가 정보 표시
                    Text(
                      '${weatherData!.cityName}, ${weatherData!.country}',
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      // 날씨 정보를 담는 카드
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8), // 반투명 배경
                        borderRadius: BorderRadius.circular(15), // 둥근 모서리
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), // 그림자
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // 온도에 따른 아이콘 표시
                          Icon(
                            getWeatherIcon(weatherData!.temperature),
                            size: 100,
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(height: 16),
                          // 현재 온도 표시
                          Text(
                            '${weatherData!.temperature} °C',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 98, 156, 255),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // 온도에 따른 날씨 상태 표시
                          Text(
                            'Condition: ${determineWeatherCondition(weatherData!.temperature)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // 습도 정보 표시
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.water_drop,
                                color: Colors.blueAccent,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Humidity: ${weatherData!.humidity}%',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    // 새로고침 버튼
                    ElevatedButton(
                      onPressed: _loadWeather,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 218, 231, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                      ),
                      child: const Text(
                        'Refresh', // 버튼 텍스트
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
