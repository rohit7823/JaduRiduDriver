enum Months {
  jan("January"),
  feb("February"),
  march("March"),
  april("April"),
  may("May"),
  june("June"),
  july("July"),
  aug("August"),
  sep("September"),
  oct("October"),
  nov("November"),
  dec("December");

  final String value;
  const Months(this.value);
}

enum WeekDays {
  sunday("Sunday"),
  monday("Monday"),
  tuesday("Tuesday"),
  wednesday("Wednesday"),
  thursday("Thursday"),
  friday("Friday"),
  saturday("Saturday");

  final String value;
  const WeekDays(this.value);
}

abstract class MyDateTime {
  List<Months> allMonths = Months.values;
  List<WeekDays> allDays = WeekDays.values;

  String getMonthName(int month);
  String getWeekDayName(int day);
}
