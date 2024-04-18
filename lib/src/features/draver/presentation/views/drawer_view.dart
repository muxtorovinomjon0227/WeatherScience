import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/features/draver/presentation/widgets/user_info.dart';
import '../../../language/presentation/widget/choos_button.dart';
import '../widgets/menu_card.dart';
import '../widgets/utils.dart';


class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserIfo(),
        SizedBox(height: 32.sp),
        SingleChildScrollView(
          child: Column(
            children: List.generate(1, (index) => MenuCard(
              onTap: ()=> ProfileUtils.selectMenu(context,index),
              icon: ProfileUtils.icons[index],
              index: index,
              title: ProfileUtils.menus[index].tr()),),
          ),
        ),
        ChooseButton(),
      ],
    );
  }

}
