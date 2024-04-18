part of 'language_bloc.dart';

@immutable
sealed class LanguageState extends Equatable{}

 class LanguageInitialState extends LanguageState {
  @override
  List<Object?> get props => [];
}

class ChangeLangState extends LanguageState{
  final Locale locale;
  ChangeLangState(this.locale);
  @override
  List<Object> get props => [locale];
}

