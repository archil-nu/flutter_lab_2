import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:flutter_lab_2/model/account.dart';

import 'package:flutter_lab_2/app/main_app.dart';
import 'package:flutter_lab_2/app/components/app_bar_styled.dart';
import 'package:flutter_lab_2/app/screens/update_account_screen.dart';

class BankAccountsScreen extends StatefulWidget {
  @override
  State<BankAccountsScreen> createState() => _BankAccountsScreenStateful();
}

class _BankAccountsScreenStateful extends State<BankAccountsScreen> {
  int selectedRow = -1;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MainAppState>();

    final NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'en_US', symbol: '\$');

    void handleViewDetails() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  UpdateAccountScreen(selectedRow)));
    }

    void handleDelete() {
      appState.deleteAccount(selectedRow);
      selectedRow = -1;
    }

    List<Account> accounts = appState.accountDirectory.accounts;

    var columns = [
      DataColumn(label: Text('Account Number')),
      DataColumn(label: Text('Bank Name')),
      DataColumn(label: Text('Routing Number')),
      DataColumn(label: Text('Balance')),
    ];

    var rows = List<DataRow>.generate(
        accounts.length,
        (int index) => DataRow(
            selected: selectedRow == index,
            cells: [
              DataCell(Text(accounts.elementAt(index).accountNumber)),
              DataCell(Text(accounts.elementAt(index).bankName)),
              DataCell(Text(accounts.elementAt(index).routingNumber)),
              DataCell(Container(
                  alignment: Alignment.centerRight,
                  child: Text(currencyFormat
                      .format(accounts.elementAt(index).balance)))),
            ],
            onSelectChanged: (selected) =>
                setState(() => selectedRow = (selected ?? false) ? index : -1)),
        growable: true);

    var dataTable = ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            child: DataTable(
              columns: columns,
              rows: rows,
              showCheckboxColumn: false,
              border: TableBorder.all(borderRadius: BorderRadius.circular(5.0)),
            )));

    var actionButtons = Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.list),
              onPressed: (selectedRow == -1) ? null : handleViewDetails,
              label: Text('View details'),
            ),
            SizedBox(width: 10.0),
            ElevatedButton.icon(
              icon: Icon(Icons.delete),
              onPressed: (selectedRow == -1) ? null : handleDelete,
              label: Text('Delete'),
            ),
          ],
        ));

    var spacer = SizedBox(height: 10.0);

    return Scaffold(
      appBar: AppBarStyled('List of Accounts'),
      body: Center(child: Column(children: [dataTable, spacer, actionButtons])),
    );
  }
}
