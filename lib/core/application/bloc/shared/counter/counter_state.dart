part of 'counter_bloc.dart';

@freezed
class CounterState with _$CounterState {
  const CounterState._();

  const factory CounterState({
    required int counter,
  }) = _CounterState;

  factory CounterState.initial() => CounterState(counter: 0);
}
