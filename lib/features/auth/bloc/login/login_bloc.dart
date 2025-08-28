import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talking_app/features/auth/bloc/login/login_event.dart';
import 'package:talking_app/features/auth/bloc/login/login_state.dart';
import 'package:talking_app/features/auth/model/login_model.dart';
import 'package:talking_app/features/auth/repository/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final model = LoginModel(email: event.email, password: event.password);
      final result = await repository.login(model);
      if (result) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Login failed"));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
