import 'package:flutter/material.dart';

class CarouselSlide extends StatefulWidget {
  ///This is a builder for a carousel slide
  ///
  ///

  ///title of the carousel slide
  ///[String]
  String? title;

  ///description of the carousel slide
  ///[String]
  String? description;

  ///provide a custom content to your carousel slide
  ///[String]
  ///
  Widget? body;

  ///assets from your local assets directory
  ///[String]
  String? imageAsset;

  ///asset fetched over a network
  ///[String]
  String? networkAsset;

  ///[TextStyle]
  TextStyle? textStyle;

  ///
  /// use this constructor if your image asset is provided from your assets directory
  ///
  CarouselSlide({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
    this.textStyle,
  }) {
    assert(networkAsset == null && imageAsset != null);
  }

  ///
  /// use this constructor if your image asset is fetched over a network
  ///
  CarouselSlide.network({
    super.key,
    required this.title,
    required this.description,
    required this.networkAsset,
    this.textStyle,
  }) {
    assert(imageAsset == null && networkAsset != null);
  }

  ///
  /// use this constructor if you want to provide a custom content for your carousel
  ///
  CarouselSlide.custom({
    super.key,
    required this.body,
    required this.imageAsset,
    this.textStyle,
  });

  @override
  State<CarouselSlide> createState() => _CarouselSlideState();
}

class _CarouselSlideState extends State<CarouselSlide> {
  NetworkImage? networkImage;
  AssetImage? assetImage;

  @override
  void initState() {
    if (widget.networkAsset != null) {
      networkImage = NetworkImage(widget.networkAsset!);
    }

    if (widget.imageAsset != null) {
      assetImage = AssetImage(widget.imageAsset!);
    }

    Future.delayed(Duration.zero, () {
      if (widget.networkAsset != null) {
        precacheImage(networkImage!, context);
      } else if (widget.imageAsset != null) {
        precacheImage(assetImage!, context);
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget get content =>
      widget.body != null ? buildCustomCarousel() : buildCarousel();

  DecorationImage get decorationImage => widget.imageAsset != null
      ? DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(.65),
            BlendMode.overlay,
          ),
          image: assetImage!,
          fit: BoxFit.cover,
        )
      : DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(.65),
            BlendMode.overlay,
          ),
          image: networkImage!,
          fit: BoxFit.cover,
        );

  Widget buildCarousel() => Container(
        padding: const EdgeInsets.all(
          14,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.overlay,
          color: Colors.black.withOpacity(
            .85,
          ),
          image: decorationImage,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(
                10,
              ),
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),
              child: Text(
                "${widget.title}",
                textAlign: TextAlign.start,
                style: widget.textStyle?.apply(
                  fontWeightDelta: 2,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              widget.description!,
              textAlign: TextAlign.start,
              style: widget.textStyle?.apply(
                color: Colors.white,
                fontSizeDelta: 12,
                fontWeightDelta: 30,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );

  Widget buildCustomCarousel() => DecoratedBox(
        decoration: BoxDecoration(
          image: decorationImage,
        ),
        child: content,
      );

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),
        child: content,
      );
}
