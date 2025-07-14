import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

class BaseErrorWidget extends StatefulWidget {
  const BaseErrorWidget({
    required this.onPressedButton,
    super.key,
    this.image,
    this.titleError = 'Ошибка загрузки данных',
    this.textError = 'Данные не были загружены, пожалуйста, попробуйте еще раз',
    this.textButton = 'Попробовать снова',
  });

  final VoidCallback onPressedButton;
  final String? image;
  final String titleError;
  final String textError;
  final String textButton;

  @override
  State<BaseErrorWidget> createState() => _BaseErrorWidgetState();
}

class _BaseErrorWidgetState extends State<BaseErrorWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.image != null) Image(image: AssetImage(widget.image!)),
            const SizedBox(height: 30),
            _buildErrorContent(context),
            const SizedBox(height: 30),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.titleError,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLarge.copyWith(fontSize: 20.0),
        ),
        const SizedBox(height: 16),
        Text(
          widget.textError,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(fontSize: 13.0),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () async {
              setState(() {
                isLoading = true;
              });
              widget.onPressedButton.call();
              setState(() {
                isLoading = false;
              });
            },
      child: Text(widget.textButton),
    );
  }
}
