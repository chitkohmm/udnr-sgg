part of 'books_by_category_bloc.dart';

@immutable
abstract class BooksByCategoryState {}

class BooksByCategoryInitial extends BooksByCategoryState {}

class BooksByCategoryLoadingState extends BooksByCategoryState {}

class BooksByCategoryLoadedState extends BooksByCategoryState {
  final BooksByCategory booksByCategory;

  BooksByCategoryLoadedState({required this.booksByCategory});
}

class BooksRefreshLoadedState extends BooksByCategoryState {
  final BooksByCategory booksByCategory;

  BooksRefreshLoadedState({required this.booksByCategory});
}

class BooksByCategoryErrorState extends BooksByCategoryState {}
