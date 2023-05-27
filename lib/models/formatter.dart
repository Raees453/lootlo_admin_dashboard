import 'package:intl/intl.dart';

class Formatter {
  static String formatDate(DateTime dateTime) {
    return DateFormat.yMMMMEEEEd().format(dateTime);
  }
  
  static String formatAmount(int amount){
    return NumberFormat.compact().format(amount);
  }
}
