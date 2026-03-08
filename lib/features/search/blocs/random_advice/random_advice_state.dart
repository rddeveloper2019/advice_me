part of 'random_advice_cubit.dart';

class RandomAdviceState extends Equatable {
  RandomAdviceState({this.advice});

  final Advice? advice;
  @override
  List<Object?> get props => [advice];
  RandomAdviceState copyWith({Advice? advice}) {
    return RandomAdviceState(advice: advice);
  }
}
