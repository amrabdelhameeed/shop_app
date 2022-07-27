import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/app_strings.dart';
import 'data/blocs/auth_cubit/auth_cubit.dart';
import 'data/blocs/products_cubit/products_cubit.dart';
import 'data/models/home_models.dart';
import 'data/repositories/home_repo.dart';
import 'data/web_services/web_services.dart';
import 'features/auth/screens/sign_in_and_up_screen.dart';
import 'features/home_layout/home_layout.dart';
import 'features/product_screen/product_screen.dart';

class AppRouter {
  AppRouter() {
    authCubit = AuthCubit();
  }
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInAndUpScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<AuthCubit>.value(
              value: authCubit!,
              child: const SignInAndUpScreen(),
            );
          },
        );
      case Routes.productScreen:
        return MaterialPageRoute(
          builder: (context) {
            final product = settings.arguments as Product;
            return ProductScreen(product: product);
          },
        );
      case Routes.homeLayoutScreen:
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(providers: [
              BlocProvider<ProductsCubit>(
                create: (context) => ProductsCubit(HomeRepo(), WebServices())
                  ..getHomeData()
                  ..getAddress(),
              ),
              BlocProvider<AuthCubit>.value(
                value: authCubit!..getUser(),
              )
            ], child: HomeLayout());
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
