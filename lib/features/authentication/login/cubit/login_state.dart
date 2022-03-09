part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool? isLoading;
  final bool isInitial;
  

  const LoginState({this.isLoading, this.isInitial=false});


  @override
  List<Object?> get props => [isLoading, isInitial];

  LoginState copyWith({
    bool? isLoading,
    bool? isInitial,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isInitial: isInitial ?? this.isInitial,
    );
  }
}
