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
    this.tooltip,
    this.subtitle = '',
  });

  final String title;
  final String subtitle;
  final IconData iconData;
  void Function()? onPressed;
  final Color? iconColor;
  String? tooltip;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState>? tooltipKey = tooltip != null
        ? GlobalKey<TooltipState>()
        : null;

    final theme = Theme.of(context);
    final color = iconColor ?? theme.hintColor;

    void showTooltip() {
      Future.delayed(const Duration(milliseconds: 200), () {
        tooltipKey?.currentState?.ensureTooltipVisible();
      });
    }

    void onTap() {
      if (onPressed == null) {
        return null;
      }
      if (onPressed != null) {
        onPressed!();
      }
      if (tooltip != null) {
        showTooltip();
      }
    }

    return Tooltip(
      key: tooltipKey,
      message: tooltip ?? 'Операция выполнена успешно',
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.zero,
      ),
      preferBelow: true,
      margin: EdgeInsets.zero,
      triggerMode: TooltipTriggerMode.manual,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      waitDuration: const Duration(milliseconds: 200),
      showDuration: const Duration(seconds: 2),
      child: BaseContainer(
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
              onPressed: onTap,
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
      ),
    );
  }
}
