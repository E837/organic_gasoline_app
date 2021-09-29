import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final Function submitData;

  SignUpForm(this.submitData);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var emailInput = TextEditingController();
  var passwordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Email Address',
            ),
            controller: emailInput,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            controller: passwordInput,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                widget.submitData(emailInput.text, passwordInput.text),
            child: Text('submit data'),
          )
        ],
      ),
    );
  }
}
