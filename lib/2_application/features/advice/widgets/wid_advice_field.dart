import 'package:flutter/material.dart';

class WidAdviceField extends StatelessWidget {
  final String paraAdvice;
  const WidAdviceField({
    super.key,
    required this.paraAdvice,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(
        context); // It will reduce calling theme context multiple times

    return Material(
      elevation: 40,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Text(
            paraAdvice,
            style: themeData.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
