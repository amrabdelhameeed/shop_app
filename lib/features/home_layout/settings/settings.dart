import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_strings.dart';
import '../../../data/blocs/auth_cubit/auth_cubit.dart';
import '../../../data/blocs/theme_cubit/theme_cubit.dart';
import '../../../utils/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  // cubit.userResponse? cubit.userResponse;
  TextEditingController emailCont = TextEditingController();

  TextEditingController nameCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: BlocProvider<AuthCubit>.value(
        value: authCubit!,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignOutState) {
              Navigator.of(context, rootNavigator: true).pushReplacementNamed(
                Routes.signInAndUpScreen,
              );
            }
            // if (state is GetUserProfileState) {
            //   cubit.userResponse = state.cubit.userResponse;
            //   print('hi');
            //   // print(cubit.userResponse!.status);
            // }

            if (state is UpdateProfileState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            if (state is UpdateProfileState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (cubit.userResponse != null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          'Dark Mode',
                          maxFontSize: 25,
                          minFontSize: 18,
                        ),
                        BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, state) {
                            var themeCubit = ThemeCubit.get(context);
                            return Switch(
                                value: themeCubit.isD!,
                                activeColor: AppColors.primary,
                                onChanged: (_) {
                                  themeCubit.changeIsDark();
                                });
                          },
                        )
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'name',
                      ),
                      controller: nameCont
                        ..text = cubit.userResponse!.data.name,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'email',
                      ),
                      controller: emailCont
                        ..text = cubit.userResponse!.data.email,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'phone',
                      ),
                      controller: phoneCont
                        ..text = cubit.userResponse!.data.phone,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'password',
                      ),
                      controller: passwordCont,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            cubit.updateProfile(
                                email: emailCont.text.isEmpty
                                    ? null
                                    : emailCont.text,
                                name: nameCont.text.isEmpty
                                    ? null
                                    : nameCont.text,
                                password: passwordCont.text.isEmpty
                                    ? null
                                    : passwordCont.text,
                                phone: phoneCont.text.isEmpty
                                    ? null
                                    : phoneCont.text);
                          },
                          child: const Text('update')),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            cubit.signOut();
                          },
                          child: const Text('sign out')),
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
/*
TextButton(
                    child: const Text('signOut'),
                    onPressed: () {
                      cubit.signOut();
                    }),
                BlocConsumer<ProductsCubit, ProductsState>(
                  listener: (context, state) {
                    if (state is GetAddress) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    var cubit2 = ProductsCubit.get(context);

                    return TextButton(
                        child: const Text('address'),
                        onPressed: () {
                          // cubit2;
                        });
                  },
                ),
 */