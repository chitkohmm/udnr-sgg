part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchBooksLoadingState extends SearchState {}

class SearchBooksLoadedState extends SearchState {
  final Books books;
  SearchBooksLoadedState({required this.books});
}

class SearchErrorState extends SearchState {
  final int statusCode;
  SearchErrorState({required this.statusCode});
}
