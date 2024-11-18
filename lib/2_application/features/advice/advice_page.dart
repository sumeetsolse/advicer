import 'package:advicer/2_application/core/services/theme_service.dart';
import 'package:advicer/2_application/core/widgets/cust_wid_error_message.dart';
import 'package:advicer/2_application/features/advice/bloc/advicer_bloc.dart';
import 'package:advicer/2_application/features/advice/widgets/custom_button.dart';
import 'package:advicer/2_application/features/advice/widgets/wid_advice_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerBloc(),
      child: AdvicerPage(),
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
          title: Text(
            'Advicer',
            style: themeData.textTheme.headlineLarge,
          ),
          centerTitle: true,
          actions: [
            Switch(
                value: Provider.of<ThemeService>(context).isDarkModeOn,
                onChanged: (_) {
                  return Provider.of<ThemeService>(context, listen: false)
                      .toggleTheme();
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Center(
                child: BlocBuilder<AdvicerBloc, AdvicerState>(
                  builder: (context, state) {
                    if (state is AdvicerInitial) {
                      return Text("AdvicerInitial");
                    } else if (state is AdvicerStateLoading) {
                      return CircularProgressIndicator();
                    } else if (state is AdvicerStateLoaded) {
                      return WidAdviceField(paraAdvice: state.advice);
                    }
                    return CustWidErrorMessage(
                        paraErrorMessage: 'Something went wrong');
                  },
                ),
              ),
              // Expanded(
              //   child: Center(
              //       child: WidAdviceField(paraAdvice: "Waiting for advice")),
              // ),
              SizedBox(
                height: 200,
                child: Center(
                  child: CustomButton(),
                ),
              ),
            ],
          ),
        ));
  }
}
