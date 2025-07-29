import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wts_task/core/widgets/loading_indicator.dart';

/// Если нужна обводка картинки - указать borderWidth
class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
    this.borderColor = Colors.black,
    this.borderWidth = 0.0,
  });
  static const double defaultSize = 150.0;

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final iconWidth = width ?? defaultSize;
    final iconHeight = height ?? defaultSize;
    final safeIconWidth = iconWidth.isFinite ? iconWidth : defaultSize;
    final safeIconHeight = iconHeight.isFinite ? iconHeight : defaultSize;
    if (imageUrl.trim().isEmpty) {
      return errorWidget ??
          ErrorImageWidget(
            width: safeIconWidth,
            height: safeIconHeight,
            borderRadius: borderRadius,
            borderColor: borderColor,
            borderWidth: borderWidth,
          );
    }
    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ??
          Center(
            child: SizedBox(
              width: safeIconWidth,
              height: safeIconHeight,
              child: const AppLoadingIndicator(),
            ),
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          ErrorImageWidget(
            width: safeIconWidth,
            height: safeIconHeight,
            borderWidth: borderWidth,
            borderColor: borderColor,
            borderRadius: borderRadius,
          ),
    );

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return ContainerWrapper(
      width: width,
      height: height,
      borderColor: borderColor,
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      child: image,
    );
  }
}

class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget({
    required this.width,
    required this.height,
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
    super.key,
  });

  final double width;
  final double height;
  final Color borderColor;
  final double borderWidth;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      width: width,
      height: height,
      borderColor: borderColor,
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      child: Center(
        child: Icon(
          Icons.broken_image,
          size: (width < height ? width : height),
          color: Colors.grey,
        ),
      ),
    );
  }
}

class ContainerWrapper extends StatelessWidget {
  const ContainerWrapper({
    required this.child,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
    super.key,
  });

  final Widget child;
  final double? width;
  final double? height;
  final Color borderColor;
  final double borderWidth;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: borderWidth > 0.0
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
