import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    // on<AdviceRequestedEvent>((event, emit) {
    //   event.paraUsername;
    // });
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      //Here we can execute our business logic
      //for example get advice
      debugPrint('Fake get advice');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('got advice');
      emit(AdvicerStateLoaded(advice: 'Fake Advice to test bloc'));
    });
  }
}
