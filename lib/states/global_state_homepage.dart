import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_counters/state/Counter/counter_notifier.dart';

import '../state/Counter/counter_state.dart';
import '../widgest/passive_row.dart';
import '../widgest/quadrant_widget.dart';

class GlobalStateHomepage extends ConsumerWidget {
  const GlobalStateHomepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalSum = ref.watch(counterProvider.select((s) => s.totalSum));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        foregroundColor: Colors.white,
        title: Text('Overengineered Counter (Sum: $totalSum)'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PassiveRow(
                left: QuadrantWidget(position: QuadrantPosition.topLeft),
                right: QuadrantWidget(position: QuadrantPosition.topRight),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: PassiveRow(
                left: QuadrantWidget(position: QuadrantPosition.bottomLeft),
                right: QuadrantWidget(position: QuadrantPosition.bottomRight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
