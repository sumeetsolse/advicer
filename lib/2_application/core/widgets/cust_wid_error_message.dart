import 'package:flutter/material.dart';

class CustWidErrorMessage extends StatelessWidget {
  final String paraErrorMessage;
  const CustWidErrorMessage({
    super.key,
    required this.paraErrorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(
        context); // It will reduce calling theme context multiple times

    return Column(
      children: <Widget>[
        Icon(
          Icons.error,
          size: 50,
          color: themeData.colorScheme.error,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          paraErrorMessage,
          style: themeData.textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
