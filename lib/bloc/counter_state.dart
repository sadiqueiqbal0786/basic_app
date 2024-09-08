part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterLoadingState extends CounterState {}

final class CounterEventState extends CounterState {
  final int count;
  CounterEventState(this.count);
}
