part of 'books_by_category_bloc.dart';

@immutable
abstract class BooksByCategoryEvent {}

class GetAllBooksByCategoryEvent extends BooksByCategoryEvent {
  final int id;
  GetAllBooksByCategoryEvent({required this.id});
}

class FilterBooksEvent extends BooksByCategoryEvent {
  final String status;
  final List<Book> books;
  FilterBooksEvent({required this.status, required this.books});
}
