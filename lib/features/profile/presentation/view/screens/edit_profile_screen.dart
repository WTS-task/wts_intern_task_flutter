// lib/features/profile/presentation/view/screens/edit_profile_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/page/base_form_page_state.dart';
import 'package:wts_task/features/profile/presentation/view_models/edit_profile_view_model.dart';
import 'package:wts_task/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';

class EditProfileScreen extends BasePage {
  const EditProfileScreen({super.key}) : super(title: 'Редактировать профиль');

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState
    extends BaseFormPageState<EditProfileScreen, EditProfileViewModel> {
  @override
  EditProfileViewModel createModel() {
    return context.read<EditProfileViewModel>();
  }

  @override
  Widget buildForm(BuildContext context) {
    final vm = context.watch<EditProfileViewModel>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          TextFormField(
            initialValue: vm.name,
            decoration: const InputDecoration(labelText: 'Имя'),
            validator: (v) => (v?.trim().isEmpty ?? true) ? 'Введите имя' : null,
            onSaved:   (v) => vm.name     = v!.trim(),
          ),
          const SizedBox(height: 12),
          TextFormField(
            initialValue: vm.lastname,
            decoration: const InputDecoration(labelText: 'Фамилия'),
            onSaved:   (v) => vm.lastname = v?.trim() ?? '',
          ),
          const SizedBox(height: 12),
          TextFormField(
            initialValue: vm.email,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (v) =>
            (v != null && v.contains('@')) ? null : 'Некорректный email',
            onSaved:   (v) => vm.email    = v!.trim(),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => trySubmitForm(context),
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> submitForm() async {
    final vm = context.read<EditProfileViewModel>();
    await vm.submitData();
    // По необходимости: можно перезагрузить ProfileViewModel, если нужно.
    await context.read<ProfileViewModel>().reloadData();
    showMessage('Профиль обновлён');
    context.pop();
  }
}