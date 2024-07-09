import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final String title;
  final String content;
  final bool closeParent;

  const AlertWidget(
      {required this.title, required this.content, required this.closeParent});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (closeParent) Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
