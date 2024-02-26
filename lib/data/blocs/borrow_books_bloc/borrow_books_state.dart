part of 'borrow_books_bloc.dart';

@immutable
abstract class BorrowBooksState {}

class BorrowBooksInitial extends BorrowBooksState {}

class BorrowBooksLoadingState extends BorrowBooksState {}

class BorrowBooksLoadedState extends BorrowBooksState {
  final BorrowBookResponse borrowBooks;
  BorrowBooksLoadedState({required this.borrowBooks});
}

class BorrowBooksErrorState extends BorrowBooksState {}
