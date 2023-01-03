import 'package:baguette/baguette.dart';
import 'package:example/main_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterSideEffect = Provider<CounterSideEffect>((ref) => CounterSideEffect(ref));

class CounterSideEffect with SideEffect {
  @override
  List<Store> providers;
  @override
  ProviderRef ref;

  CounterSideEffect(this.ref) : providers = [
    ref.read(counterProvider.notifier)
  ];

  Future<void> countUP() async {
    final count = select((CounterState state) => state.count);
    effect((CounterState prev) => prev.copyWith(count: count + 1));
  }
}