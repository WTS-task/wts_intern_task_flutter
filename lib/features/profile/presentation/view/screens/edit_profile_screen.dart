import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/core/page/base_form_page_state.dart';
import 'package:wts_task/features/profile/presentation/view_models/edit_profile_view_model.dart';

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
    final ImageProvider<Object>? avatarImage = vm.newAvatarPath != null
        ? FileImage(File(vm.newAvatarPath!))
        : (vm.avatar != null && vm.avatar!.isNotEmpty
        ? CachedNetworkImageProvider(vm.avatar!)
        : null);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Center(
            child: GestureDetector(
              onTap: () async {
                final picker = ImagePicker();
                final pickedFile = await picker.pickImage(
                  source: ImageSource.gallery,
                  maxWidth: 800,
                  maxHeight: 800,
                  imageQuality: 80,
                );
                if (pickedFile != null) {
                  vm.setAvatar(pickedFile.path);
                }
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                backgroundImage: avatarImage,
                child: avatarImage == null
                    ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            initialValue: vm.name,
            decoration: const InputDecoration(labelText: 'Имя'),
            validator: (v) =>
            (v?.trim().isEmpty ?? true) ? 'Введите имя' : null,
            onSaved: (v) => vm.name = v!.trim(),
          ),
          const SizedBox(height: 12),
          TextFormField(
            initialValue: vm.lastname,
            decoration: const InputDecoration(labelText: 'Фамилия'),
            onSaved: (v) => vm.lastname = v?.trim() ?? '',
          ),
          const SizedBox(height: 12),
          TextFormField(
            initialValue: vm.email,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (v) =>
            (v != null && v.contains('@')) ? null : 'Некорректный email',
            onSaved: (v) => vm.email = v!.trim(),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: vm.dateOfBirth ?? DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                vm.setDateOfBirth(pickedDate);
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Дата рождения',
                ),
                controller: TextEditingController(
                  text: vm.dateOfBirth != null
                      ? "${vm.dateOfBirth!.day.toString().padLeft(2, '0')}.${vm.dateOfBirth!.month.toString().padLeft(2, '0')}.${vm.dateOfBirth!.year}"
                      : '',
                ),
                validator: (v) =>
                (vm.dateOfBirth == null) ? 'Выберите дату' : null,
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => trySubmitForm(context),
            child: const Text('Сохранить изменения'),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> submitForm() async {
    final vm = context.read<EditProfileViewModel>();
    final updatedUser = await vm.saveProfile();

    if (!mounted) return;

    if (updatedUser.avatar != null && updatedUser.avatar!.isNotEmpty) {
      await CachedNetworkImage.evictFromCache(updatedUser.avatar!);
    }

    if (!mounted) return;

    if (!mounted) return;

    if (updatedUser.avatar != null && updatedUser.avatar!.isNotEmpty) {
      await CachedNetworkImage.evictFromCache(updatedUser.avatar!);
    }

    showMessage('Профиль обновлён');
    if (mounted) context.pop(updatedUser);
  }
}