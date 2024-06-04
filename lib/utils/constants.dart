enum WeekDay {
  monday('Monday', DateTime.monday),
  tuesday('Tuesday', DateTime.tuesday),
  wednesday('Wednesday', DateTime.wednesday),
  thursday('Thursday', DateTime.thursday),
  friday('Friday', DateTime.friday),
  saturday('Saturday', DateTime.saturday),
  sunday('Sunday', DateTime.sunday);

  const WeekDay(this.label, this.number);

  final String label;
  final int number;
}
