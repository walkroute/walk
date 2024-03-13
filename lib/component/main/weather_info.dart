import 'package:flutter/material.dart';
import 'weather_data.dart';

class WeatherInfo extends StatelessWidget {
  final Future<WeatherData> futureWeatherData;

  const WeatherInfo({Key? key, required this.futureWeatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: FutureBuilder<WeatherData>(
        future: futureWeatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('날씨 정보를 가져오는 데 실패했습니다.');
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.cloud, size: 24), // 구름 아이콘
                    SizedBox(width: 8),
                    Text('${snapshot.data!.temperature}°C', style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
                Row(
                  children: [
                    Text('체감온도 ${snapshot.data!.feelsLike}°C'),
                    SizedBox(width: 8),
                    Text('풍속 ${snapshot.data!.windSpeed}m/s'),
                  ],
                ),
                Row(
                  children: [
                    Text('습도 ${snapshot.data!.humidity}%'),
                  ],
                ),
              ],
            );
          } else {
            return Text('날씨 정보가 없습니다.');
          }
        },
      ),
    );
  }
}
