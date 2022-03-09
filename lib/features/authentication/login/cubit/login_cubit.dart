import 'package:bloc/bloc.dart';
import 'package:core_app/features/authentication/login/service/login_service.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  Future<void> login() async {
    _changeLoading();
    await LoginService.instance.login();
    _changeLoading();
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
