import 'package:flutter/cupertino.dart';

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
    return Container();
  }
}
