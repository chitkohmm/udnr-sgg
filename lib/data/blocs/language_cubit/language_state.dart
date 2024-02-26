part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LocaleSate extends LanguageState {
  final Locale locale;
  LocaleSate({required this.locale});
}
