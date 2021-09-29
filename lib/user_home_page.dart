import 'package:flutter/material.dart';

import 'logo.dart';
import 'animal.dart';
import 'custom_alert.dart';
import 'amount_input.dart';
import 'delivery_button.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final fillPercent = TextEditingController();

  Widget get createAlertDialog {
    //TODO: SET A CONDITION TO PREVENT NUMBERS BIGGER THAN 100
    if (fillPercent.text.isNotEmpty) {
      try {
        return int.parse(fillPercent.text) >= 75
            ? CustomAlertDialog(
                title: 'OK!',
                content: 'we will be right on your door',
              )
            : CustomAlertDialog(
                title: 'Oops!',
                content: 'hey, your fill percent is below 75%',
              );
      } on FormatException {
        return CustomAlertDialog(
          title: 'Wrong Value!',
          content: 'hey, you have entered a wrong value for fill percentage.',
        );
      }
    } else {
      return CustomAlertDialog(
        title: 'Data needed',
        content: 'you have not entered the fill percentage yet',
      );
    }
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
            Animal(),
            SizedBox(height: 10),
            AmountInput(fillPercent),
            SizedBox(height: 40),
            DeliveryButton(createAlertDialog),
          ],
        ),
      ),
    );
  }
}
