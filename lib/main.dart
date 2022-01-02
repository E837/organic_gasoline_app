import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_screen.dart';
import 'user_home_screen.dart';

void main() {
  //TODO: DO ATTRIBUTION FOR DOG ICON USED IN THE APP OR DRAW SOMETHING BY YOURSELF
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
