import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool onboarding = true;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  onboarding = prefs.getBool('onboarding') ?? true;
  log('onboarding = $onboarding');
}

Future<void> saveBool(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String getCurrentTime() {
  DateTime now = DateTime.now();
  String formattedTime =
      "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
  return formattedTime;
}

String formatDateTime(DateTime dateTime) {
  String formattedTime =
      "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  return formattedTime;
}

DateTime parseTimeString(String timeString) {
  try {
    List<String> parts = timeString.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(now.year, now.month, now.day, hour, minute);
    return dateTime;
  } catch (e) {
    return DateTime.now();
  }
}

String formatDateForCard(String date) {
  DateFormat inputFormat = DateFormat("dd.MM.yyyy");
  DateTime dateTime = inputFormat.parse(date);
  DateFormat outputFormat = DateFormat("EEEE, dd MMMM yyyy");
  String formattedDate = outputFormat.format(dateTime);
  return formattedDate;
}
