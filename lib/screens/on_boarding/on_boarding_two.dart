import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mountify_ui_kit/util/brand_colors..dart';
import 'package:mountify_ui_kit/util/brand_text.dart';

class OnBoardingTwo extends StatefulWidget {
  @override
  _OnBoardingTwoState createState() => _OnBoardingTwoState();
}

class _OnBoardingTwoState extends State<OnBoardingTwo> {
  int _current = 0;

  //**  ############ INIT VARS #####################

  static final List<String> imgList = [
    'assets/images/onboard_2_image1.jpg',
    'assets/images/onboard_2_image2.jpg',
    'assets/images/onboard_2_image3.jpg',
  ];
  //-----------------------------------------------
  static List<T> mapList<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final List child = mapList<Widget>(
    imgList,
    (index, i) {
      return Card(
        margin: EdgeInsets.all(24),

        elevation: 8.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        //--*************** START CARD ***********************
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                //  height: 300,
                child: Image.asset(
                  i,
                  fit: BoxFit.cover,
                  // width: 1000.0,
                  width: double.infinity,
                  height: 380,
                ),
              ),
              //--- Title
              Padding(
                padding: const EdgeInsets.all(16),
                child: BrandText.getText(BrandTexts.OnBoarding_1_Title,
                    'What will you do?', Colors.black87),
              ),
              //--Content
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  BrandText.getLorem(),
                  textAlign: TextAlign.center,
                ),
              ),

              //--Image
            ],
          ),
        ),
        //--*************** END CARD ***********************
      );
    },
  ).toList();
//**  ############ END VARS #####################
  @override
  Widget build(BuildContext context) {
    //---------------------------

    final basicCarouselSlider = CarouselSlider(
      viewportFraction: 1.0,
      //enableInfiniteScroll: true,
      items: child,
      autoPlay: false,
      height: MediaQuery.of(context).size.height * 0.8,
      enlargeCenterPage: true,
      aspectRatio: 2.0,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
    );

    //---------------------------
    return Scaffold(
      backgroundColor: BrandColor.getColor(BrandColors.DarkBlue),
      // appBar: AppBar(
      //   title: Text('Onboarding1'),
      // ),
      body: Container(
        //height: 400,
        //color: Colors.cyan,
        //padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .10),
        padding: EdgeInsets.only(top: 48),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Flexible(
            flex: 9,
            //**-------- CAROUSEL --------------- */

            child: basicCarouselSlider,

            //**---------------------------------- */
          ),

          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              // padding: const EdgeInsets.only(
              //     top: 24, bottom: 24, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //------- Button Skipe ----------
                  MaterialButton(
                    // color: Colors.transparent,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: BrandText.getText(
                        BrandTexts.OnBoarding_1_Title, 'Skipe'),
                  ),

                  //------- NAVIGATION INDIGATOR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: mapList<Widget>(
                      imgList,
                      (index, url) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(255, 255, 255, 0.9)
                                  : Color.fromRGBO(255, 255, 255, 0.4)),
                        );
                      },
                    ),
                  ),

                  //------- Button Next ----------
                  MaterialButton(
                    onPressed: () {
                      print(_current);
                      //--------------------------
                      basicCarouselSlider.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut);
                      //---------------------------
                    },
                    child: BrandText.getText(
                        BrandTexts.OnBoarding_1_Title, 'Next'),
                  ),
                ],
              ),
            ),
          )
          //--------------
        ]),
      ),
    );
  }
}
