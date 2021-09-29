import 'package:flutter/material.dart';

class AmountInput extends StatelessWidget {
  final TextEditingController fillPercent;

  AmountInput(this.fillPercent);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: TextField(
        controller: fillPercent,
        decoration: InputDecoration(
          labelText: 'fill percentage',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
