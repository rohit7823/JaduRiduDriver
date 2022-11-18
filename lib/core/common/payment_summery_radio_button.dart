enum  DriverTransactionPaymentSummeryType{
  online("online"),
  cash("cash"),
  none('none');

  final String name;
  const DriverTransactionPaymentSummeryType(
      this.name
      );
}