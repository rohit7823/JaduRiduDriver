enum RideInstruction {
  clientLocated("KEY_CLIENT_LOCATED"),
  startTrip("KEY_START_TRIP"),
  endTrip("KEY_END_TRIP");

  final String key;
  const RideInstruction(this.key);
}
