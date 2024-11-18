import 'package:advicer/2_application/features/advice/bloc/advicer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(
        context); // It will reduce calling theme context multiple times
    return InkResponse(
      onTap: () =>
          BlocProvider.of<AdvicerBloc>(context).add(AdviceRequestedEvent()),
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: themeData.colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10,
          ),
          child: Center(
            child: Text(
              'Get Advice',
              style: themeData.textTheme.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }
}
