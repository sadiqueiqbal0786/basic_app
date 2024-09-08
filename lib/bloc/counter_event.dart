part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class IncrementEvent extends CounterEvent {
  final int num;
  IncrementEvent({required this.num});
}

class DecrementEvent extends CounterEvent {
  final int num;
  DecrementEvent({required this.num});
}
