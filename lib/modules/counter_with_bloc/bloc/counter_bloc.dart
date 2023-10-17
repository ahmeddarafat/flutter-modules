import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }

  static CounterBloc getInstance(BuildContext context) =>
      BlocProvider.of(context);

  void increament() {
    add(CounterIncrementPressed());
  }

  void decrement() {
    add(CounterDecrementPressed());
  }
}
