part of 'search_advice_bloc.dart';

class SearchAdviceState extends Equatable {
  const SearchAdviceState({
    required this.advices,
    required this.isLoading,
    this.failure,
  });

  factory SearchAdviceState.initial() {
    return const SearchAdviceState(
      advices: [],
      isLoading: false,
      failure: null,
    );
  }

  factory SearchAdviceState.loading() {
    return SearchAdviceState.initial().copyWith(isLoading: true, failure: null);
  }

  factory SearchAdviceState.loaded(List<Advice> advices) {
    return SearchAdviceState.initial().copyWith(
      advices: advices,
      isLoading: false,
    );
  }

  factory SearchAdviceState.failure(Object error) {
    return SearchAdviceState.initial().copyWith(
      failure: error,
      isLoading: false,
    );
  }

  final List<Advice> advices;
  final bool isLoading;
  final Object? failure;

  @override
  List<Object?> get props => [advices, isLoading, failure];

  SearchAdviceState copyWith({
    List<Advice>? advices,
    bool? isLoading,
    Object? failure,
  }) {
    return SearchAdviceState(
      advices: advices ?? this.advices,
      isLoading: isLoading ?? this.isLoading,
      failure: failure ?? this.failure,
    );
  }
}
