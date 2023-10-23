import 'package:auto_route/auto_route.dart';
import 'package:voco_case_study/feature/home/view/home_view.dart';
import 'package:voco_case_study/feature/login/view/login_view.dart';
import 'package:voco_case_study/feature/splash/view/splash_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route,Screen')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreen.page, initial: true),
        AutoRoute(page: LoginScreen.page),
        AutoRoute(page: HomeScreen.page),
      ];
}
