import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
  return formattedDate;
}

String formatCurrentDateTime() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  return formattedDate;
}
