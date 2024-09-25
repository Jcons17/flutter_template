part of 'counter_bloc.dart';

sealed class CounterEvent {}

class IncrementCounter implements CounterEvent {}

class DecrementCounter implements CounterEvent {}
