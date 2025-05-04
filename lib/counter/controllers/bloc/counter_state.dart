part of 'counter_bloc.dart';

sealed class CounterState {
  final int count;
  const CounterState(this.count);
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

final class CounterUpdate extends CounterState {
  const CounterUpdate(super.count);
}
