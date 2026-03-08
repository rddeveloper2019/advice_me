import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/settings_action_card.dart';
import '../widgets/settings_toggle_card.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: false,
          snap: false,
          title: Text('Настройки'),
          surfaceTintColor: Colors.transparent,
          backgroundColor: theme.cardColor,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(
          child: SettingsToggleCard(
            title: 'Тёмная тема',
            value: true,
            onChanged: (_) {},
          ),
        ),
        SliverToBoxAdapter(
          child: SettingsToggleCard(
            title: 'Уведомления',
            value: true,
            onChanged: (_) {},
          ),
        ),
        SliverToBoxAdapter(
          child: SettingsToggleCard(
            title: 'Разрешить сбор аналитики',
            value: false,
            onChanged: (_) {},
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 18)),
        SliverToBoxAdapter(
          child: SettingsActionCard(
            title: 'Очистить',
            subtitle: 'Очистить историю из кеша приложения',
            iconData: Icons.delete_forever_outlined,
            iconColor: theme.primaryColor,
          ),
        ),
        SliverToBoxAdapter(
          child: SettingsActionCard(
            title: 'Написать в поддержку',
            iconData: Icons.message_outlined,
            iconColor: theme.hintColor,
          ),
        ),
      ],
    );
  }
}
