// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/product/database/locale_database.dart';
import 'package:voco_case_study/product/database/shared_keys.dart';

final userContextProvider =
    StateNotifierProvider<UserContext, UserContextState>((ref) {
  return UserContext(manager: SharedCacheManager.instance);
});

class UserContext extends StateNotifier<UserContextState> {
  UserContext({required this.manager}) : super(const UserContextState());

  final SharedCacheManager manager;

  void setToken(String? token) {
    if (token == null) return;
    state = state.copyWith(token: token);
    manager.setStringValue(SharedKeys.token, token);
  }
}

class UserContextState extends Equatable {
  final String? token;

  const UserContextState({
    this.token,
  });
  @override
  List<Object?> get props => [token];

  UserContextState copyWith({
    String? token,
  }) {
    return UserContextState(
      token: token ?? this.token,
    );
  }
}
