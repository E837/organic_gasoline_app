import 'package:flutter/material.dart';

import 'user_home_screen.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var emailInput = TextEditingController();
  var passwordInput = TextEditingController();
  bool isPasswordHidden = true;
  bool showError = false;

  bool get isFormFilled {
    return emailInput.text.isNotEmpty && passwordInput.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Email Address',
                errorText:
                    showError && emailInput.text.isEmpty ? 'required' : null,
                prefixIcon: Icon(Icons.email),
              ),
              controller: emailInput,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: isPasswordHidden,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Password',
                errorText:
                    showError && passwordInput.text.isEmpty ? 'required' : null,
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  }),
                  icon: isPasswordHidden
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
              controller: passwordInput,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => isFormFilled
                  ? Navigator.of(context).pushNamedAndRemoveUntil(
                      UserHomeScreen.routeName,
                      (Route<dynamic> route) => false,
                    )
                  : setState(() {
                      showError = true;
                    }),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 12,
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0))),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }
}
