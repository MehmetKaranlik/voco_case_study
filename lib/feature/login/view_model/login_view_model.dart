// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:voco_case_study/feature/login/model/login_model.dart';
import 'package:voco_case_study/feature/login/service/login_service.dart';
import 'package:voco_case_study/product/state/user_context.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel({
    required this.service,
  }) : super(const LoginState());

  final ILoginService service;

  Future<void> login(LoginModel model, UserContext context) async {
    final (result, error) = await service.login(model);
    if (error != null) {
      state = state.copyWith(errorMessage: error.error);
    } else {
      context.setToken(result?.token);
      state = state.copyWith(isComplete: true);
    }
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}

class LoginState extends Equatable {
  const LoginState({
    this.errorMessage,
    this.isComplete = false,
  });

  final String? errorMessage;
  final bool isComplete;

  @override
  List<Object?> get props => [errorMessage, isComplete];

  LoginState copyWith({
    String? errorMessage,
    bool? isComplete,
  }) {
    return LoginState(
      errorMessage: errorMessage,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
