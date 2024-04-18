import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_science/src/core/di/di.dart';
import 'package:weather_science/src/core/services/hive_service.dart';
import 'package:weather_science/src/core/utils/dialogs.dart';
import '../../../../../../../core/router/router.gr.dart';
import '../../data/models/remote/current_day/current_day_model.dart';
import '../../data/repositories/home_repository_impl.dart';
part 'current_day_event.dart';
part 'current_day_state.dart';


@lazySingleton
class CurrentDayBloc extends Bloc<CurrentDayEvent, CurrentDayState> {
  CurrentDayBloc() : super(CurrentDayInitialState()) {
    on<FetchDataEvent>((event, emit) async {
      await _fetchData(event, emit);
    });

    on<UpdateDataEvent>((event, emit) async {
      await _updateData(event, emit);
    });
  }
  final _homeRepositoryImpl = di<HomeRepositoryImpl>();

  Future<void> _fetchData(FetchDataEvent event, Emitter<CurrentDayState> emit) async {
    await _homeRepositoryImpl.getData(q: event.q, units: event.units).then((value) => value.fold(
            (l) => emit(ExceptionState(message: l.message)),
            (r) {emit(FetchedDataState(currentDayModel: r));})).whenComplete(
            () {
              HiveService.saveVerifiedUser(true);
              event.context.router.push(HomeView());
            });
  }

  Future<void> _updateData(UpdateDataEvent event, Emitter<CurrentDayState> emit) async {
    await _homeRepositoryImpl.getData(q: event.q, units: event.units).then((value) => value.fold(
            (l) => emit(ExceptionState(message: l.message)),
            (r) {emit(FetchedDataState(currentDayModel: r));})).whenComplete(
          () => Loaders.popDialog(),);
  }
}
