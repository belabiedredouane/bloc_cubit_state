import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() {
    emit(CounterUpdate(state.count + 1));
  }

  void decrement() {
    emit(CounterUpdate(state.count - 1));
  }
}
