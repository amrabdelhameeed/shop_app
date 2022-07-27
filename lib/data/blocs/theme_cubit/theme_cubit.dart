import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/cashe_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) => BlocProvider.of(context);
  bool? isD;
  void changeIsDark() {
    isD = !isD!;
    CasheHelper.setBoolean(key: AppStrings.themeKey, boolean: isD!);
    emit(OnThemeChangedState());
  }

  void getThemeModeinit() {
    isD = AppStrings.isDarkCashed;
    emit(OnThemeChangedState());
  }

  void playPageAudio(int pageIndex) {}
}
