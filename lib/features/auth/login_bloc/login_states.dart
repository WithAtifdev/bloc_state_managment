part of 'login_bloc.dart';


class LoginStates extends Equatable {
  final String email;
  final String password;
  final ApiResponse<String> loginApi;

  const LoginStates({this.email = '',this.password = '',
  this.loginApi = const ApiResponse.completed('')});


  LoginStates copyWith({
    String? email,
    String? password,
    ApiResponse<String>? loginApi
  }) {
    return LoginStates(
        email: email ?? this.email,
        password: password ?? this.password,
        loginApi: loginApi ?? this.loginApi
    );
  }

  @override
  List<Object> get props => [email, password, loginApi];
}
