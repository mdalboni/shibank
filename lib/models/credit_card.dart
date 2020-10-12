import 'package:faker/faker.dart';
import 'package:shibank/models/charge.dart';

class CreditCard {
  final double max;
  final double used;
  final double usedMonth;
  final List<Charge> charges;

  CreditCard({this.max, this.used, this.usedMonth, this.charges});

  factory CreditCard.generateCreditCard() {
    List<Charge> charges = [];
    for (int i = 0; i < Faker().randomGenerator.integer(20,min: 10); i++) {
      charges.add(Charge.generateCharge());
    }
    return CreditCard(
      max: randInt() + randDecimal(),
      used: randInt(max: 1500, min: 700) + randDecimal(),
      usedMonth: randInt(max: 500, min: 200) + randDecimal(),
      charges: charges,
    );
  }

  static double randDecimal() => Faker().randomGenerator.decimal();

  static int randInt({max = 3000, min = 2000}) =>
      Faker().randomGenerator.integer(max, min: min);

  get remaining => max - used;

  @override
  String toString() {
    return 'Credit Card: [Used: ${used.toStringAsFixed(2)}] '
        '[Month: ${usedMonth.toStringAsFixed(2)}] '
        '[Max: ${max.toStringAsFixed(2)}]';
  }
}
