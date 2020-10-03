import 'package:faker/faker.dart';

class Account {
  final String branch;
  final String account;
  final double balance;

  Account({this.branch, this.account, this.balance});

  String get balanceAmount => 'R\$${balance.toStringAsFixed(2)}';

  factory Account.generateAccount(String branch) {
    return Account(
      branch: branch,
      account: Faker().randomGenerator.numbers(9, 5).join(),
      balance: Faker().randomGenerator.decimal(),
    );
  }
}
