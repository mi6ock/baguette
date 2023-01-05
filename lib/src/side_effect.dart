part of 'store.dart';

mixin SideEffect {
  List<Store> get providers;

  ProviderRef get ref;

  @protected
  void effect<P extends BState, T extends Store<P>>(StateUpdater<P> updater) {
    providers.whereType<T>().forEach((s) {
      s._update(updater);
    });
  }

  @protected
  P consume<P extends BState, T extends Store<P>>() {
    final matched = providers.whereType<T>();
    assert(matched.isNotEmpty, '$T is not handled in the behavior.');
    return matched.first._consume();
  }

  @protected
  R select<P extends BState, T extends Store<P>, R>(R Function(P state) selector) {
    final matched = providers.whereType<T>();
    assert(matched.isNotEmpty, '$T is not handled in the behavior.');
    return matched.first._select(selector);
  }
}
