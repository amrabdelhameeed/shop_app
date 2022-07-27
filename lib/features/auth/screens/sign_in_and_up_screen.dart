// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants/app_strings.dart';
import 'package:shop_app/data/blocs/auth_cubit/auth_cubit.dart';
import 'package:shop_app/data/blocs/theme_cubit/theme_cubit.dart';
import 'package:shop_app/features/auth/widgets/custom_clipper.dart';
import 'package:shop_app/utils/size_config.dart';
import 'package:shop_app/widgets/default_text_form_field.dart';

class SignInAndUpScreen extends StatefulWidget {
  const SignInAndUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInAndUpScreen> createState() => _SignInAndUpScreenState();
}

class _SignInAndUpScreenState extends State<SignInAndUpScreen> {
  TextEditingController emailController =
      TextEditingController(text: 'amr@a.com');
  bool isLogin = true;

  TextEditingController passwordController =
      TextEditingController(text: 'aaaaaa');

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _customShape(),
              _textFormFields(context),
              _space(),
              _register(),
              _space()
            ],
          ),
        ),
      ),
    );
  }

  Padding _textFormFields(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            !isLogin ? 'Sign Up' : 'Sign In',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 1.5,
          ),
          !isLogin
              ? MyTextFormField(
                  controller: nameController,
                  hint: 'Name',
                )
              : const SizedBox.shrink(),
          !isLogin
              ? MyTextFormField(
                  controller: phoneController,
                  hint: 'Phone',
                )
              : const SizedBox.shrink(),
          MyTextFormField(
            controller: emailController,
            hint: 'Email',
          ),
          MyTextFormField(
            controller: passwordController,
            hint: 'Password',
            isPassword: true,
          ),
          _alreadyHaveAccountRow(context)
        ],
      ),
    );
  }

  CustomPaint _customShape() {
    return CustomPaint(
      painter: CurvePainter(),
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.defaultSize! * 24,
        child: BlocConsumer<ThemeCubit, ThemeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ThemeCubit.get(context);
            return IconButton(
                onPressed: () {
                  cubit.changeIsDark();
                },
                icon: Icon(!cubit.isD! ? Icons.dark_mode : Icons.light_mode));
          },
        ),
      ),
    );
  }

  Row _alreadyHaveAccountRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AutoSizeText(
              maxFontSize: 25,
              minFontSize: 15,
              !isLogin ? 'Already have account ? ' : 'Don\'t have account ? ',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).textTheme.headline2!.color)),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                isLogin = !isLogin;
                setState(() {});
              },
              child: AutoSizeText(
                maxFontSize: 25,
                minFontSize: 15,
                !isLogin ? 'Sign In' : 'Sign Up',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).textTheme.headline2!.color),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _space() {
    return SizedBox(
      height: SizeConfig.defaultSize! * 1.5,
    );
  }

  BlocConsumer<AuthCubit, AuthState> _register() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pushReplacementNamed(context, Routes.homeLayoutScreen);
        } else if (state is SignUpErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is SignInSuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.of(context).pushReplacementNamed(Routes.homeLayoutScreen);
        } else if (state is SignInErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (!isLogin) {
                  cubit.signUp(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      phone: phoneController.text);
                } else {
                  cubit.signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                }
                // formKey.currentState!.save();
              }
            },
            child: AutoSizeText(
              !isLogin ? 'Register' : 'Log In',
              maxFontSize: 25,
              minFontSize: 20,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ));
      },
    );
  }
}
