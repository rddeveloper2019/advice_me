import 'package:advice_me/core/blocs/advice_list/advice_list_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:advice_me/api/models/advice.dart';
import 'package:advice_me/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocBuilder<AdviceListCubit, AdviceListState>(
          builder: (context, state) {
            final favorites = state.adviceList
                .where((a) => a.isFavorite == true)
                .toList();
            return SliverList.separated(
              itemCount: favorites.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 8);
              },
              itemBuilder: (BuildContext ctx, int idx) {
                final advice = favorites[idx];
                return RhymeListCard(
                  advice: advice,
                  onTap: (advice) {
                    context.read<AdviceListCubit>().updateAdvice(
                      Advice(
                        id: advice.id,
                        advice: advice.advice,
                        isFavorite: advice.isFavorite == true ? false : true,
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
