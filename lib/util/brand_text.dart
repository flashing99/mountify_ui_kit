import 'package:flutter/material.dart';

enum BrandTexts { AppText, ForgotPassword, OnBoarding_1_Title, CardTextFooter }

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
        return BrandText.getOnboarding_1(text);
        break;
      case BrandTexts.CardTextFooter:
        return BrandText.getCardTextFooter(text);
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

  static Text getOnboarding_1(text) {
    return Text(
      '$text',
      style: TextStyle(
        color: Colors.white,
        fontSize: 21,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static Text getCardTextFooter(String text) {
    return Text(
      '$text',
      style: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 14,
        //fontWeight: FontWeight.w500,
      ),
    );
  }

  static String getLorem() {
    return "Lorem enim ipsum aliquip ea qui ullamco amet alt occaecat ipsum terppor.";
  }
}
