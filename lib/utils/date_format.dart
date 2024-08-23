import 'package:intl/intl.dart';

String dateFormat(DateTime sateTime) {
  return DateFormat('d MMM, yyy').format(sateTime);
}
