import 'package:flutter/material.dart';
import 'package:flutter_lab_2/model/account_directory.dart';
import 'package:flutter_lab_2/model/accounts_loader.dart';
import 'package:provider/provider.dart';

import 'package:flutter_lab_2/app/screens/navigation_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MainAppState(),
        child: MaterialApp(
          title: "Lab 2",
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
          home: NavigationScreen(),
        ));
  }
}

class MainAppState extends ChangeNotifier {
  AccountDirectory accountDirectory = AccountsLoader.loadAccounts();

  void newAccount(String accountNumber) {
    accountDirectory.newAccount(accountNumber, "", "", 0);
    notifyListeners();
  }
}
