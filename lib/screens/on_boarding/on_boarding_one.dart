import 'package:flutter/material.dart';

import '../../util/brand_colors..dart';
import '../../util/brand_text.dart';

class OnBoardingOne extends StatefulWidget {
  @override
  _OnBoardingOneState createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.getColor(BrandColors.DarkBlue),
      // appBar: AppBar(
      //   title: Text('Onboarding1'),
      // ),
      body: Center(
          child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .10),
        child: Column(
          children: <Widget>[
            BrandText.getText(BrandTexts.OnBoarding_1_Title),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                BrandText.getLorem(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
