// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future selected() async {
  // Panodan URL'yi al
  ClipboardData? imageUrl = await Clipboard.getData('text/plain');

  // Eğer URL varsa, state'e güncelleme yap
  if (imageUrl != null && imageUrl.text != null) {
    // FlutterFlow'da Page State'i güncellemek için updatePageState kullanmalısınız.
    updatePageState('selectedWallpaper', imageUrl.text);
  }
}

void updatePageState(String s, String? text) {}