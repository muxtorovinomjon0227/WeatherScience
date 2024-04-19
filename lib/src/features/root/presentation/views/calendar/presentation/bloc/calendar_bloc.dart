import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/utils/dialogs.dart';
import '../../data/models/remote/month_temp/month_temp_model.dart';
import '../../domain/usecase/fiwedaysdata_case.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

@lazySingleton
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitialState()) {
    on<FetchCalendarDataEvent>((event, emit) async {
      await _fetchData(event, emit);
    });
  }
  final _fiveDaysDataUseCase = di<FiveDaysDataUseCase>();

  Future<void> _fetchData(FetchCalendarDataEvent event, Emitter<CalendarState> emit) async {
        emit(CalendarInitialState());
    await _fiveDaysDataUseCase.execute(event.q,event.units).then((value) => value.fold(
            (l) => emit(ExceptionState(message: l.message)),
            (r) {emit(FetchedDataState(monthTempModel: r));})).whenComplete(() => Loaders.popDialog());
  }
}
