import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrement>(increment);
    on<CounterDecrement>(decrement);
  }

  FutureOr<void> decrement(event, emit) {
    emit(CounterUpdate(state.count - 1));
  }

  FutureOr<void> increment(event, emit) {
    emit(CounterUpdate(state.count + 1));
  }
}
