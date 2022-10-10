enum SocketStatus {
  connected("STATUS_CONNECTED"),
  reConnect("STATUS_RECONNECTED"),
  disconnected("STATUS_DISCONNECTED"),
  neutral("STATUS_NEUTRAL");

  final String value;
  const SocketStatus(this.value);
}
