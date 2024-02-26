import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:libms_flutter/data/models/book/books.dart';
import 'package:libms_flutter/data/models/search/search.dart';
import 'package:libms_flutter/domain/storage_utils.dart';

import '../../network/api_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiService apiService;
  SearchBloc({required this.apiService}) : super(SearchInitial()) {
    on<SearchBooksEvent>(_search);
    on<SearchInitialEvent>(_initial);
  }
  Future<void> _search(SearchBooksEvent event, Emitter emit) async {
    emit(SearchBooksLoadingState());
    try {
      final response = await apiService.searchBooks(
          "Bearer ${StorageUtils.getString("login_user")}", event.search);
      emit(SearchBooksLoadedState(books: response));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        emit(SearchErrorState(statusCode: e.response!.statusCode!));
      }
    }
  }

  Future<void> _initial(SearchInitialEvent event, Emitter emit) async {
    emit(SearchInitial());
  }
}
