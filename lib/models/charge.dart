import 'package:faker/faker.dart';
import 'package:shibank/utils/numeric.dart';

class Charge {
  final String date;
  final String tag;
  final double value;
  final bool paid;

  Charge({this.date, this.tag, this.value, this.paid = false});

  factory Charge.generateCharge() {
    return Charge(
        date: generateDate(),
        tag: Faker().food.dish(),
        value: generateValue(),
        paid: Faker().randomGenerator.boolean());
  }

  get usableValue => value.toPrecision(2);

  String toString() {
    return "[$date] [$tag] [$value]";
  }

  static generateDate() {
    DateTime now = new DateTime.now();
    final day = Faker().randomGenerator.integer(now.day, min: 1);
    return '$day-${now.month}-${now.year}';
  }

  static generateValue({max = 150, min = 0}) {
    final decimal = Faker().randomGenerator.decimal();
    final value = Faker().randomGenerator.integer(max, min: min);
    return (value + decimal).toPrecision(2);
  }
}
