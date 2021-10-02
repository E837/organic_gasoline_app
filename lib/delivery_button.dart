import 'package:flutter/material.dart';

import 'custom_alert.dart';

class DeliveryButton extends StatelessWidget {
  final TextEditingController fillPercent;

  Widget createAlertDialog() {
    if (fillPercent.text.isNotEmpty) {
      try {
        return int.parse(fillPercent.text) >= 75
            ? CustomAlertDialog(
                title: 'OK!',
                content: 'we will come right on your door',
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

  DeliveryButton(this.fillPercent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 140,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => createAlertDialog(),
                );
              },
              child: Icon(
                //why mode_of_travel_outlined not supported?
                Icons.travel_explore,
                size: 40,
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
        Text(
          'Tap this button\nwhen your bottle gets full',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
