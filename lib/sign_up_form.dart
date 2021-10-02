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
  bool isPasswordHidden = true;

  bool get isFormFilled {
    if (emailInput.text.isNotEmpty && passwordInput.text.isNotEmpty) {
      return true;
    }
    return false;
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
                //TODO: IMPLEMENT REQUIRED TEXTFIELDS
                errorText: isFormFilled ? null : 'required',
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
              onPressed: () =>
                  widget.submitData(emailInput.text, passwordInput.text),
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
