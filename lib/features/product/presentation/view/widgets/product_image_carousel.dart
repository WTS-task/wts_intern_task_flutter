import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({
    super.key,
    required this.images,
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
    final width = widget.width ?? MediaQuery.of(context).size.width;
    final height = widget.height ?? width;

    if (widget.images.isEmpty) {
      return SizedBox(
        width: width,
        height: height,
        child: Container(
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
              initialPage: 0,
              enableInfiniteScroll: widget.images.length > 1,
              autoPlay: widget.images.length > 1,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: widget.images.map((imageUrl) {
              return Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                child: CustomCachedImage(
                  imageUrl: imageUrl,
                  width: width,
                  height: height,
                  fit: BoxFit.contain,
                ),
              );
            }).toList(),
          ),
        ),
        if (widget.images.length > 1)
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
