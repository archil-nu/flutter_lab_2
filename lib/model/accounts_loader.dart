import 'package:flutter_lab_2/model/account_directory.dart';

class AccountsLoader {
  static AccountDirectory loadAccounts() {
    AccountDirectory accountDirectory = AccountDirectory();
    accountDirectory.newAccount(
        '001002003', 'Bank Of America', '02022345', 1000);
    accountDirectory.newAccount('1012233003', 'Chase', '11223311', 2000);
    accountDirectory.newAccount(
        '001002003', 'Cambridge Savings Bank', '02022345', 100000);
    accountDirectory.newAccount('001002003', 'CitiBank', '02022345', 1000);
    accountDirectory.newAccount('001002003', 'Santander', '02022345', 1000);

    return accountDirectory;
  }
}
