import 'package:carousels/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/card_scroll_widget.dart';

class FirstCarouselView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              CardScrollWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
