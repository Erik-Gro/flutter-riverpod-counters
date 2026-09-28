import 'package:flutter/material.dart';

class PassiveRow extends StatelessWidget {
  final Widget left;
  final Widget right;

  const PassiveRow({super.key, required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 16),
        Expanded(child: right),
      ],
    );
  }
}
