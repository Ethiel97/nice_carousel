import 'package:flutter/material.dart';

class CarouselSlideIndicator extends StatelessWidget {
  final bool currentPage;

  final Color? color;

  const CarouselSlideIndicator({
    Key? key,
    this.color = Colors.white,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),
        clipBehavior: Clip.none,
        margin: const EdgeInsets.all(2),
        height: currentPage ? 24 : 8,
        width: currentPage ? 6 : 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              100,
            ),
            color:
                currentPage ? color?.withOpacity(.9) : color?.withOpacity(.5)
            // shape: BoxShape.circle,
            ),
      );
}
