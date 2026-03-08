import 'package:advice_me/api/models/advice.dart';
import 'package:advice_me/ui/widgets/base_container.dart';
import 'package:flutter/material.dart';

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
    required this.advice,
    this.title = 'Совет',
    this.isLarge = false,
  });

  final Advice advice;
  final String title;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      margin: EdgeInsets.zero,
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text(
            title,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: theme.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            advice.advice,
            overflow: TextOverflow.visible,
            style: isLarge
                ? theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
