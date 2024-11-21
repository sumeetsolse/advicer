import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());

  final AdviceUsecases adviceUsecases = AdviceUsecases();
  //We can create instance of many use cases here

  void adviceRequested() async {
    emit(AdvicerStateLoading());
    //Here we can execute our business logic
    //for example get advice
    debugPrint('Fake get advice');

    debugPrint('got advice');
    final AdviceEntity adviceEntity = await adviceUsecases.getAdvice();
    emit(AdvicerStateLoaded(advice: adviceEntity.advice));
  }
}
