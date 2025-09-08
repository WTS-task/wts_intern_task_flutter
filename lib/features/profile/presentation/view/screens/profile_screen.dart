import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:wts_task/core/entities/user.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/page/base_item_details_page_state.dart';

class ProfileScreen extends BasePage {
  const ProfileScreen({super.key}) : super(title: 'Профиль');

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState
    extends BaseItemDetailsPageState<ProfileScreen, ProfileViewModel> {
  @override
  ProfileViewModel createModel() =>
      ProfileViewModel(context.read<AuthLocalDataSource>());

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) =>
      AppBar(title: const Text('Профиль'), centerTitle: true);

  @override
  Widget buildItemDetails(BuildContext context) {
    final User user = model.item!;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if ((user.avatar ?? '').isNotEmpty)
            CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(user.avatar!),
            ),
          const SizedBox(height: 16),
          _infoRow('Имя', user.name),
          _infoRow('Фамилия', user.lastname),
          _infoRow('Email', user.email),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.push(
              '/profile/edit',
              extra: model.item,
            ),
            child: const Text('Редактировать'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.push('/profile/orders'),
            child: const Text('Мои заказы'),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () async {
              final auth = context.read<AuthLocalDataSource>();
              await auth.clearTokens();
              context.go('/auth/phone'); // очищаем стек и переходим на экран авторизации
            },
            icon: const Icon(Icons.logout),
            label: const Text('Выйти'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String? value) {
    final display = (value?.isNotEmpty == true) ? value! : 'Не указано';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(display)),
        ],
      ),
    );
  }
}
