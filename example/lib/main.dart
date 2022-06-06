import 'package:flutter/material.dart';
import 'package:nice_carousel/carousel_slide.dart';
import 'package:nice_carousel/carousel_slides.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Custom Carousel',
      home: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 200,
            ),
            CarouselSlides(
              indicatorPosition: SlideIndicatorPosition.right,
              slides: [
                CarouselSlide(
                  title: '80% off',
                  description: 'Free\ndiscount'.toUpperCase(),
                  imageAsset: 'assets/img/1.webp',
                ),
                CarouselSlide(
                  title: '60% off',
                  description: 'Buy\nonline now'.toUpperCase(),
                  imageAsset: 'assets/img/2.webp',
                ),
                CarouselSlide(
                  title: '50% off',
                  description: 'Grab\ndeals now'.toUpperCase(),
                  imageAsset: 'assets/img/3.webp',
                ),
                CarouselSlide(
                  title: '20% off',
                  description: 'Shop\nonline now'.toUpperCase(),
                  imageAsset: 'assets/img/4.webp',
                ),
              ],
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
