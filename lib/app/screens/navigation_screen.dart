import 'package:flutter/material.dart';
import 'package:flutter_lab_2/app/screens/bank_accounts_panel.dart';
import 'package:flutter_lab_2/app/screens/not_implemented_panel.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationScreenStateful();
}

class _NavigationScreenStateful extends State<NavigationScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var navigation = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      print(constraints);
      return NavigationRail(
        extended: false,
        destinations: [
          NavigationRailDestination(
              icon: Icon(Icons.home), label: Text('Home')),
          NavigationRailDestination(
              icon: Icon(Icons.create), label: Text('Create'))
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (newIndex) => setState(() {
          selectedIndex = newIndex;
        }),
        backgroundColor: colorScheme.surfaceContainerHigh,
      );
    });

    Widget workArea;

    switch (selectedIndex) {
      case 0:
        workArea = BankAccountsPanel();
      default:
        workArea = NotImplementedPanel();
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [navigation, workArea]);
  }
}
