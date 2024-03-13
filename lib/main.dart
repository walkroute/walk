import 'package:dubbuck_ver2/provider/user_profile_provider.dart';
import 'package:flutter/material.dart';
import '/splash/splashFirst.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Map<String, dynamic>>('events');
  initializeDateFormatting('ko_KR', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
      ],
      child: MaterialApp(
          home: SplashScreen(),
      ),
    );
  }
}
