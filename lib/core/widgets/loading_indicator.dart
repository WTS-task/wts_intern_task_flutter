import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

Widget loadingIndicator() {
  return Center(
    child: SizedBox(
      width: 120,
      height: 120,
      child: CircularProgressIndicator(
        color: AppColors.buttonBgPrimary,
        strokeWidth: 6,
      ),
    ),
  );
}
