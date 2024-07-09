import 'package:flutter/material.dart';

class AppBarStyled extends StatelessWidget implements PreferredSizeWidget {
  final String customTitle;

  AppBarStyled(this.customTitle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(customTitle),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        iconSize: 20,
        visualDensity: VisualDensity.compact,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
