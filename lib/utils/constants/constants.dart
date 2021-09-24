import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

const APP_NAME = "Rare Gem";
const CURRENCY_SYMBOL = "₦";

//Money Format
final moneyFormat = new NumberFormat("#,##0.00", "en_US");
final goldFormat = new NumberFormat("###0", "en_US");

// Hive Box
const USER_BOX = 'USER_BOX';
const USER_KEY = 'USER_KEY';
const TOKEN_KEY = 'TOKEN_KEY';
const USER_LOGGED_IN_KEY = 'USER_LOGGED_IN_KEY';
const IS_FIRST_TIME_KEY = 'IS_FIRST_TIME_KEY';

//Months
const months = {
  'Dec': 0,
  'Jan': 1,
  'Feb': 2,
  'Mar': 3,
  'Apr': 4,
  'May': 5,
  'Jun': 6,
  'Jul': 7,
  'Aug': 8,
  'Sept': 9,
  'Oct': 10,
  'Nov': 11,
};
