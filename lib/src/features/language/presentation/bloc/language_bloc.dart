import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'language_event.dart';
part 'language_state.dart';

@lazySingleton
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitialState()) {
    on<ChangeLangEvent>((event, emit) async {
      await _changeLang(event, emit);
    });
  }
  Future<void> _changeLang(ChangeLangEvent event, Emitter<LanguageState> emit) async {
    await event.context.setLocale(event.locale);
    emit(ChangeLangState(event.locale));
  }
}
