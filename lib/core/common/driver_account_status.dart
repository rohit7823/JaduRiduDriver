enum DriverAccountStatus {
  accountUnknown("ACCOUNT_UNKNOWN"),
  accountNotFound("ACCOUNT_NOT_FOUND"),
  accountFound("ACCOUNT_FOUND"),
  none("");

  final String status;
  const DriverAccountStatus(this.status);
}
