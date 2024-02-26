import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/login/login_request.dart';
import '../../models/login/login_response.dart';
import '../../network/api_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService apiService;
  LoginBloc({required this.apiService}) : super(LoginInitial()) {
    on<LoginRequestEvent>(_login);
  }

  Future<void> _login(LoginRequestEvent event, Emitter emit) async {
    emit(LoginLoadingState());
    try {
      final response = await apiService.login(event.loginRequest);
      emit(LoginLoadedState(loginResponse: response));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        emit(LoginErrorState(statusCode: e.response!.statusCode!));
      }
    }
  }
}
