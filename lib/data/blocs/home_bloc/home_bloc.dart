import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/storage_utils.dart';
import '../../models/book/books.dart';
import '../../models/book_categories/book_categories.dart';
import '../../network/api_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;
  HomeBloc({required this.apiService}) : super(HomeInitial()) {
    on<StartApiCallEvent>(_startApiCall);
    on<GetAllBooksEvent>(_getAllBooks);
    on<GetBooksByTypeEvent>(_getBookByType);
    on<GetMoreBooksEvent>(_getMoreBooks);
    on<GetMoreBooksByTypeEvent>(_getMoreBooksByType);
    on<FilterBooksEvent>(_filterBooks);
  }
  void _startApiCall(StartApiCallEvent event, Emitter emit) async {
    emit(HomeLoadingState());

    try {
      final response = await apiService
          .getBookCategories("Bearer ${StorageUtils.getString("login_user")}");

      final books = await apiService.getAllBooks(
          1, "Bearer ${StorageUtils.getString("login_user")}");

      emit(HomeLoadedState(bookCategories: response, books: books));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        emit(HomeErrorState(statusCode: e.response!.statusCode!));
      }
    }
  }

  Future<void> _getAllBooks(GetAllBooksEvent event, Emitter emit) async {
    emit(HomeLoadingState());
    try {
      final books = await apiService.getAllBooks(
          event.pageNumber, "Bearer ${StorageUtils.getString("login_user")}");
      emit(GetAllBooksLoadedState(
        books: books,
        isMore: event.isMore,
      ));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        emit(HomeErrorState(statusCode: e.response!.statusCode!));
      }
    }
  }

  Future<void> _getMoreBooksByType(
      GetMoreBooksByTypeEvent event, Emitter emit) async {
    emit(HomeLoadingState());
    try {
      final books = await apiService.getBooksByType(event.status,
          event.pageNumber, "Bearer ${StorageUtils.getString("login_user")}");
      emit(BooksByTypeLoadMoreLoadedState(
        books: books,
      ));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        emit(HomeErrorState(statusCode: e.response!.statusCode!));
      }
    }
  }

  Future<void> _getBookByType(GetBooksByTypeEvent event, Emitter emit) async {
    emit(HomeLoadingState());
    try {
      final books = await apiService.getBooksByType(event.status,
          event.pageNumber, "Bearer ${StorageUtils.getString("login_user")}");
      emit(GetBookByTypeLoadedState(
        books: books,
      ));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        emit(HomeErrorState(statusCode: e.response!.statusCode!));
      }
    }
  }

  Future<void> _getMoreBooks(GetMoreBooksEvent event, Emitter emit) async {
    emit(HomeLoadingState());
    try {
      final books = await apiService.getAllBooks(
          event.pageNumber, "Bearer ${StorageUtils.getString("login_user")}");
      emit(BooksLoadMoreLoadedState(
        books: books,
      ));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        emit(HomeErrorState(statusCode: e.response!.statusCode!));
      }
    }
  }

  Future<void> _filterBooks(FilterBooksEvent event, Emitter emit) async {
    List<Book> filterList = [];
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1), () {});
    if (event.status == "0") {
      for (var book in event.books) {
        if (book.status == "0" || book.status == "2") {
          filterList.add(book);
        }
      }
    } else if (event.status == "1") {
      for (var book in event.books) {
        if (book.status == "1" || book.status == "2") {
          filterList.add(book);
        }
      }
    }

    emit(BookRefreshLoadedState(
      books: Books(data: filterList),
    ));
  }
}
