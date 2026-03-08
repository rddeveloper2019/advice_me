import 'package:flutter/material.dart';
import 'package:advice_me/api/models/advice.dart';

import './base_container.dart';

class AdviceListCard extends StatelessWidget {
  const AdviceListCard({
    super.key,
    required this.advice,
    this.source,
    required this.onTap,
  });

  final Advice advice;
  final String? source;
  final void Function(Advice advice) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isFavorite = advice.isFavorite == true;

    return BaseContainer(
      padding: EdgeInsetsGeometry.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (source != null) ...[
                  Row(
                    children: [
                      Text(source!, style: theme.textTheme.bodyLarge),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: theme.hintColor.withAlpha(100),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
                Text(
                  advice.advice,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              onTap(advice);
            },
            icon: Icon(
              Icons.favorite,
              color: isFavorite
                  ? theme.primaryColor
                  : theme.hintColor.withAlpha(60), // theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
