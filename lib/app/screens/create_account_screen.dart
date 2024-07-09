import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lab_2/app/components/app_bar_styled.dart';
import 'package:provider/provider.dart';

import 'package:flutter_lab_2/app/components/alert_widget.dart';

import 'package:flutter_lab_2/app/main_app.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenStateful();
}

class _CreateAccountScreenStateful extends State<CreateAccountScreen> {
  String accountNumber = '';
  String bankName = '';
  String routingNumber = '';
  String balance = '';

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();

    void onSaveHandler() async {
      appState.newAccount(
          accountNumber, bankName, routingNumber, int.tryParse(balance) ?? 0);

      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertWidget(
                title: 'New Account',
                content: 'Account created successfully!',
                closeParent: true,
              ));
    }

    var formElements = Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Account Number'),
          onChanged: (value) => accountNumber = value,
        ),
        SizedBox(height: 20.0),
        TextFormField(
            decoration: InputDecoration(labelText: 'Bank Name'),
            onChanged: (value) => bankName = value),
        SizedBox(height: 20.0),
        TextFormField(
            decoration: InputDecoration(labelText: 'Routing Number'),
            onChanged: (value) => routingNumber = value),
        SizedBox(height: 20.0),
        TextFormField(
            decoration: InputDecoration(labelText: 'Balance'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => balance = value),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed:
              onSaveHandler, // Function to call when the button is pressed
          child: Text('Save'), // Text on the button
        ),
      ],
    );

    return Scaffold(
        appBar: AppBarStyled('Create a bank account'),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(width: 300.0),
            child: Padding(padding: EdgeInsets.all(40.0), child: formElements),
          ),
        ));
  }
}
