import 'package:faker/faker.dart';
import 'package:shibank/models/account.dart';
import 'package:shibank/models/credit_card.dart';

class User {
  final String name;
  final String email;
  final String phone;
  final Account account;
  final CreditCard creditCard;

  User({this.name, this.email, this.phone, this.account, this.creditCard});

  factory User.generateUser(String branch) {
    return User(
      name: Faker().person.name(),
      email: Faker().internet.email(),
      phone: '+55' + Faker().randomGenerator.numbers(9, 11).join(),
      account: Account.generateAccount(branch),
      creditCard: CreditCard.generateCreditCard()
    );
  }
}
