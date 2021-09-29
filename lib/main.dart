import 'package:flutter/material.dart';

import 'sign_up.dart';
import 'user_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioDiesel',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool formFilled = false;
  void isDataSubmitted(String email, String password) {
    setState(() {
      if (email.isNotEmpty && password.isNotEmpty) {
        Navigator.pop(context);
        formFilled = true;
      } else {
        formFilled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BioDiesel App')),
        body: Stack(
          children: [
            // --> it's a gradient
            //TODO: IMPLEMENT A NICE BACKGROUND COLOR(WITH SOME ANIMATIONS)
            // Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //       colors: [
            //         Colors.white,
            //         Colors.lightBlueAccent,
            //       ],
            //     ),
            //   ),
            // ),
            formFilled ? UserHomePage() : SignUp(isDataSubmitted),
          ],
        ));
  }
}
