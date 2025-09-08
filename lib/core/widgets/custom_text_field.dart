import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    this.label,
    this.formatter,
    this.validator,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.maxLength = 100,
    this.hintText,
    this.labelText,

    super.key,
  });

  final String? label;
  final TextEditingController controller;
  final MaskTextInputFormatter? formatter;
  final FormFieldValidator<String>? validator;
  final TextInputType inputType;
  final int maxLines;
  final int maxLength;
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label!, style: AppTextStyles.bodyMedium),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            errorMaxLines: 2,
            helperText: ' ',
          ),
          buildCounter:
              (
                _, {
                required currentLength,
                required isFocused,
                required maxLength,
              }) => null,
          style: AppTextStyles.textFieldText,
          controller: controller,
          inputFormatters: [?formatter],
          validator: validator,
          keyboardType: inputType,
          cursorColor: AppColors.buttonBgPrimary,
          maxLines: maxLines,
          maxLength: maxLength,
        ),
      ],
    );
  }
}
