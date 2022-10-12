enum RideStages {
  pickUp("STAGE_PICKUP", "Pick-Up"),
  waiting("STAGE_WAITING", "Waiting"),
  ongoing("STAGE_ONGOING", "Ongoing"),
  completed("STAGE_COMPLETED", "Completed"),
  none("STATE_NONE", "");

  final String key;
  final String name;
  const RideStages(this.key, this.name);
}
