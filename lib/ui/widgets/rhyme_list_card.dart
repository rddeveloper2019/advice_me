import 'package:flutter/material.dart';
import 'package:advice_me/api/models/advice.dart';

import './base_container.dart';

class RhymeListCard extends StatelessWidget {
  const RhymeListCard({
    super.key,
    this.isFavorite = false,
    required this.advice,
    this.source,
  });

  final bool isFavorite;
  final Advice advice;
  final String? source;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
            onPressed: () {},
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
