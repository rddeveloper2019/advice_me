import 'package:flutter/material.dart';
import 'package:advice_me/ui/ui.dart';

// ignore: must_be_immutable
class SettingsActionCard extends StatelessWidget {
  SettingsActionCard({
    super.key,
    required this.title,
    required this.iconData,
    this.onPressed,
    this.iconColor,
    this.subtitle = '',
  });

  final String title;
  final String subtitle;
  final IconData iconData;
  void Function()? onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = iconColor ?? theme.hintColor;

    return BaseContainer(
      padding: EdgeInsetsGeometry.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.titleMedium),
              if (subtitle.isNotEmpty) Text(subtitle),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              color: onPressed != null
                  ? color.withAlpha(200)
                  : color.withAlpha(100),
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
