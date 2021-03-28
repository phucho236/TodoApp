
 import 'package:flutter/services.dart';
import 'dart:convert' as convert;
Future<dynamic> parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath).then(convert.jsonDecode);
  }