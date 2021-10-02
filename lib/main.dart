import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_screen.dart';
import 'user_home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioDiesel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      routes: {
        '/': (context) => LoginScreen(),
        UserHomeScreen.routeName: (context) => UserHomeScreen(),
      },
    );
  }
}
