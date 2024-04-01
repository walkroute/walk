import 'dart:convert';

import 'package:dubbuck_front/model/weather_data.dart';
import 'package:dubbuck_front/screen/main/weather_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import '../../model/airQuality_data.dart';
import '../../provider/user_profile_provider.dart';
import '../profile/profile_screen.dart';
import 'airQuality_info.dart';
import 'custom_bottom_nav_bar.dart';
import 'daily_info_tiles.dart';
import 'logout.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  Future<WeatherData>? futureWeatherData;
  Future<AirQualityData>? futureAirQualityData;

  @override
  void initState() {
    super.initState();
    _fetchLocationAndData();
  }

  void _fetchLocationAndData() async {
    try {
      Position position = await _getCurrentLocation();
      fetchWeatherData(position);
      fetchAirQualityData(position);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      throw Exception('위치 서비스가 비활성화되어 있습니다.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('위치 권한이 거부되었습니다.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('위치 정보 접근 권한이 영구적으로 거부되었습니다.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void fetchWeatherData(Position position) async {
    try {
      var apiKey = dotenv.env['weatherKey'];
      var url =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&lang=kr&units=metric&appid=$apiKey';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        WeatherData weatherData = WeatherData.fromJson(json.decode(response.body));
        setState(() {
          futureWeatherData = Future.value(weatherData);
        });
      } else {
        throw Exception('날씨 데이터를 불러오는 데 실패했습니다.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('날씨 데이터를 가져오는 데 실패했습니다: $e'),
      ));
    }
  }

  void fetchAirQualityData(Position position) async {
    try {
      var apiKey = dotenv.env['weatherKey'];
      var airQualityUrl =
          'http://api.openweathermap.org/data/2.5/air_pollution?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';
      var response = await http.get(Uri.parse(airQualityUrl));
      if (response.statusCode == 200) {
        AirQualityData airQualityData = AirQualityData.fromJson(json.decode(response.body));
        setState(() {
          futureAirQualityData = Future.value(airQualityData);
        });
      } else {
        throw Exception('대기질 데이터를 불러오는 데 실패했습니다.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('대기질 데이터를 가져오는 데 실패했습니다: $e'),
      ));
    }
  }

  Widget _buildSkeletonUI() {
    return SkeletonListView(
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(8.0),
        child: SkeletonItem(
          child: Row(
            children: <Widget>[
              SkeletonAvatar(style: SkeletonAvatarStyle(width: 60, height: 60)),
              SizedBox(width: 10),
              Expanded(
                child: SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 3, spacing: 6, lineStyle: SkeletonLineStyle(randomLength: true)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
                child: CircleAvatar(
                  backgroundImage: userProfileProvider.profileImage != null ? FileImage(userProfileProvider.profileImage!) : null,
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
              title: Text(userProfileProvider.nickname ?? 'User'),
            ),
            FutureBuilder<WeatherData>(
              future: futureWeatherData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return _buildSkeletonUI();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return WeatherInfo(weatherData: snapshot.data!);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            FutureBuilder<AirQualityData>(
              future: futureAirQualityData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return AirQualityInfo(airQualityData: snapshot.data!);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            const DailyInfoTiles(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}