import '../data/blocs/auth_cubit/auth_cubit.dart';

class ApiStrings {
  static const String baseUrl = 'https://student.valuxapps.com/api/';
  static const String baseUrlForLocation =
      'https://api.geoapify.com/v1/geocode/reverse';
  static const String login = 'login';
  static const String signUp = 'register';
  static const String logout = 'logout';
  static const String profile = 'profile';
  static const String updateProfile = 'update-profile';
  // static const String resetPassword = 'reset-password';
  static const String changePassword = 'change-password';
  /////////////
  static const String homeData = 'home';
  static const String address = 'addresses';

  static const String cart = 'carts';
  static const String order = 'orders';

  static const String favorites = 'favorites';

  // address lockup api
  static const String addressBaseUrl = 'https://api.tomtom.com/';
}

AuthCubit? authCubit;

class Routes {
  static const String signInAndUpScreen = '/SignInAndUpScreen';
  static const String homeLayoutScreen = '/homeLayoutScreen';
  static const String productScreen = '/productScreen';

  // static const String profile = 'profile';
  // static const String updateProfile = 'update-profile';
  // // static const String resetPassword = 'reset-password';
  // static const String changePassword = 'change-password';
  /////////////

}

class AppStrings {
  static const String themeKey = 'themeKey';
  static const String tokenKey = 'tokenKey';
  static const String locationIdKey = 'locationIdKey';

  static String? locationId;
  static bool? isDarkCashed;
  static String? token;

  // static const String signUpScreen = '/signUpScreen';
  // static const String homeLayoutScreen = '/homeLayoutScreen';
  // static const String profile = 'profile';
  // static const String updateProfile = 'update-profile';
  // // static const String resetPassword = 'reset-password';
  // static const String changePassword = 'change-password';
  /////////////

}
