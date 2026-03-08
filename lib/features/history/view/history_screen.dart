import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:advice_me/api/models/advice.dart';
import 'package:advice_me/ui/ui.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: false,
          snap: false,
          title: Text('History'),
          surfaceTintColor: Colors.transparent,
          backgroundColor: theme.cardColor,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.9,
            ),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              final advice = Advice(
                id: 4,
                advice:
                    "You spend half your life asleep or in bed. It's worth spending money on a good mattress, decent pillows and a comfy duvet.",
              );

              return RhymeHistoryCard(advice: advice);
            },
          ),
        ),
      ],
    );
  }
}
