import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<List<dynamic>> getCachedData() async {
  final prefs = await SharedPreferences.getInstance();
  final String? encodedData = prefs.getString('cached_posts');
  return encodedData != null ? jsonDecode(encodedData) : [];
}

Future<void> setCachedData(List<dynamic> data) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('cached_posts', jsonEncode(data));
}
