import 'package:intl/intl.dart';

final dateFormat1 = DateFormat('yyyy-MM-dd');

DateTime dateParseEpochToDateTime(int epochTime) {
  return DateTime.parse(
      dateFormat1.format(DateTime.fromMillisecondsSinceEpoch(epochTime)));
}

String getCurrentDateTime() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}
