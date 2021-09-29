import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final Widget createAlertDialog;

  DeliveryButton(this.createAlertDialog);

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
                  builder: (_) => createAlertDialog,
                );
              },
              child: Icon(
                Icons.delivery_dining,
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
