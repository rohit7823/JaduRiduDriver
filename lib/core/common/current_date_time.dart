import 'package:intl/intl.dart';

class GetDateState {
  GetDateState._();

  String currentDate = '';

  static String getCurrentDate() {
    var today = DateTime.now();
    var dateFormat = DateFormat('${today.day}-${today.month}-${today.year}');
    String dats = dateFormat.format(today);
    return dats;
  }
}
