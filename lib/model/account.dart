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

  set bankName(String bankName) => _bankName = bankName;

  String get accountNumber => _accountNumber;
  String get bankName => _bankName;
  String get routingNumber => _routingNumber;
  int get balance => _balance;
}
