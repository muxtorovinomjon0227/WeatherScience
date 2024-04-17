import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';
import '../../../../../../../core/extensions/decoration.dart';
import '../../data/models/remote/current_day/current_day_model.dart';

class MainCard extends StatelessWidget {
  final CurrentDayModel dayModel;
  const MainCard({super.key, required this.dayModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16.sp),
        _card(center: "${dayModel.wind?.speed?.truncate() ?? 0} km/h", bottom: 'Wind'),
        SizedBox(width: 8.sp),
        _card(center: "${dayModel.main?.humidity?.truncate() ?? 0} %", bottom: 'Humidity'),
        SizedBox(width: 8.sp),
        _card(center: "${dayModel.main?.pressure?.truncate() ?? 0}", bottom: 'Pressure'),
        SizedBox(width: 16.sp),
      ],
    );
  }
  Widget _card({required String center, required String bottom}){
    return Expanded(
      child: Container(
        height: 109.sp,
        width: double.infinity,
        decoration: deco15Rad,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommText(text: center,fontWeight: FontWeight.bold,fontSize: 20.sp),
            CommText(text: bottom,fontSize: 16.sp),
          ],
        ),
      ),
    );
  }
}
