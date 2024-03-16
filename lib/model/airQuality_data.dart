class AirQualityData {
  final int aqi;

  AirQualityData({required this.aqi});

  factory AirQualityData.fromJson(Map<String, dynamic> json) {
    return AirQualityData(
      aqi: (json['list'][0]['main']['aqi']).toInt(),
    );
  }
}
