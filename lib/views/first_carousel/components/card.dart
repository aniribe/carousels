import 'dart:math';

import 'package:carousels/config/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> getCards({
  required List<String> images,
  required BoxConstraints constraints,
  required var page,
  required double padding,
}) {
  //The start point of the left side of the card
  var primaryCardLeft = 50;

  //This variable just help to calculate the start point
  var horizontalInset = 25;

  List<Widget> cardLists = [];

  for (int i = 0; i < images.length; i++) {
    var delta = i - page;
    bool isOnRight = delta > 0;

    double start = padding +
        max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1),
            0.0);

    Widget card = createCard(
        delta: delta, start: start, constraints: constraints, index: i);

    cardLists.add(card);
  }

  return cardLists;
}

Widget createCard({
  required var delta,
  required double start,
  required BoxConstraints constraints,
  required int index,
}) {
  double padding = 20;

  return Positioned.directional(
    top: padding + 20 * max(-delta, 0.0),
    bottom: padding + 20 * max(-delta, 0.0),
    start: start,
    textDirection: TextDirection.rtl,
    child: AspectRatio(
      aspectRatio: 12 / 16,
      child: Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
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
              image: AssetImage(firstCarouselImages[index]), fit: BoxFit.cover),
        ),
      ),
    ),
  );
}
