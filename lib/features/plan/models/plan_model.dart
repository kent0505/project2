import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class PlanModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String departureTime;

  @HiveField(3)
  String arrivalTime;

  @HiveField(4)
  String from;

  @HiveField(5)
  String to;

  @HiveField(6)
  String date;

  @HiveField(7)
  int passenger;

  @HiveField(8)
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

class PlanAdapter extends TypeAdapter<PlanModel> {
  @override
  final typeId = 0;

  @override
  PlanModel read(BinaryReader reader) {
    return PlanModel(
      id: reader.read(),
      name: reader.read(),
      departureTime: reader.read(),
      arrivalTime: reader.read(),
      from: reader.read(),
      to: reader.read(),
      date: reader.read(),
      passenger: reader.read(),
      price: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, PlanModel obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.departureTime);
    writer.write(obj.arrivalTime);
    writer.write(obj.from);
    writer.write(obj.to);
    writer.write(obj.date);
    writer.write(obj.passenger);
    writer.write(obj.price);
  }
}
