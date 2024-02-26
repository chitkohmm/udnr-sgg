import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:libms_flutter/domain/storage_utils.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit(super.initialState);

  void changeStartLang() async {
    String langCode = StorageUtils.getString('lang');

    if (langCode != "") {
      emit(Locale(langCode, ""));
    }
  }

  void changeLang(context, String data) async {
    emit(Locale(data, ''));
    await StorageUtils.setString('lang', data);
  }
}
