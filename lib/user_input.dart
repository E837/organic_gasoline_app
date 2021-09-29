import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  final TextEditingController fillPercent;
  final Function mapPercentToWaveHeight;

  UserInput(this.fillPercent, this.mapPercentToWaveHeight);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: TextField(
        onChanged: (_) => widget.mapPercentToWaveHeight(),
        maxLength: 2,
        controller: widget.fillPercent,
        decoration: InputDecoration(
          labelText: 'fill percentage',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
