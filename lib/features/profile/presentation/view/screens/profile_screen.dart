import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  ProfileViewModel createModel() {
    final vm = ProfileViewModel(context.read<AuthLocalDataSource>());
    vm.loadItemData().catchError((_) {});
    return vm;
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) =>
      AppBar(title: const Text('Профиль'), centerTitle: true);

  @override
  Widget buildItemDetails(BuildContext context) {
    final user = model.item;
    if (user == null) return const Center(child: CircularProgressIndicator());

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[200],
              child: ClipOval(
                child: user.avatar != null && user.avatar!.isNotEmpty
                    ? CachedNetworkImage(
                  imageUrl: user.avatar!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                )
                    : const Icon(Icons.person, size: 50, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              '${user.name} ${user.lastname}',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              user.dateOfBirth != null
                  ? DateFormat('dd.MM.yyyy').format(user.dateOfBirth!)
                  : 'Дата рождения не указана',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Контакты',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.email),
              const SizedBox(width: 12),
              Text(user.email?.isNotEmpty == true ? user.email! : 'Email не указан'),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Аккаунт',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.push('/profile/orders'),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.inventory),
                SizedBox(width: 12),
                Text('Оформленные заказы'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.push('/profile/chat'),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message),
                SizedBox(width: 12),
                Text('Чат с поддержкой'),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              final result = await context.push('/profile/edit', extra: user);
              if (!mounted) return;
              if (result is User) {
                model.updateItem(result);
              }
            },
            child: const Text('Редактировать профиль'),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () async {
              final auth = context.read<AuthLocalDataSource>();
              await auth.clearTokens();
              if (!mounted) return;
              model.clearItem();
              context.go('/auth/phone');
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
}