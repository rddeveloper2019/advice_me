import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advice_me/core/blocs/advice_list/advice_list_cubit.dart';
import 'package:advice_me/features/search/blocs/search_advice/search_advice_bloc.dart';
import 'package:advice_me/ui/ui.dart';

class SearchRhymesBottomSheet extends StatelessWidget {
  const SearchRhymesBottomSheet({super.key, required this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseModalBottomSheet(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.highlightColor.withAlpha(100),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Совет на тему...',
                        hintStyle: TextStyle(
                          color: theme.hintColor.withAlpha(125),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    context.read<SearchAdviceBloc>().add(
                      SearchAdviceByTermEvent(term: controller.text),
                    );
                  },
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withAlpha(200),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.search, color: Colors.white, size: 32),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          BlocBuilder<SearchAdviceBloc, SearchAdviceState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state.failure != null) {
                return Expanded(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(16),

                      child: Text(
                        state.failure.toString(),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Expanded(
                child: ListView.separated(
                  itemCount: state.advices.length,
                  separatorBuilder: (BuildContext ctx, int idx) => Divider(),
                  itemBuilder: (BuildContext ctx, int idx) {
                    final advice = state.advices[idx];
                    return ListTile(
                      title: Text(advice.advice),
                      onTap: () {
                        context.read<AdviceListCubit>().addAdvice(advice);
                        controller.clear();
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
