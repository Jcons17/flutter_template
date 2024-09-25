import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterEvent>((event, emit) {
      switch (event) {
        case IncrementCounter():
          emit(state);
          return;
        case DecrementCounter():
          emit(state);
          return;
      }
    });
  }
}
