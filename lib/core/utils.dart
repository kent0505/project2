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
  return DateFormat('hh:mm a').format(DateTime.now());
}

String getCurrentDate() {
  return DateFormat('dd/MM/yyyy').format(DateTime.now());
}

String formatTime(DateTime dateTime) {
  return DateFormat('hh:mm a').format(dateTime);
}

String formatDate(DateTime dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime);
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
  try {
    DateFormat inputFormat = DateFormat('dd.MM.yyyy');
    DateTime dateTime = inputFormat.parse(date);
    DateFormat outputFormat = DateFormat('EEEE, dd MMMM yyyy');
    String formattedDate = outputFormat.format(dateTime);
    return formattedDate;
  } catch (e) {
    return 'Saturday, 22 June 2024';
  }
}

DateTime parseDate(String date) {
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  DateTime dateTime = dateFormat.parse(date);
  return dateTime;
}
