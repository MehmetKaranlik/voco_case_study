import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/core/constants/string_keys.dart';
import 'package:voco_case_study/feature/home/model/user_response.dart';
import 'package:voco_case_study/feature/home/service/user_service.dart';
import 'package:voco_case_study/feature/home/view_model/home_view_model.dart';

typedef _ViewModel = StateNotifierProvider<HomeViewModel, HomeState>;

@RoutePage(name: 'HomeScreen')
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late final _ViewModel _viewModel;
  late final IHomeService _service;

  @override
  void initState() {
    super.initState();
    _service = HomeService();
    _viewModel = _ViewModel((ref) => HomeViewModel(service: _service));
  }

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(_viewModel.select((state) => state.users));
    return Scaffold(
      appBar: AppBar(title: const Text(StringKeys.users)),
      body: ref.watch(_viewModel).isLoading
          ? const _LoadingWidget()
          : ListView.separated(
              itemBuilder: (context, index) {
                final user = users?[index];
                if (user == null) return const SizedBox.shrink();
                return _UserTile(user);
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: users?.length ?? 0,
            ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _UserTile extends StatelessWidget {
  const _UserTile(this.user);
  final User user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        foregroundImage: Image.network(user.avatar ?? '').image,
      ),
      title: Text(user.firstName ?? ''),
      subtitle: Text(user.email ?? ''),
    );
  }
}
