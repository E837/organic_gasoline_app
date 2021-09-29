import 'dart:async';

import 'package:flutter/material.dart';

class Animal extends StatefulWidget {
  final double waveHeight;

  Animal(this.waveHeight);

  @override
  _AnimalState createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  double wavePosition = -280;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        if (wavePosition < -100) {
          wavePosition += 280;
        } else {
          wavePosition = -280;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // ctrl+z indicator
        Container(
          width: 200,
          height: 200,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.amber[100],
            borderRadius: BorderRadius.circular(140),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(140),
            child: Stack(
              children: [
                AnimatedPositioned(
                  curve: Curves.easeOut,
                  // -100 for 100 percent
                  // -240 for 0 percent
                  bottom: widget.waveHeight,
                  duration: Duration(seconds: 5),
                  right: wavePosition,
                  child: Container(
                    width: 460,
                    height: 460,
                    child: Image.asset(
                      'assets/images/sample_wave.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
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
