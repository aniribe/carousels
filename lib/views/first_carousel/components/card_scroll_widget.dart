import 'dart:math';

import 'package:carousels/config/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            children: getCards(firstCarouselImages, constraints.maxHeight,
                constraints.maxWidth, currentPage, padding),
          );
        },
      ),
    );
  }
}

List<Widget> getCards(List<String> images, double height, double width,
    var page, double padding) {
  print('PAGE: $page');

//  var widthOfPrimaryCard = (height - 2 * padding) * (12.0 / 16.0);
//  var widthOfPrimaryCard = 0;

//  print('widthOfPrimaryCard: $widthOfPrimaryCard');

//  var primaryCardLeft = (width - 2 * padding) - widthOfPrimaryCard;
  var primaryCardLeft = 50;
  var horizontalInset = primaryCardLeft / 2;

  List<Widget> cardLists = [];

  for (int i = 0; i < images.length; i++) {
    var delta = i - page;
    bool isOnRight = delta > 0;

    var start = padding +
        max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1),
            0.0);

    print(
        'max: ${max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0)}');
    print('delta: ${-delta}');
    print('start: $start');

    Widget card = Positioned.directional(
      top: padding + 20 * max(-delta, 0.0),
      bottom: padding + 20 * max(-delta, 0.0),
      start: start,
      textDirection: TextDirection.rtl,
      child: AspectRatio(
        aspectRatio: 12 / 16,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: -10,
                blurRadius: 10,
                offset: Offset(0, 15),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(images[i]), fit: BoxFit.cover),
          ),
        ),
      ),
    );

    cardLists.add(card);
  }

  return cardLists;
}
