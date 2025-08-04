import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
    this.controller,
    this.focusNode,
  });
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () => focusNode?.requestFocus(),
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: 'Поиск товаров',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onChanged: onChanged,
    );
  }
}
