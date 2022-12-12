enum MonthKey {
  sortByMonth("NONE", "Sort By Month"),
  january("JAN_KEY", "January"),
  february("FEB_KEY", "February"),
  march("MARCH_KEY", "March"),
  april("APRIL_KEY", "April"),
  may("MAY_KEY", "May"),
  june("JUNE_KEY", "June"),
  july("JULY_KEY", "July"),
  august("AUG_KEY", "August"),
  september("SEP_KEY", "September"),
  october("OCT_KEY", "October"),
  november("NOV_KEY", "November"),
  december("DEC_KEY", "December");

  final String key;
  final String name;
  const MonthKey(this.key, this.name);
}
