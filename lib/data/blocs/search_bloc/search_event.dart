part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchBooksEvent extends SearchEvent {
  final Search search;
  SearchBooksEvent({required this.search});
}

class SearchInitialEvent extends SearchEvent {}
