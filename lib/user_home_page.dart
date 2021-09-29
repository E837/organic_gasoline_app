import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final fillPercent = TextEditingController();

  Widget get createAlertDialog {
    if (fillPercent.text.isNotEmpty) {
      try {
        return int.parse(fillPercent.text) >= 75
            ? AlertDialog(
                title: Text('OK!'),
                content: Text('we will be right on your door'),
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              )
            : AlertDialog(
                title: Text('Oops!'),
                content: Text('hey, your fill percent is below 75%'),
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              );
      } on FormatException {
        return AlertDialog(
          title: Text('Wrong Value!'),
          content:
              Text('hey, you have entered a wrong value for fill percentage.'),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
      }
    } else {
      return AlertDialog(
        title: Text('Data needed'),
        content: Text('you have not entered the fill percentage yet'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
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
            Stack(
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
            ),
            Container(
              width: 140,
              child: TextField(
                controller: fillPercent,
                decoration: InputDecoration(
                  labelText: 'fill percentage',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 140,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => createAlertDialog,
                    );
                  },
                  child: Icon(
                    Icons.delivery_dining,
                    size: 40,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Tap this button\nwhen your bottle gets full',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
