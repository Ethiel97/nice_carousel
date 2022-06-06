import 'package:flutter/material.dart';
import 'package:nice_carousel/carousel_slide.dart';
import 'package:nice_carousel/carousel_slide_indicator.dart';

enum SlideIndicatorPosition {
  // center,
  right,
  left,
}

enum SlideIndicatorShape {
  circle,
  line,
}

enum SlideTransitionStyle {
  normal,
  translate,
}

class CarouselSlides extends StatefulWidget {
  const CarouselSlides({
    Key? key,
    required this.slides,
    required this.height,
    this.indicatorColor = Colors.white,
    this.textStyle,
    this.indicatorPosition = SlideIndicatorPosition.right,
  }) : super(key: key);

  ///
  /// this is the main color of the indicators
  /// [Color]
  final Color? indicatorColor;

  /// this is the height of the carousel
  /// [String]
  final double height;

  ///
  /// this is the indicator of the carousel
  /// [SlideIndicatorPosition]
  ///
  final SlideIndicatorPosition indicatorPosition;

  ///
  /// list of carousel slides
  /// [List]
  ///
  final List<CarouselSlide> slides;

  ///
  /// this is the text style of the carousel
  /// [TextStyle]
  final TextStyle? textStyle;

  TextStyle get appTextStyle =>
      textStyle ??
      const TextStyle(
        fontFamily: 'packages/nice_carousel/Poppins',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  @override
  State<CarouselSlides> createState() => _CarouselSlidesState();
}

class _CarouselSlidesState extends State<CarouselSlides> {
  late PageController pageController;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    // precac

    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: widget.height,
        child: Stack(
          children: [
            PageView(
              key: const Key("value"),
              controller: pageController,
              children: widget.slides
                  .map(
                    (e) => e..textStyle = widget.appTextStyle,
                  )
                  .toList(),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
            Positioned(
              bottom: 18,
              right: widget.indicatorPosition == SlideIndicatorPosition.right
                  ? 14
                  : null,
              left: widget.indicatorPosition == SlideIndicatorPosition.left
                  ? 14
                  : null,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(widget.slides.length, (_) => (_))
                    .map(
                      (e) => CarouselSlideIndicator(
                        currentPage: currentPage == e,
                        color: widget.indicatorColor,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
}
