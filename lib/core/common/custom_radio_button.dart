enum  DriverTransactionType{
 received("Received"),
 paid("Paid"),
 none('none');

  final String name;
  const DriverTransactionType(
      this.name
      );
}