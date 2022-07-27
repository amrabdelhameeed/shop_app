import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart';
import 'constants/app_strings.dart';
import 'constants/observer.dart';
import 'data/blocs/theme_cubit/theme_cubit.dart';
import 'data/models/location_helper.dart';
import 'utils/app_theme.dart';
import 'utils/cashe_helper.dart';
import 'utils/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.initCasheHelper();
  await DioHelper.init();
  AppStrings.isDarkCashed = CasheHelper.getBoolean(key: AppStrings.themeKey);
  AppStrings.token = CasheHelper.getStr(key: AppStrings.tokenKey);
  AppStrings.locationId = CasheHelper.getStr(key: AppStrings.locationIdKey);
  print(AppStrings.locationId);

  print(AppStrings.token);
  BlocOverrides.runZoned(() {
    runApp(MyApp(
      appRouter: AppRouter(),
    ));
  }, blocObserver: MyBlocObserver());
  await LocationHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit()..getThemeModeinit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          var cubit = ThemeCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: cubit.isD! ? ThemeMode.dark : ThemeMode.light,
            initialRoute: AppStrings.token!.isEmpty
                ? Routes.signInAndUpScreen
                : Routes.homeLayoutScreen,
            onGenerateRoute: appRouter.onGenerateRoute,
            title: 'Shop App',
          );
        },
      ),
    );
  }
}
