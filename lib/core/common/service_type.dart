enum ServiceType {
  car("SERVICE_CAR"),
  bike("SERVICE_BIKE"),
  delivery("SERVICE_DELIVERY"),
  book("SERVICE_BOOK"),
  rental("SERVICE_RENTAL"),
  emergency("SERVICE_EMERGENCY"),
  scan("SERVICE_SCAN");

  final value;
  const ServiceType(this.value);
}
