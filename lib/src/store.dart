import 'package:baguette/src/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

part 'side_effect.dart';

typedef StateUpdater<T> = T Function(T prev);

abstract class Store<T extends BState> extends StateNotifier<T> {
  Store(T initialState) : super(initialState);

  void _update(StateUpdater<T> updater) {
    if (mounted) {
      state = updater(state);
    }
  }

  T _consume() {
    return state;
  }

  Result _select<Result>(Result Function(T state) selector) {
    return selector(state);
  }
}
