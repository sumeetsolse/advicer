import 'package:advicer/2_application/core/services/theme_service.dart';
import 'package:advicer/2_application/core/widgets/cust_wid_error_message.dart';
import 'package:advicer/2_application/features/advice/cubit/advicer_cubit.dart';
import 'package:advicer/2_application/features/advice/widgets/custom_button.dart';
import 'package:advicer/2_application/features/advice/widgets/wid_advice_field.dart';
import 'package:advicer/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdvicerCubit>(),
      child: const AdvicerPage(),
    );
  }
}

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(
        context); // It will reduce calling theme context multiple times

    return Scaffold(
      appBar: AppBar(
        title: Text('Advicer'),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(child:
                Center(child: BlocBuilder<AdvicerCubit, AdvicerCubitState>(
              builder: (context, state) {
                if (state is AdvicerInitial) {
                  return Text(
                    'Your Advice is waiting for you!',
                  );
                } else if (state is AdvicerStateLoading) {
                  return CircularProgressIndicator(
                    color: themeData.colorScheme.secondary,
                  );
                } else if (state is AdvicerStateLoaded) {
                  return WidAdviceField(
                    paraAdvice: state.advice,
                  );
                } else if (state is AdvicerStateError) {
                  return CustWidErrorMessage(
                    paraErrorMessage: state.message,
                  );
                }
                return const SizedBox();
              },
            ))),
            const SizedBox(height: 200, child: Center(child: CustomButton()))
          ],
        ),
      ),
    );
  }
}
