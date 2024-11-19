import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());

  void adviceRequested() async {
    emit(AdvicerStateLoading());
    //Here we can execute our business logic
    //for example get advice
    debugPrint('Fake get advice');
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('got advice');
    emit(AdvicerStateLoaded(advice: 'Fake Advice to test bloc'));
  }
}
