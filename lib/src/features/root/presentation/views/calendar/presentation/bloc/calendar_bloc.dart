import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/di/di.dart';
import '../../data/models/remote/month_temp/month_temp_model.dart';
import '../../data/repositories/calendar_repository_impl.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

@lazySingleton
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitialState()) {
    on<FetchCalendarDataEvent>((event, emit) async {
      await _fetchData(event, emit);
    });
  }
  final _calendarRepositoryImpl = di<CalendarRepositoryImpl>();

  Future<void> _fetchData(FetchCalendarDataEvent event, Emitter<CalendarState> emit) async {
        emit(CalendarInitialState());
    await _calendarRepositoryImpl.getData(q: event.q, units: event.units).then((value) => value.fold(
            (l) => emit(ExceptionState(message: l.message)),
            (r) {emit(FetchedDataState(monthTempModel: r));}));
  }
}
