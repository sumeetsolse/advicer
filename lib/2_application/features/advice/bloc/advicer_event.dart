part of 'advicer_bloc.dart';

@immutable
sealed class AdvicerEvent {}

class AdviceRequestedEvent extends AdvicerEvent {
  // final String paraUsername;
  // AdviceRequestedEvent({required this.paraUsername});
}
