# nice_carousel

Build simple yet beautiful carousels for your mobile apps

## Features

* Carousel slides
* Carousel indicators
* Custom carousel content

![Demo Image](assets/demo.gif)

## Getting started

Add the following to pubspec.yaml:

```yaml
dependencies:
  nice_carousel:
```

## Usage

First, import the following files

```dart
import 'package:nice_carousel/carousel_slide.dart';
import 'package:nice_carousel/carousel_slides.dart';
```

Then, create a list of `CarouselSlide`:

```dart

List<CarouselSlide> carouselSlides = [
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
];
```

You'll come up with a list of nice carousel slides

Finally, pass the slides to an instance of `CarouselSlides`

```dart

CarouselSlides carouselSlides = CarouselSlides(
  indicatorPosition: SlideIndicatorPosition.right,
  slides: slides,
  height: 300,
);

```

## Documentation

### CarouselSlide properties

| Name  |  Type |  Default | Description |
|---|---|---|---|
|  title | `String`  | required if CarouselSlide default constructor is used |Set the title of your carousel slide  |
| description  | `String`  | required if CarouselSlide default constructor is used | Set the description of your carousel slide  |
| imageAsset  | `String`  | required if CarouselSlide default constructor is used | Set the image of your carousel slide |
| networkAsset  |`String`   | required if CarouselSlide.network constructor is used | Set the network image path of your carousel slide |
| body  | `Widget` | required if CarouselSlide.custom constructor is used  | Set a custom body for your carousel |

### CarouselSlides properties

| Name  |  Type |  Default | Description |
|---|---|---|---|
| slides | `List<CarouselSlide>`  | required|list of your carousel slides |
| height  | `double`  | required | Set the height of your carousel slides  |
| indicatorColor  | `Color`  | Colors.white| Set the carousel's indicators colors |
| textStyle  |`TextStyle`  | null  | Set the text style of your carousel|
| indicatorPosition | `SlideIndicatorPosition`  |`SlideIndicatorPosition.right` |  Set the position of the indicators |
| hideIndicator | `bool`  |false |  Set whether the indicators is visible or not|

#### SlideIndicatorPosition enum properties

* SlideIndicatorPosition.left
* SlideIndicatorPosition.right

Now enjoy!

**Refer to [example folder](example/README.md) and the source code for more information.**

### Roadmap

More features coming soon 🔥

### Contact

Ethiel ADIASSA - [Twitter](https://www.twitter.com/enthusiastDev) - ethiel97@gmail.com
- [Website](https://ethieladiassa.me)