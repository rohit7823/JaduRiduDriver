enum SocketEvents {
  connectionStatus("connectionStatus"),
  afterConnection("afterConnection"),
  rideReq("rideReq"),
  triggerResponse("triggerRideResponse"),
  afterRideAccepted("afterRideAccepted");

  final String value;
  const SocketEvents(this.value);
}
