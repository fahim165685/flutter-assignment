import 'package:intl/intl.dart';

class DateConverter {
  DateConverter._();

  static String formatterDate(DateTime date) {
    return DateFormat.d('bn').format(date);
  }

  static String getCurrentDateInBengali() {
    final now = DateTime.now();
    final formatter = DateFormat.MMMMd('bn');
     return formatter.format(now);
  }

  static String formatDay(DateTime date) {
    final value =  DateFormat.E('bn').format(date);

    if(value == "বৃহস্পতি"){
      return "বৃহঃ";
    }else{
      return value;
    }
  }

  static DateTime? convertTimeStampToDateTime(String? time,) {
    int? timestamp = int.tryParse(time??'');
    if(timestamp == null) return null;

    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  static String? formatTimeStamp(String? time,{bool showAMPM = true}) {

    DateTime? dateTime = convertTimeStampToDateTime(time);

    if(dateTime == null) return null;

    String formattedTime = DateFormat('a h:mm',"bn").format(dateTime);

    if(showAMPM){
      formattedTime = formattedTime.replaceAll('AM', 'সকাল\n').replaceAll('PM', 'দুপুর\n');
    }else{
      formattedTime = formattedTime.replaceAll('AM ', '').replaceAll('PM ', '');
    }
    return "$formattedTime মি.";
  }


}