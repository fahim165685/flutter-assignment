import 'package:intl/intl.dart';

class DateConverter {
  DateConverter._();

  static String? formatDate(String? date) {
    if (date == null) return null;
    DateTime? value = DateTime.tryParse(date);
    if (value == null) return null;
    final DateFormat formatter = DateFormat('dd MMM, yyyy');
    return formatter.format(value);
  }

}