import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_science/src/core/utils/app_utils.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/utils/dialogs.dart';
import '../../../../../../../core/widgets/error/error.dart';
import '../../data/models/remote/month_temp/month_temp_model.dart';
import '../bloc/calendar_bloc.dart';
import '../widgets/card_list.dart';

@RoutePage()
class CalendarView extends StatelessWidget {
  CalendarView({super.key});
  late MonthTempModel _tempModel = const MonthTempModel();
  late BuildContext _ctx;
  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        if (state is FetchedDataState) {
          _tempModel = state.monthTempModel;
        }
        if (state is ExceptionState) {
          return GlobalError(onPressed: _updateData, message: state.message);
        }
        if (state is CalendarInitialState) {
          return Loaders.loading(context);
        }
        return _body();
      },
    );
  }

  Widget _body(){
    return CardList(tempModel: _tempModel);
  }



  Future<void> _updateData() async {
    Loaders.showLoading(_ctx);
    di<CalendarBloc>().add(FetchCalendarDataEvent(context: _ctx, q: AppUtils.cityName, units: AppUtils.units));
  }
}
