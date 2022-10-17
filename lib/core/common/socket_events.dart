enum SocketEvents {
  connectionStatus("connectionStatus"),
  afterConnection("afterConnection"),
  rideReq("rideReq"),
  triggerResponse("triggerRideResponse"),
  rideNavigation("rideNavigation"),
  afterRideAccepted("afterRideAccepted"),
  rideCanceled("rideCancelled"),
  clientLocated("clientLocated"),
  verifyOtp("verifyOtp"),
  isOtpVerified("isOtpVerified"),
  updateCurrentLocation("updateCurrentLocation");

  final String value;
  const SocketEvents(this.value);
}
