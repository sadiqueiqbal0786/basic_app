import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) async {
      emit(CounterLoadingState());
      await Future.delayed(
        const Duration(seconds: 2),
      );
      int num = event.num + 1;
      emit(CounterEventState(num));
    });
    on<DecrementEvent>(_onDecrement);
  }

  FutureOr<void> _onDecrement(
      DecrementEvent event, Emitter<CounterState> emit) async {
    emit(CounterLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    int num = event.num - 1;
    emit(CounterEventState(num));
  }
}
