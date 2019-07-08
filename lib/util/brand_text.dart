import 'package:flutter/material.dart';

enum BrandTexts { AppText, ForgotPassword, OnBoarding_1_Title }

class BrandText {
  static Widget getText(BrandTexts reqierdText, [String text = '']) {
    switch (reqierdText) {
      case BrandTexts.AppText:
        return BrandText.getAppName();
        break;
      case BrandTexts.ForgotPassword:
        return BrandText.getForgotPassword();
        break;
      case BrandTexts.OnBoarding_1_Title:
        return BrandText.getOnboarding_1();
        break;
      // case BrandTexts.Lorem :
      // return BrandText.getLorem();
      // break;
    }
    return null;
  }

  static Text getAppName() {
    return Text(
      'AppName',
      style: TextStyle(),
    );
  }

  static Text getForgotPassword() {
    return Text(
      'Forgot your Password',
      style: TextStyle(),
    );
  }

  static Text getOnboarding_1() {
    return Text(
      'News Feed',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static String getLorem() {
    return "Culpa enim ipsum aliquip ea qui ullamco amet id occaecat ipsum amet laborum esse tempor.";
  }
}
