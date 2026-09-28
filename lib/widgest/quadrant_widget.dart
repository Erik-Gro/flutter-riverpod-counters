import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/Counter/counter_notifier.dart';
import '../state/Counter/counter_state.dart';

class QuadrantWidget extends ConsumerWidget {
  final QuadrantPosition position;

  const QuadrantWidget({super.key, required this.position});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterValue = ref.watch(
      counterProvider.select((state) {
        switch (position) {
          case QuadrantPosition.topLeft:
            return state.topLeft;
          case QuadrantPosition.topRight:
            return state.topRight;
          case QuadrantPosition.bottomLeft:
            return state.bottomLeft;
          case QuadrantPosition.bottomRight:
            return state.bottomRight;
        }
      }),
    );

    final notifier = ref.read(counterProvider.notifier);

    return Card(
      color: Colors.teal.shade50,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              icon: const Icon(Icons.arrow_upward),
              onPressed: () => notifier.incrementOpposite(position),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.lightGreen.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$counterValue',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 12),
            IconButton.filled(
              icon: const Icon(Icons.arrow_downward),
              onPressed: () => notifier.decrementOpposite(position),
            ),
          ],
        ),
      ),
    );
  }
}
