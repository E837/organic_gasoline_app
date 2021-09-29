import 'package:flutter/material.dart';

class Animal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.amber[100],
            borderRadius: BorderRadius.circular(140),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(140),
            child: Image.asset(
              'assets/images/sample_wave.png',
            ),
          ),
        ),
        Container(
          child: Image.asset(
            'assets/images/dog.png',
            fit: BoxFit.scaleDown,
          ),
          width: 140,
        ),
      ],
    );
  }
}
