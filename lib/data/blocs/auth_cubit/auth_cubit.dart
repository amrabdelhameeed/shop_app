import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../constants/app_strings.dart';
import '../../models/user_response.dart';
import '../../../utils/cashe_helper.dart';
import '../../../utils/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  UserResponse? userResponse;

  Future getUser() async {
    await DioHelper.getData(url: ApiStrings.profile).then((value) {
      userResponse = UserResponse.fromJson(value.data);
    });
    print(userResponse!.data.name);

    emit(GetUserProfileState(userResponse!));
  }

  Future updateProfile(
      {String? name, String? phone, String? email, String? password}) async {
    // print(userResponse!.data.email);
    await DioHelper.putData(
      url: ApiStrings.updateProfile,
      data: password == null
          ? {
              'email': email ?? userResponse!.data.email,
              'phone': phone ?? userResponse!.data.phone,
              'name': name ?? userResponse!.data.name,
              'image': ''
            }
          : {
              'password': password,
              'email': email ?? userResponse!.data.email,
              'phone': phone ?? userResponse!.data.phone,
              'name': name ?? userResponse!.data.name,
              'image': ''
            },
    ).then((value) {
      print(value);
      getUser();
      emit(UpdateProfileState(value.data['message']));
    });
  }
  //   Future updatePassword({
  //   String ?password
  // }) async {
  //   await DioHelper.putData(
  //     url: ApiStrings.profile,
  //     data: {
  //       'password':password,
  //     },
  //   );
  // }

  Future signUp(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    emit(LoadingState());
    await DioHelper.postData(
      url: ApiStrings.signUp,
      data: {
        'email': email,
        'name': name,
        'password': password,
        'phone': phone
      },
    ).then((value) {
      print(value.data['status']);
      if (value.data['status'].toString() == 'true') {
        print(value.data['data']['token']);
        CasheHelper.setStr(
            key: AppStrings.tokenKey, text: value.data['data']['token']);
        AppStrings.token = value.data['data']['token'];
        emit(SignUpSuccessState(value.data['message']));
      } else if (value.data['status'].toString() == 'false') {
        emit(SignUpErrorState(value.data['message']));
      }
    });
  }

  Future signIn({
    required String email,
    required String password,
  }) async {
    emit(LoadingState());
    await DioHelper.postData(
      url: ApiStrings.login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data['status']);
      if (value.data['status'].toString() == 'true') {
        print(value.data['data']['token']);
        CasheHelper.setStr(
            key: AppStrings.tokenKey, text: value.data['data']['token']);
        AppStrings.token = value.data['data']['token'];
        emit(SignInSuccessState(value.data['message']));
      } else if (value.data['status'].toString() == 'false') {
        emit(SignInErrorState(value.data['message']));
      }
    });
  }

  signOut() {
    CasheHelper.setStr(key: AppStrings.tokenKey, text: '').then((value) {
      emit(SignOutState());
    });
    CasheHelper.setStr(key: AppStrings.locationIdKey, text: '');
  }
}
