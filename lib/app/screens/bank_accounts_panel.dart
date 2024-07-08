import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_lab_2/model/account.dart';
import 'package:flutter_lab_2/app/main_app.dart';

class BankAccountsPanel extends StatefulWidget {
  @override
  State<BankAccountsPanel> createState() => _BankAccountsPanelStateful();
}

class _BankAccountsPanelStateful extends State<BankAccountsPanel> {
  int selectedRow = -1;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MainAppState>();
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
              DataCell(Text(accounts.elementAt(index).balance.toString())),
            ],
            onSelectChanged: (selected) =>
                setState(() => selectedRow = (selected ?? false) ? index : -1)),
        growable: true);

    var dataTable = DataTable(
      columns: columns,
      rows: rows,
      showCheckboxColumn: false,
      border: TableBorder.all(borderRadius: BorderRadius.circular(5.0)),
    );

    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List of accounts'),
        ),
        body: Center(child: Column(children: [dataTable])),
      ),
    );
  }
}
