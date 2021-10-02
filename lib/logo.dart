import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            'BioDiesel',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'magneto',
              fontSize: 50,
              color: Colors.grey[800],
            ),
          ),
        ),
      ),
    );
  }
}
