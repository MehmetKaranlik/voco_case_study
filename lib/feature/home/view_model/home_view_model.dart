// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:voco_case_study/feature/home/model/user_response.dart';
import 'package:voco_case_study/feature/home/service/user_service.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel({
    required this.service,
  }) : super(const HomeState()) {
    _init();
  }

  final IHomeService service;

  Future<void> _init() async {
    final userResp = await service.fetchUsers();
    if (userResp != null) {
      state = state.copyWith(users: userResp.data, isLoading: false);
    }
  }
}

class HomeState {
  const HomeState({
    this.isLoading = true,
    this.users,
  });

  final bool isLoading;
  final List<User>? users;

  HomeState copyWith({
    bool? isLoading,
    List<User>? users,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }
}
