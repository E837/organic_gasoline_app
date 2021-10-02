import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Logout?'),
          content: Text('You are logging out, Confirm?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                '/',
                (Route<dynamic> route) => false,
              ),
            ),
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      icon: Icon(Icons.logout),
    );
  }
}
