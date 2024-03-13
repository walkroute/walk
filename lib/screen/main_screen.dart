import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import '../provider/user_profile_provider.dart';
import 'profile/profile_screen.dart';
import 'login_screen.dart';
import '../component/main/weather_data.dart';
import '../component/fix/custom_bottom_nav_bar.dart';
import '../component/main/daily_info_tiles.dart';
import '/component/main/weather_info.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool _isLoading = true; // 데이터 로딩 상태 관리

  @override
  void initState() {
    super.initState();

    fetchWeatherData().then((_) {
      if (mounted) {
        setState(() {
          _isLoading = false; // 데이터 로딩 완료 후 로딩 상태 업데이트
        });
      }
    });
  }

  Future<WeatherData> fetchWeatherData() async {
    // 데이터 로딩을 시뮬레이션합니다. 실제 앱에서는 API 호출 등을 통해 데이터를 가져옵니다.
    await Future.delayed(Duration(seconds: 2));
    return WeatherData(
      condition: '구름 많음',
      temperature: 12,
      feelsLike: 11,
      windSpeed: 1.6,
      humidity: 42,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: _isLoading ? _buildSkeletonUI() : _buildContentUI(userProfileProvider), // 로딩 상태에 따라 UI 분기 처리
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildSkeletonUI() {
    // 스켈레톤 UI를 구성하는 위젯
    return SkeletonListView(
      itemCount: 3, // 예시 항목 수
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SkeletonItem(
          child: Row(
            children: <Widget>[
              SkeletonAvatar(style: SkeletonAvatarStyle(width: 60, height: 60)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SkeletonLine(style: SkeletonLineStyle(height: 14, borderRadius: BorderRadius.circular(4))),
                    const SizedBox(height: 4),
                    SkeletonLine(style: SkeletonLineStyle(height: 12, width: 100, borderRadius: BorderRadius.circular(4))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentUI(UserProfileProvider userProfileProvider) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);

    return Column(
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
          title: Text(userProfileProvider.username ?? 'User'), // Use the username from UserProfileProvider
        ),
        WeatherInfo(futureWeatherData: fetchWeatherData()),
        const DailyInfoTiles(),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
