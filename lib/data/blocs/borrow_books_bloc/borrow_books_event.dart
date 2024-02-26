part of 'borrow_books_bloc.dart';

@immutable
abstract class BorrowBooksEvent {}

class GetAllBorrowBooksEvent extends BorrowBooksEvent {}
