import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class SignUp extends StatelessWidget {
  final Function isDataSubmitted;

  SignUp(this.isDataSubmitted);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
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
        Text('make the world a bit better'),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return SignUpForm(isDataSubmitted);
                });
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'SignUp Now!',
              style: TextStyle(fontSize: 24),
            ),
          ),
        )
      ],
    );
  }
}
