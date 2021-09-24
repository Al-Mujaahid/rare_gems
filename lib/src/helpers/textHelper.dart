
import 'package:rare_gem/utils/constants/constants.dart';

bool isNull(val) {
  return ['', null].contains(val);
}

bool lengthEquals(val, eq) {
  return val.toString().length == eq;
}

DateTime convertStringToDate (String dateTime) {
  List dateNTime = dateTime.split('at');
  List date = dateNTime.first.toString().replaceAll(',', '').split(' ');
  List time = dateNTime[1].toString().replaceAll(':', ' ').split(' ');
  // print(date);
  // print(time);

  int hour = int.tryParse(time.first) ?? 0;
  int min = int.tryParse(time[1]) ?? 0;

  int day = int.tryParse(date[1]) ?? 0;
  int month = int.tryParse(months[date.first].toString()) ?? 0;
  int year = int.tryParse(date[2]) ?? 0;

  if (time[3] == 'PM') {
    hour += 12;
  }


  return DateTime(year, month, day, hour, min);
}

String ucFirst(String val) {
  String firstCharacter = val[0];

  return val.replaceFirst(firstCharacter, firstCharacter.toUpperCase());
}