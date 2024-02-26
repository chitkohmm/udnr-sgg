part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final BookCategories bookCategories;
  final Books books;
  HomeLoadedState({required this.bookCategories, required this.books});
}

class GetAllBooksLoadedState extends HomeState {
  final Books books;
  final bool? isMore;
  GetAllBooksLoadedState({
    this.isMore,
    required this.books,
  });
}

class BooksLoadMoreLoadedState extends HomeState {
  final Books books;
  BooksLoadMoreLoadedState({required this.books});
}

class BooksByTypeLoadMoreLoadedState extends HomeState {
  final Books books;
  BooksByTypeLoadMoreLoadedState({required this.books});
}

class GetBookByTypeLoadedState extends HomeState {
  final Books books;

  GetBookByTypeLoadedState({
    required this.books,
  });
}

class BookRefreshLoadedState extends HomeState {
  final Books books;

  BookRefreshLoadedState({
    required this.books,
  });
}

class HomeErrorState extends HomeState {
  final int statusCode;
  HomeErrorState({required this.statusCode});
}
