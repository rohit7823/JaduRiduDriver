enum DriverStatus {
  offDuty("OFF DUTY"),
  onDuty("ON DUTY"),
  goTo("GO TO");

  final String name;
  const DriverStatus(this.name);
}