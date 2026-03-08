import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advice_me/api/api.dart';
import 'package:advice_me/api/models/advice.dart';
import 'package:translator/translator.dart';

part 'random_advice_state.dart';

class RandomAdviceCubit extends Cubit<RandomAdviceState> {
  RandomAdviceCubit({
    required RestClient api,
    required GoogleTranslator translator,
  }) : _api = api,
       _translator = translator,
       super(RandomAdviceState());

  final RestClient _api;
  final GoogleTranslator _translator;

  Future<void> getRandomAdvice() async {
    try {
      final result = await _api.getRandomAdvice();
      print('(**) => result:  ${result}');

      final trasnlation = await _translator.translate(
        result.advice.advice,
        to: 'ru',
      );

      emit(
        state.copyWith(
          advice: Advice(id: result.advice.id, advice: trasnlation.text),
        ),
      );
    } catch (e) {
      emit(state.copyWith(advice: null));
    }
  }
}
