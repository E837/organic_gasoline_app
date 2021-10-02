import 'package:flutter/material.dart';

import 'logo.dart';
import 'animal.dart';
import 'user_input.dart';
import 'delivery_button.dart';
import 'logout_button.dart';

class UserHomeScreen extends StatefulWidget {
  static const routeName = '/user-home-screen';

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final fillPercent = TextEditingController();
  double waveHeight = -260;

  double mapPercentToWaveHeight() {
    /*-105 is max
    * -260 is min
    * 155 is the diff*/
    setState(() {
      if (fillPercent.text.isNotEmpty &&
          double.parse(fillPercent.text) <= 105) {
        waveHeight = -1 * (260 - (155 * double.parse(fillPercent.text) / 100));
      }
    });
    return waveHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BioDiesel App'),
        actions: [
          LogoutButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              Animal(waveHeight),
              SizedBox(height: 10),
              UserInput(
                fillPercent,
                mapPercentToWaveHeight,
              ),
              SizedBox(height: 40),
              DeliveryButton(fillPercent),
            ],
          ),
        ),
      ),
    );
  }
}
