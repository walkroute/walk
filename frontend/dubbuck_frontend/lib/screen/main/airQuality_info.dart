import 'package:flutter/material.dart';
import 'package:dubbuck_front/model/airQuality_data.dart';

class AirQualityInfo extends StatelessWidget {
  final AirQualityData airQualityData;

  const AirQualityInfo({Key? key, required this.airQualityData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: getAirQualityWidget(airQualityData.aqi),
    );
  }

  Widget getAirQualityWidget(int condition) {
    String imagePath;
    String text;
    Color textColor;

    switch (condition) {
      case 1:
        imagePath = 'assets/매우좋음.png';
        text = '매우 좋음';
        textColor = Colors.indigo;
        break;
      case 2:
        imagePath = 'assets/좋음.png';
        text = '좋음';
        textColor = Colors.indigo;
        break;
      case 3:
        imagePath = 'assets/보통.png';
        text = '보통';
        textColor = Colors.black87;
        break;
      case 4:
        imagePath = 'assets/나쁨.png';
        text = '나쁨';
        textColor = Colors.black87;
        break;
      case 5:
        imagePath = 'assets/매우나쁨.png';
        text = '매우 나쁨';
        textColor = Colors.black87;
        break;
      default:
        imagePath = 'assets/very_bad.png';
        text = '정보 없음';
        textColor = Colors.grey;
        break;
    }

    return Row(
      children: [
        Text(
          '미세먼지',
            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold)
        ),
        const SizedBox(width: 8),
        Image.asset(imagePath, width: 24),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
