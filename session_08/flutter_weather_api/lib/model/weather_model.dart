class WeatherData {
  final String cityName; // 도시 이름
  final String country; // 국가 코드
  final double temperature; // 현재 온도
  final String description; // 날씨 상태 설명
  final int humidity; // 습도

  WeatherData({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.description,
    required this.humidity,
  });

  // JSON 데이터를 객체로 변환하는 팩토리 생성자
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['name'], // 도시 이름
      country: json['sys']['country'], // 국가 코드
      temperature: json['main']['temp'].toDouble(), // 섭씨 온도
      description: json['weather'][0]['description'], // 날씨 설명
      humidity: json['main']['humidity'], // 습도
    );
  }
}
