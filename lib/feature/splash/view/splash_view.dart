import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/feature/splash/view_model/splash_view_model.dart';
import 'package:voco_case_study/product/database/locale_database.dart';
import 'package:voco_case_study/product/init/navigation/app_router.dart';

@RoutePage(name: 'SplashScreen')
class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  late final StateNotifierProvider<SplashViewModel, SplashState> _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = StateNotifierProvider<SplashViewModel, SplashState>(
      (ref) => SplashViewModel(manager: SharedCacheManager.instance),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(_viewModel, _listenForNavigate);
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }

  void _listenForNavigate(SplashState? prev, SplashState? next) {
    if (next?.hasCache == true) {
      context.router.replaceAll([const HomeScreen()]);
    } else {
      context.router.replaceAll([const LoginScreen()]);
    }
  }
}
