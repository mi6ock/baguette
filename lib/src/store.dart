import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

typedef StateUpdater<T> = T Function(T prev);

mixin SideEffect {
  List<Store> get providers;

  ProviderRef get ref;

  @protected
  void effect<P, T extends Store<P>>(StateUpdater<P> updater) {
    providers.whereType<T>().forEach((s) {
      s._update(updater);
    });
  }

  @protected
  @visibleForTesting
  P consume<P, T extends Store<P>>() {
    final matched = providers.whereType<T>();
    assert(matched.isNotEmpty, '$T is not handled in the behavior.');
    return matched.first._consume();
  }

  @protected
  @visibleForTesting
  R select<P, T extends Store<P>, R>(R Function(P state) selector) {
    final matched = providers.whereType<T>();
    assert(matched.isNotEmpty, '$T is not handled in the behavior.');
    return matched.first._select(selector);
  }
}

abstract class Store<T> extends StateNotifier<T> {
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
