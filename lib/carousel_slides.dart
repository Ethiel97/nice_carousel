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
  CarouselSlides({
    Key? key,
    required this.slides,
    required this.height,
    this.indicatorColor = Colors.white,
    this.hideIndicator = false,
    this.textStyle,
    this.indicatorPosition = SlideIndicatorPosition.right,
  })  : assert(slides.isNotEmpty),
        super(key: key);

  ///
  /// whether the carousels indicator should be visible or not
  final bool hideIndicator;

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

class _CarouselSlidesState extends State<CarouselSlides>
    with SingleTickerProviderStateMixin {
  late PageController pageController;

  late AnimationController animationController;

  int currentPage = 0;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    pageController = PageController(initialPage: 0)
      ..addListener(() {
        pageOffset = pageController.page!;
      });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    pageController.dispose();
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
              children: widget.slides.map(
                (carouselSlide) {
                  print("SLIDE INDEX $currentPage");
                  /*if (currentPage == pageOffset.floor()) {
                    // print("FROM PAGE ${pageOffset}\n");
                    return carouselSlide
                      ..transformAngle = pageOffset - currentPage;
                  } else if (currentPage == pageOffset.floor() + 1) {
                    // print("TO PAGE ${pageOffset}\n");

                    return carouselSlide
                      ..transformAngle = pageOffset - currentPage
                      ..transformScale = .8;
                  }*/
                  return carouselSlide
                    // ..transformAngle = 0
                    ..textStyle = widget.appTextStyle;
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
            Visibility(
              visible: !widget.hideIndicator,
              child: Positioned(
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
            ),
          ],
        ),
      );
}
