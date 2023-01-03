import 'package:baguette/baguette.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<Counter, CounterState>((ref) => Counter());

class Counter extends Store<CounterState> {
  Counter() : super(const CounterState());
}

class CounterState {
  final int count;

  const CounterState({this.count = 0});

  CounterState copyWith({
    int? count,
  }) =>
      CounterState(
        count: count ?? this.count,
      );
}

