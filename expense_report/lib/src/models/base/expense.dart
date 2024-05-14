abstract interface class Service {
  final int amount;

  String get name;

  const Service({
    required this.amount,
  });
}
