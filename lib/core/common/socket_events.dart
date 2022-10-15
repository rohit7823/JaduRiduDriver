enum SocketEvents {
  connectionStatus("connectionStatus"),
  afterConnection("afterConnection"),
  rideReq("rideReq"),
  triggerResponse("triggerRideResponse"),
  rideNavigation("rideNavigation"),
  afterRideAccepted("afterRideAccepted"),
  rideCanceled("rideCancelled"),
  updateCurrentLocation("updateCurrentLocation");

  final String value;
  const SocketEvents(this.value);
}
