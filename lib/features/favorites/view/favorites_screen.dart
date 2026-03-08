import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:advice_me/api/models/advice.dart';
import 'package:advice_me/ui/ui.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: false,
          snap: false,
          title: Text('Избранное'),
          surfaceTintColor: Colors.transparent,
          backgroundColor: theme.cardColor,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverList.separated(
          itemCount: 30,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 8);
          },
          itemBuilder: (BuildContext ctx, int idx) {
            final advice = Advice(
              id: 1,
              advice:
                  "You spend half your life asleep or in bed. It's worth spending money on a good mattress, decent pillows and a comfy duvet.",
            );
            return RhymeListCard(
              isFavorite: true,
              advice: advice,
              source: 'Совет',
            );
          },
        ),
      ],
    );
  }
}
