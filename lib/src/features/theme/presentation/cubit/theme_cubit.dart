import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/hive_service.dart';
import '../../../../core/theme/theme.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(HiveService.greenTheme()
            ? ThemeState(AppThemes.greenTheme)
            : ThemeState(AppThemes.blueTheme));

  void getTheme(ThemeState state) {
    emit(state);
  }
}
