part of 'search_advice_bloc.dart';

sealed class SearchAdviceEvent extends Equatable {
  const SearchAdviceEvent();

  @override
  List<Object> get props => [];
}

final class SearchAdviceByTermEvent extends SearchAdviceEvent {
  const SearchAdviceByTermEvent({required this.term});

  final String term;

  @override
  List<Object> get props => [term];

  @override
  String toString() {
    return 'SearchAdviceByTermEvent{term=$term}';
  }
}
