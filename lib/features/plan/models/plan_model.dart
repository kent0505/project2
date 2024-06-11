class PlanModel {
  int id;
  String name;
  String departureTime;
  String arrivalTime;
  String from;
  String to;
  String date;
  String passenger;
  int price;

  PlanModel({
    required this.id,
    required this.name,
    required this.departureTime,
    required this.arrivalTime,
    required this.from,
    required this.to,
    required this.date,
    required this.passenger,
    required this.price,
  });
}
