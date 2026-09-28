import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_state.dart';

class CounterNotifier extends Notifier<CounterState> {
  @override
  CounterState build() => const CounterState();

  void incrementOpposite(QuadrantPosition origin) {
    switch (origin) {
      case QuadrantPosition.topLeft:
        state = state.copyWith(bottomRight: state.bottomRight + 1);
        break;
      case QuadrantPosition.topRight:
        state = state.copyWith(bottomLeft: state.bottomLeft + 1);
        break;
      case QuadrantPosition.bottomLeft:
        state = state.copyWith(topRight: state.topRight + 1);
        break;
      case QuadrantPosition.bottomRight:
        state = state.copyWith(topLeft: state.topLeft + 1);
        break;
    }
  }

  void decrementOpposite(QuadrantPosition origin) {
    switch (origin) {
      case QuadrantPosition.topLeft:
        state = state.copyWith(bottomRight: state.bottomRight - 1);
        break;
      case QuadrantPosition.topRight:
        state = state.copyWith(bottomLeft: state.bottomLeft - 1);
        break;
      case QuadrantPosition.bottomLeft:
        state = state.copyWith(topRight: state.topRight - 1);
        break;
      case QuadrantPosition.bottomRight:
        state = state.copyWith(topLeft: state.topLeft - 1);
        break;
    }
  }
}

final counterProvider = NotifierProvider<CounterNotifier, CounterState>(
  CounterNotifier.new,
);
