import 'package:flutter_lab_2/model/account.dart';

class AccountDirectory {
  final List<Account> _accounts = List<Account>.empty(growable: true);

  Account newAccount(String accountNumber, String bankName,
      String routingNumber, int balance) {
    Account newAccount =
        Account(accountNumber, bankName, routingNumber, balance);
    _accounts.add(newAccount);
    return newAccount;
  }

  List<Account> get accounts => _accounts.toList(growable: false);
}
