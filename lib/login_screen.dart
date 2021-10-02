import 'package:flutter/material.dart';

import 'sign_up_form.dart';
import 'logo.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Logo(),
          Text(
            'make the world a bit better',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return SignUpForm();
                },
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 14,
              ),
              child: Text(
                'SignUp Now!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('already have an account?'),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return SignUpForm();
                    },
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0)),
                    ),
                  );
                },
                child: Text('Sign in'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
