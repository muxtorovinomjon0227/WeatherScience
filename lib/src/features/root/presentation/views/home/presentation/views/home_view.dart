import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/features/root/presentation/views/home/presentation/bloc/current_day_bloc.dart';
import '../../data/models/remote/current_day/current_day_model.dart';
import '../widgets/all_temp.dart';
import '../widgets/current_temp.dart';
import '../widgets/main_card.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  HomeView({super.key});

  late CurrentDayModel _dayModel = const CurrentDayModel();
  final  _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentDayBloc, CurrentDayState>(
      builder: (context, state) {
        if (state is FetchedDataState) {
          _dayModel = state.currentDayModel;
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
}
