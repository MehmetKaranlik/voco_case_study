import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/core/constants/string_keys.dart';
import 'package:voco_case_study/feature/login/model/login_model.dart';
import 'package:voco_case_study/feature/login/service/login_service.dart';
import 'package:voco_case_study/feature/login/view_model/login_view_model.dart';
import 'package:voco_case_study/product/design_system/paddings.dart';
import 'package:voco_case_study/product/design_system/spacer/dynamic_vertical_spacer.dart';
import 'package:voco_case_study/product/design_system/widget_sizes.dart';
import 'package:voco_case_study/product/init/navigation/app_router.dart';
import 'package:voco_case_study/product/state/user_context.dart';
import 'package:voco_case_study/product/utility/validator_items.dart';
import 'package:voco_case_study/product/widget/button/active_button.dart';
import 'package:voco_case_study/product/widget/snackbar/product_snackbar.dart';
import 'package:voco_case_study/product/widget/text_field/product_text_field.dart';

typedef _ViewModel = StateNotifierProvider<LoginViewModel, LoginState>;

@RoutePage(name: 'LoginScreen')
class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with _LoginOperations {
  late final ILoginService _service;
  late final _ViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _service = LoginService();
    _viewModel = _ViewModel((ref) => LoginViewModel(service: _service));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(_viewModel, _listenForError);
    ref.listen<LoginState>(_viewModel, _listenForComplete);
    return Scaffold(
        body: SafeArea(
      child: _FormBody(_viewModel),
    ));
  }

  void _listenForError(LoginState? prev, LoginState? next) {
    final errorMessage = next?.errorMessage;
    if (errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          ProductSnackbar.error(
            error: errorMessage,
            onVisible: ref.read(_viewModel.notifier).clearError,
          ),
        );
    }
  }

  void _listenForComplete(LoginState? prev, LoginState? next) {
    final isCompleted = next?.isComplete;
    if (isCompleted == true) {
      context.router.push(const HomeScreen());
    }
  }
}

class _FormBody extends ConsumerWidget with _LoginOperations {
  _FormBody(this.viewModel);

  final _ViewModel viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _globalKey,
      child: Padding(
        padding: const Paddings.allMedium(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FlutterLogo(size: WidgetSizes.spacingXxl12),
            const VerticalSpace.medium(),
            ProductTextField(
              controller: _emailController,
              hint: StringKeys.email,
              validator: ValidatorItems.validateEmail,
            ),
            const VerticalSpace.standard(),
            ProductTextField(
              controller: _passwordController,
              hint: StringKeys.password,
              validator: ValidatorItems.validatePassword,
            ),
            const VerticalSpace.medium(),
            ActiveButton(
              onPressed: () => _onPressed(ref),
              label: StringKeys.login,
              //  onPressed: _onPressed,
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed(WidgetRef ref) async {
    if (_globalKey.currentState?.validate() == false) return;
    await ref.read(viewModel.notifier).login(
          _loginModel,
          ref.read(userContextProvider.notifier),
        );
  }
}

mixin _LoginOperations {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginModel get _loginModel => LoginModel(
        email: _emailController.text,
        password: _passwordController.text,
      );
}
