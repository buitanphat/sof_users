import 'package:intl/intl.dart';

class TimeUtils {
  static convert12Hour(int timeStamp) {
    var dt = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return DateFormat('MM/dd/yyyy, hh:mm a').format(dt).toString();
  }
}
