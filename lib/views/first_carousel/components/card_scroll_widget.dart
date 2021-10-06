import 'package:carousels/config/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card.dart';

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  final double padding;
  final double verticalInset;
  final double widgetAspectRatio;

  CardScrollWidget(
      {required this.currentPage,
      required this.widgetAspectRatio,
      this.padding = 20,
      this.verticalInset = 20});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: getCards(
              images: firstCarouselImages,
              page: currentPage,
              padding: padding,
              constraints: constraints,
            ),
          );
        },
      ),
    );
  }
}
