enum TransactionType {
  received("Received"),
  paid("Paid");

  final String value;

  const TransactionType(this.value);
}
