// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> showDestinationDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Gitmek İstediğiniz Yeri Seçin'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Sayfa 1'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(
                    context, '/sayfa1'); // Sayfa 1'e yönlendirir
              },
            ),
            ListTile(
              title: Text('Sayfa 2'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(
                    context, '/sayfa2'); // Sayfa 2'ye yönlendirir
              },
            ),
          ],
        ),
      );
    },
  );
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
