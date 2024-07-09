import 'package:flutter/material.dart';
import 'package:flutter_lab_2/app/screens/bank_accounts_screen.dart';
import 'package:flutter_lab_2/app/screens/create_account_screen.dart';
import 'package:flutter_lab_2/app/screens/not_implemented_screen.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var workArea = Expanded(child: Center(child: Text('Welcome to Lab 2')));

    var navigation = NavigationRail(
      extended: true,
      destinations: [
        NavigationRailDestination(
            icon: Icon(Icons.monetization_on), label: Text('Accounts')),
        NavigationRailDestination(icon: Icon(Icons.add), label: Text('Create'))
      ],
      selectedIndex: null,
      onDestinationSelected: (newIndex) {
        switch (newIndex) {
          case 0:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => BankAccountsScreen()));
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CreateAccountScreen()));
          default:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NotImplementedScreen()));
        }
      },
      backgroundColor: colorScheme.surfaceContainerHigh,
    );

    return Scaffold(body: Row(children: [navigation, workArea]));
  }
}
