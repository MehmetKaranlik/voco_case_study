// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:voco_case_study/product/database/locale_database.dart';
import 'package:voco_case_study/product/database/shared_keys.dart';

class SplashViewModel extends StateNotifier<SplashState> {
  SplashViewModel({
    required this.manager,
  }) : super(const SplashState()) {
    _init();
  }

  final SharedCacheManager manager;

  Future<void> _init() async {
    final token = await checkCache();
    if (token == null) {
      _setHasCache(false);
    } else {
      _setHasCache(true);
    }
  }

  Future<String?> checkCache() async {
    return manager.stringValue(SharedKeys.token);
  }

  void _setHasCache(bool hasCache) {
    state = state.copyWith(hasCache: hasCache);
  }
}

class SplashState extends Equatable {
  const SplashState({
    this.hasCache,
  });

  final bool? hasCache;
  @override
  List<Object?> get props => [hasCache];

  SplashState copyWith({
    bool? hasCache,
  }) {
    return SplashState(
      hasCache: hasCache ?? this.hasCache,
    );
  }
}
