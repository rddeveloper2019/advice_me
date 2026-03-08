import 'package:advice_me/api/models/advice.dart';
import 'package:advice_me/core/blocs/advice_list/advice_list_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:advice_me/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Future<void> _deleteAdvice(Advice advice) async {
      final result = await showDialog<bool?>(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            iconColor: theme.primaryColor,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.warning, color: theme.primaryColor, size: 32),
                TextButton(
                  onPressed: () {
                    ctx.maybePop(true);
                  },
                  child: Text('Удалить'),
                ),
              ],
            ),
          );
        },
      );
      if (result == true) {
        context.read<AdviceListCubit>().deleteAdvice(advice);
      }
    }

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
        BlocBuilder<AdviceListCubit, AdviceListState>(
          builder: (context, state) {
            if (state.isLoading) {
              return SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: state.adviceList.length,
                itemBuilder: (BuildContext context, int index) {
                  final advice = state.adviceList[index];

                  return HistoryAdviceCard(
                    advice: advice,
                    onTap: () {
                      _deleteAdvice(advice);
                    },
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
