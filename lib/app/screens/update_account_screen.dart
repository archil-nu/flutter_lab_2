import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lab_2/app/components/app_bar_styled.dart';
import 'package:provider/provider.dart';

import 'package:flutter_lab_2/app/components/alert_widget.dart';

import 'package:flutter_lab_2/app/main_app.dart';

class UpdateAccountScreen extends StatefulWidget {
  final int selectedIndex;
  UpdateAccountScreen(this.selectedIndex);

  @override
  State<UpdateAccountScreen> createState() => _UpdateAccountScreenStateful();
}

class _UpdateAccountScreenStateful extends State<UpdateAccountScreen> {
  String accountNumber = '';
  String bankName = '';
  String routingNumber = '';
  String balance = '';

  bool viewMode = true;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();
    var selectedIndex = widget.selectedIndex;

    var currentAccount = appState.getAccount(selectedIndex);
    accountNumber = currentAccount?.accountNumber ?? '';
    bankName = currentAccount?.bankName ?? '';
    routingNumber = currentAccount?.routingNumber ?? '';
    balance = (currentAccount?.balance ?? '0').toString();

    void handleSave() async {
      appState.updateAccount(selectedIndex, accountNumber, bankName,
          routingNumber, int.tryParse(balance) ?? 0);

      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertWidget(
                title: 'Account Updated',
                content: 'Account saved successfully!',
                closeParent: true,
              ));
    }

    void handleUpdateMode() {
      setState(() {
        viewMode = !viewMode;
      });
    }

    var actionButtons = Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.list),
              onPressed: viewMode ? null : handleSave,
              label: Text('Save'),
            ),
            SizedBox(width: 10.0),
            ElevatedButton.icon(
              icon: Icon(Icons.delete),
              onPressed: (!viewMode) ? null : handleUpdateMode,
              label: Text('Update'),
            ),
          ],
        ));

    var formElements = Column(
      children: [
        TextFormField(
            initialValue: currentAccount?.accountNumber,
            decoration: InputDecoration(labelText: 'Account Number'),
            onChanged: (value) => accountNumber = value,
            readOnly: viewMode),
        SizedBox(height: 20.0),
        TextFormField(
            initialValue: currentAccount?.bankName,
            decoration: InputDecoration(labelText: 'Bank Name'),
            onChanged: (value) => bankName = value,
            readOnly: viewMode),
        SizedBox(height: 20.0),
        TextFormField(
            initialValue: currentAccount?.routingNumber,
            decoration: InputDecoration(labelText: 'Routing Number'),
            onChanged: (value) => routingNumber = value,
            readOnly: viewMode),
        SizedBox(height: 20.0),
        TextFormField(
            initialValue: currentAccount?.balance.toString(),
            decoration: InputDecoration(labelText: 'Balance'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => balance = value,
            readOnly: viewMode),
        SizedBox(height: 20.0),
        actionButtons,
      ],
    );

    return Scaffold(
        appBar: AppBarStyled('Bank account information'),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(width: 400.0),
            child: Padding(padding: EdgeInsets.all(40.0), child: formElements),
          ),
        ));
  }
}
