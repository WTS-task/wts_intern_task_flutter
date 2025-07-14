import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.height = 40,
    this.width = 40,
    this.strokeWidth = 4.0,
    this.needShowOverlay = false,
    this.margin = EdgeInsets.zero,
    this.cupertinoRadiusRadius = 25,
  });

  final bool needShowOverlay;
  final EdgeInsets margin;
  final double cupertinoRadiusRadius;
  final double width;
  final double height;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    if (needShowOverlay) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          buildLoader(),
          Container(
            color: Colors.black.withValues(alpha: .2),
            height: double.infinity,
            width: double.infinity,
          ),
        ],
      );
    }
    return buildLoader();
  }

  Widget buildLoader() {
    if (Platform.isAndroid) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: margin,
            width: width,
            height: height,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              color: AppColors.primaryText,
            ),
          ),
        ],
      );
    }
    return Container(
      margin: margin,
      child: CupertinoActivityIndicator(
        radius: cupertinoRadiusRadius,
        color: AppColors.primaryText,
      ),
    );
  }
}
