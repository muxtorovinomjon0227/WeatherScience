import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/di/di.dart';
import 'package:weather_science/src/core/utils/dialogs.dart';
import 'package:weather_science/src/features/root/presentation/views/home/presentation/bloc/current_day_bloc.dart';
import '../../../../../../../core/widgets/error/error.dart';
import '../../data/models/remote/current_day/current_day_model.dart';
import '../widgets/all_temp.dart';
import '../widgets/current_temp.dart';
import '../widgets/main_card.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  HomeView({super.key});

  late CurrentDayModel _dayModel = const CurrentDayModel();
  final  _controller = ScrollController();
  late BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return BlocBuilder<CurrentDayBloc, CurrentDayState>(
      builder: (context, state) {
        if (state is FetchedDataState) {
          _dayModel = state.currentDayModel;
        }
        if (state is ExceptionState) {
          return GlobalError(onPressed: _updateData,message: state.message);
        }
        return _body();
      },
    );
  }

  Widget _body() {
    return Column(
      children: [
        CurrentTemp(dayModel: _dayModel),
        SizedBox(height: 16.sp),
        MainCard(dayModel: _dayModel),
        SizedBox(height: 16.sp),
        AllTemperatures(dayModel: _dayModel, controller: _controller),
      ],
    );
  }
  Future<void> _updateData() async {
    Loaders.showLoading(_ctx);
    di<CurrentDayBloc>().add(UpdateDataEvent(context: _ctx, q: 'Toshkent', units: 'metric'));
  }
}
