import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_state.dart';

const generalFailureMessage = "generalFailureMessage";
const serverFailureMessage = "serverFailureMessage";
const cacheFailureMessage = "cacheFailureMessage";
const networkFailureMessage = "networkFailureMessage";

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());

  final AdviceUsecases adviceUsecases = AdviceUsecases();
  //We can create instance of many use cases here

  void adviceRequested() async {
    String mapFailureMessage(Failure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          debugPrint("ServerFailure");
          return serverFailureMessage;
        case CacheFailure:
          debugPrint("CacheFailure");
          return cacheFailureMessage;
        default:
          debugPrint("default");
          return generalFailureMessage;
      }
    }

    emit(AdvicerStateLoading());
    //Here we can execute our business logic
    //for example get advice
    debugPrint('Fake get advice');

    debugPrint('got advice');
    final failureOrAdvice = await adviceUsecases.getAdvice();
    failureOrAdvice.fold(
        (failure) =>
            emit(AdvicerStateError(message: mapFailureMessage(failure))),
        (advice) => emit(AdvicerStateLoaded(advice: advice.advice)));
  }
}
