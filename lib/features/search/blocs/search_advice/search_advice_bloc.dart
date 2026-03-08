import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advice_me/api/api.dart';
import 'package:advice_me/api/models/advice.dart';
import 'package:translator/translator.dart';

part 'search_advice_event.dart';
part 'search_advice_state.dart';

class SearchAdviceBloc extends Bloc<SearchAdviceEvent, SearchAdviceState> {
  SearchAdviceBloc({
    required RestClient api,
    required GoogleTranslator translator,
  }) : _translator = translator,
       _api = api,
       super(SearchAdviceState.initial()) {
    on<SearchAdviceByTermEvent>(_searchAdviceByTerm);
  }

  final RestClient _api;
  final GoogleTranslator _translator;

  Future<void> _searchAdviceByTerm(
    SearchAdviceByTermEvent event,
    Emitter<SearchAdviceState> emit,
  ) async {
    try {
      if (event.term.isEmpty) {
        return;
      }

      emit(SearchAdviceState.loading());
      final engTerm = await _translator.translate(event.term);
      final result = await _api.searchAdvice(engTerm.text);

      if (result.message?['text'] != null) {
        final rusMessage = await _translator.translate(
          result.message?['text'],
          to: 'ru',
        );
        throw rusMessage + "\n'${event.term.toUpperCase()}'";
      }

      if (result.adviceList.isNotEmpty) {
        final translationFutures = result.adviceList.map((e) async {
          final rus = await _translator.translate(e.advice, to: 'ru');
          return Advice(id: e.id, advice: rus.text);
        }).toList();

        final translatedList = await Future.wait(translationFutures);

        emit(SearchAdviceState.loaded(translatedList));
      }
    } catch (e) {
      emit(SearchAdviceState.failure(e));
    }
  }
}
