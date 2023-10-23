import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/core/constants/string_keys.dart';
import 'package:voco_case_study/product/init/application/application_init.dart';
import 'package:voco_case_study/product/init/navigation/app_router.dart';

void main() async {
  await ApplicationInit.init();
  runApp(const ProviderScope(child: MyApp()));
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      title: StringKeys.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
