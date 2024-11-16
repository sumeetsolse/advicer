import 'package:advicer/2_application/core/services/theme_service.dart';
import 'package:advicer/2_application/core/widgets/cust_wid_error_message.dart';
import 'package:advicer/2_application/features/advice/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                child: CustWidErrorMessage(
                    paraErrorMessage: 'Something went wrong'),
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
