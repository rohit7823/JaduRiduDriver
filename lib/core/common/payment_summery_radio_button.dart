enum  DriverTransactionPaymentSummeryType{
  online("Online"),
  cash("Cash"),
  none('none');

  final String name;
  const DriverTransactionPaymentSummeryType(
      this.name
      );
}