// returns todays date as a yyyymmdd e.g. 20240504 (2024 / 5 / 4) (checked)
String todaysDateYYYYMMDD() {
  // today
  var dateTimeObject = DateTime.now();

  // year in the format of yyy
  String year = dateTimeObject.year.toString();

  // month in the format mm
  String month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  // day in the format dd
  String day = dateTimeObject.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  // final format yyyymmdd
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}

// convert string yyyymmdd to DateTime object (checked)
DateTime createDataTimeObject(String yyyymmdd) {
  int yyyy = int.parse(
      yyyymmdd.substring(0, 4)); // to take the first 4 charachters of the year
  int mm = int.parse(
      yyyymmdd.substring(4, 6)); // to take the two charachters of the month
  int dd = int.parse(
      yyyymmdd.substring(6, 8)); // to take the two charachters of the day

  DateTime dateTimeObject = DateTime(yyyy, mm, dd);
  return dateTimeObject;
}

// convert DateTime object to a string  yyyymmdd (chevked)
String convertDateTimeToYYYYMMDD(DateTime dateTime) {
  // year in the format yyyy
  String year = dateTime.year.toString();

  // month in the format mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  // day in the format dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  // final format yyyymmdd
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
