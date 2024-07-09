class Account {
  String _accountNumber;
  String _bankName;
  String _routingNumber;
  int _balance;

  Account(
      String accountNumber, String bankName, String routingNumber, int balance)
      : _accountNumber = accountNumber,
        _bankName = bankName,
        _routingNumber = routingNumber,
        _balance = balance;

  set accountNumber(String accountNumber) => _accountNumber = accountNumber;
  set bankName(String bankName) => _bankName = bankName;
  set routingNumber(String routingNumber) => _routingNumber = routingNumber;
  set balance(int balance) => _balance = balance;

  String get accountNumber => _accountNumber;
  String get bankName => _bankName;
  String get routingNumber => _routingNumber;
  int get balance => _balance;
}
