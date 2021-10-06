import 'package:carousels/config/app_colors.dart';
import 'package:carousels/config/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/card_scroll_widget.dart';

class FirstCarouselView extends StatefulWidget {
  @override
  _FirstCarouselViewState createState() => _FirstCarouselViewState();
}

class _FirstCarouselViewState extends State<FirstCarouselView> {
  double? currentPage = firstCarouselImages.length - 1;

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(initialPage: firstCarouselImages.length - 1);

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });

    return Scaffold(
      backgroundColor: AppColors.middleBlue,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.darkBlue,
                  AppColors.middleBlue,
                ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'The First Carousel',
                  style: TextStyle(color: AppColors.white, fontSize: 30),
                ),
              ),
              SizedBox(height: 30),
              Stack(
                children: [
                  CardScrollWidget(
                    currentPage: currentPage,
                    widgetAspectRatio: (12.0 / 16.0) * 1.2,
                  ),
                  Positioned.fill(
                      child: PageView.builder(
                          itemCount: firstCarouselImages.length,
                          controller: pageController,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container();
                          }))
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Next',
                    style: TextStyle(fontSize: 35, color: AppColors.white),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
