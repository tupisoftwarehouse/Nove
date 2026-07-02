bool isTodaySaturday(DateTime currentTimeOfTheDay) {
  return currentTimeOfTheDay.weekday == DateTime.saturday;
}

bool isTodaySunday(DateTime currentTimeOfTheDay) {
  return currentTimeOfTheDay.weekday == DateTime.sunday;
}
