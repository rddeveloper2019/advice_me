import 'package:flutter/material.dart';

class BaseModalBottomSheet extends StatelessWidget {
  const BaseModalBottomSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Container(
        decoration: BoxDecoration(
          color: theme.canvasColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SizedBox(width: double.infinity, child: child),
      ),
    );
  }
}
