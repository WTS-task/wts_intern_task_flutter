import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wts_task/core/widgets/loading_indicator.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
  });
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
      placeholder ??
          Center(
            child: SizedBox(
              width: (width ?? 50) / 2,
              height: (height ?? 50) / 2,
              child: AppLoadingIndicator(),
            ),
          ),
      errorWidget: (context, url, error) =>
      errorWidget ??
          Center(
            child: Icon(
              Icons.broken_image,
              size: (width ?? 50) / 2,
              color: Colors.grey,
            ),
          ),
    );

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return image;
  }
}
