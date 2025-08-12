import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({
    required this.images,
    super.key,
    this.width,
    this.height,
  });

  final List<String> images;
  final double? width;
  final double? height;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = widget.width ?? MediaQuery.sizeOf(context).width;
    final height = widget.height ?? width;
    final hasMultipleImages = widget.images.length > 1;

    if (widget.images.isEmpty) {
      return SizedBox(
        child: Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: const Center(child: Icon(Icons.error_outline)),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enableInfiniteScroll: hasMultipleImages,
              autoPlay: hasMultipleImages,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: widget.images
                .map(
                  (imageUrl) => CustomCachedImage(
                    imageUrl: imageUrl,
                    width: width,
                    height: height,
                    fit: BoxFit.contain,
                  ),
                )
                .toList(),
          ),
        ),
        if (hasMultipleImages)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '${currentIndex + 1}/${widget.images.length}',
              style: AppTextStyles.subtitleProductMedium.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ),
      ],
    );
  }
}
