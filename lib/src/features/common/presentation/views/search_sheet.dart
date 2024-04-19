import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/core/services/hive_service.dart';
import 'package:weather_science/src/core/utils/app_utils.dart';
import 'package:weather_science/src/core/utils/loader.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';
import 'package:weather_science/src/features/common/presentation/cubit/cubit.dart';
import 'package:weather_science/src/features/root/presentation/views/calendar/presentation/bloc/calendar_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/dialogs.dart';
import '../../../../core/widgets/cupertino_search.dart';
import '../../../root/presentation/views/home/presentation/bloc/current_day_bloc.dart';
import '../../data/models/remote/city/city_model.dart';

class SearchSheet extends StatelessWidget {
  SearchSheet({super.key});

  final _cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CitySearchCubit>(context).fetchData();
    return BlocBuilder<CitySearchCubit, List<CityModel>>(
      builder: (context, state) {
        return _body(context, state);
      },
    );
  }

  Widget _body(BuildContext context, List<CityModel> item) {
    return Column(
      children: [
        _pop(context),
        _search(context),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (_, __) => divider,
            itemCount: item.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                onTap: (){
                  Navigator.pop(context);
                  _updateData(context,item[index].city ?? "");
                },
                title: CommText(text: item[index].city ?? ""),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _updateData(BuildContext context,String city) async {
    Loaders.showLoading(context);
    HiveService.saveCity(city);
    HiveService.getCity();
    di<CurrentDayBloc>().add(UpdateDataEvent(context: context, q: city, units: AppUtils.units));
    di<CalendarBloc>().add(FetchCalendarDataEvent(context: context, q: city, units: AppUtils.units));
  }

  Widget _search(BuildContext context) {
    return CommSearch(
      controller: _cont,
      autoFocus: true,
      placeholder: 'keyword.search'.tr(),
      onChanged: (value) async {
        BlocProvider.of<CitySearchCubit>(context).searchData(value);
      },
    ).paddingSymmetric(horizontal: 16.sp);
  }

  Widget _pop(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: CloseButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
