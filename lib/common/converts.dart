import 'package:intl/intl.dart';

class Converts {
  String convertDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    String formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }
}
