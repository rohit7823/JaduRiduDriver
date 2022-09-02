enum DetailsStepKey {
  identifyDetails("KEY_IDENTIFY_DETAILS"),
  profilePicture("KEY_PROFILE_PICTURE"),
  driverLicense("KEY_DRIVER_LICENSE"),
  aadharCard("KEY_AADHAR_CARD"),
  vehicleInsurance("KEY_VEHICLE_INSURANCE"),
  registrationCertificate("KEY_REGISTRATION_CERTIFICATE"),
  panCard("KEY_PAN_CARD"),
  vehiclePermit("KEY_VEHICLE_PERMIT"),
  vehicleAudit("KEY_VEHICLE_AUDIT"),
  vehiclePollution("KEY_VEHICLE_POLLUTION"),
  paymentDetails("KEY_PAYMENT_DETAILS");

  final String key;
  const DetailsStepKey(this.key);
}
