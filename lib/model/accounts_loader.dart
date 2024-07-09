import 'package:flutter_lab_2/model/account_directory.dart';

class AccountsLoader {
  static AccountDirectory loadAccounts() {
    AccountDirectory accountDirectory = AccountDirectory();
    accountDirectory.newAccount(
        '123456789', 'Bank Of America', '021000322', 10000);
    accountDirectory.newAccount('987654321', 'Wells Fargo', '121000248', 8500);
    accountDirectory.newAccount('123789456', 'Chase Bank', '021000021', 15000);
    accountDirectory.newAccount('987321654', 'Citibank', '021000089', 12500);
    accountDirectory.newAccount('456123789', 'Santander', '091000022', 7200);

    return accountDirectory;
  }
}
