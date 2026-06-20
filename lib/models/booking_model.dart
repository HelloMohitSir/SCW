class Booking {
  final String id;
  final String serviceName;
  final DateTime dateTime;
  final double price;
  final String status;

  Booking({
    required this.id,
    required this.serviceName,
    required this.dateTime,
    required this.price,
    this.status = 'Pending',
  });
}