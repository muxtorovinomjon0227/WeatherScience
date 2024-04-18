part of 'language_bloc.dart';

@immutable
sealed class LanguageEvent extends Equatable{}

class ChangeLangEvent extends LanguageEvent{
  final BuildContext context;
  final Locale locale;
  ChangeLangEvent(this.context, this.locale);
  @override
  List<Object?> get props => [context,locale];
}

