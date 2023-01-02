enum SocketEvents {
  connectionStatus("connectionStatus"),
  afterConnection("afterConnection"),
  initiateRide("initialiseRide"),
  initialiseEmergencyRideDriver("initialiseEmergencyRideDriver"),
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
  onRideNavigationCreate("onRideNavigationCreate"),
  totalRideFareEmergency("totalRideFareEmergency"),
  onClientLocatedCreated("onClientLocatedCreated"),
  onEndTripCreated("onEndTripCreated"),
  paymentAcceptanceControl("paymentAcceptanceControl");

  final String value;
  const SocketEvents(this.value);
}
