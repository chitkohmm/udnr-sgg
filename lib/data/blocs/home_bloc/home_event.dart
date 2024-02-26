part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class StartApiCallEvent extends HomeEvent {}

class GetAllBooksEvent extends HomeEvent {
  final int pageNumber;
  final bool? isMore;
  GetAllBooksEvent({required this.pageNumber, this.isMore});
}

class GetBooksByTypeEvent extends HomeEvent {
  final int pageNumber;
  final int status;

  GetBooksByTypeEvent({required this.pageNumber, required this.status});
}

class GetMoreBooksByTypeEvent extends HomeEvent {
  final int pageNumber;
  final int status;
  GetMoreBooksByTypeEvent({
    required this.pageNumber,
    required this.status,
  });
}

class GetMoreBooksEvent extends HomeEvent {
  final int pageNumber;
  GetMoreBooksEvent({required this.pageNumber});
}

class FilterBooksEvent extends HomeEvent {
  final String status;
  final List<Book> books;
  FilterBooksEvent({required this.status, required this.books});
}
