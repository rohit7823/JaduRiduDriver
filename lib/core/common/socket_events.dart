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
  onRide("onRide"),
  dropNavigation("rideDropNavigation"),
  totalRideFare("totalRideFare"),
  completeRidePayment("completeRidePayment"),
  updateCurrentLocation("updateCurrentLocation"),
  afterPayment("afterPayment"),
  paymentAcceptanceControl("paymentAcceptanceControl");

  final String value;
  const SocketEvents(this.value);
}
