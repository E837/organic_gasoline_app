import 'package:flutter/material.dart';

import 'logo.dart';
import 'animal.dart';
import 'user_input.dart';
import 'delivery_button.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final fillPercent = TextEditingController();
  double waveHeight = -240;

  double mapPercentToWaveHeight() {
    setState(() {
      if (fillPercent.text.isNotEmpty &&
          double.parse(fillPercent.text) <= 100) {
        waveHeight = -1 * (240 - (140 * double.parse(fillPercent.text) / 100));
      }
    });
    return waveHeight;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
