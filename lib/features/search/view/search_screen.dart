import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advice_me/api/models/advice.dart';
import 'package:advice_me/core/blocs/advice_list/advice_list_cubit.dart';
import 'package:advice_me/features/search/blocs/random_advice/random_advice_cubit.dart';
import 'package:advice_me/ui/ui.dart';
import 'package:translator/translator.dart';

import '../widgets/search_button.dart';
import '../widgets/search_rhymes_bottom_sheet.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchScreenView();
  }
}

class SearchScreenView extends StatefulWidget {
  const SearchScreenView({super.key});

  @override
  State<SearchScreenView> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreenView> {
  final _termController = TextEditingController();
  final translator = GoogleTranslator();

  @override
  void dispose() {
    _termController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    context.read<RandomAdviceCubit>().getRandomAdvice();

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          title: const Text('Советы на все случаи жизни'),
          surfaceTintColor: Colors.transparent,
          backgroundColor: theme.cardColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: SearchButton(
              controller: _termController,
              onTap: () {
                _showSearchModalBottomSheet(context, _termController);
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(
          child: BlocBuilder<RandomAdviceCubit, RandomAdviceState>(
            builder: (context, state) {
              if (state.advice == null) {
                return Padding(
                  padding: EdgeInsets.all(26.0),
                  child: RhymeHistoryCard(
                    isLarge: true,
                    title: 'Совет дня',
                    advice: Advice(id: 0, advice: 'Нет данных'),
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.all(16.0),
                child: RhymeHistoryCard(
                  isLarge: true,
                  title: 'Совет дня',
                  advice: state.advice!,
                ),
              );
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),

        BlocBuilder<AdviceListCubit, AdviceListState>(
          builder: (context, state) {
            return SliverList.separated(
              itemCount: state.adviceList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
              itemBuilder: (BuildContext ctx, int idx) {
                final advice = state.adviceList[idx];
                return RhymeListCard(advice: advice);
              },
            );
          },
        ),
      ],
    );
  }

  Future<dynamic> _showSearchModalBottomSheet(
    BuildContext context,
    TextEditingController controller,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      context: context,
      builder: (BuildContext ctx) {
        return SearchRhymesBottomSheet(controller: controller);
      },
    );
  }
}
