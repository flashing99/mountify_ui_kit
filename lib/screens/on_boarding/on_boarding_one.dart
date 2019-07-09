import 'package:flutter/material.dart';

import '../../util/brand_colors..dart';
import '../../util/brand_text.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//-----------------------------------------------

class OnBoardingOne extends StatefulWidget {
  @override
  _OnBoardingOneState createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  //--
  int _current = 0;

  //**  #################################

  //**  ############ INIT VARS #####################

  static final List<String> imgList = [
    'assets/images/woman-lying-in-a-grass-Stock-Photo.jpg',
    'assets/images/girl-lying-on-grass.jpg',
    'assets/images/woman-lying-in-a-grass-Stock-Photo.jpg',
    'assets/images/girl-lying-on-grass.jpg',
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
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Card(
          margin: EdgeInsets.all(0),
          elevation: 8.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          //--*************** START CARD ***********************
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // --Header
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: ExactAssetImage(
                            'assets/images/profile.jpg',
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Mouallem Mohamed'),
                            Text(
                              '15 min',
                              style: TextStyle(color: Colors.grey.shade400),
                            ),
                          ],
                        )

                        //^^^^^^^
                      ],
                    ),
                  ),

                  //--Content
                  Text(
                    BrandText.getLorem(),
                  ),

                  //--Image
                  SizedBox(
                    height: 8,
                  ),

                  Container(
                    height: 120,
                    child: Image.asset(
                      i,
                      fit: BoxFit.cover,
                      // width: 1000.0,
                      width: double.infinity,
                    ),
                  ),

                  //--Footer
                  ButtonTheme.bar(
                    padding: EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //------- BT 1
                        FlatButton(
                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Colors.grey.shade400,
                                size: 16,
                              ),
                              BrandText.getCardTextFooter(' Like'),
                            ],
                          ),
                        ),
                        //------- BT 2
                        FlatButton(
                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.comment,
                                color: Colors.grey.shade400,
                                size: 16,
                              ),
                              BrandText.getCardTextFooter(' Comment')
                            ],
                          ),
                        ),
                        //------- BT 3
                        FlatButton(
                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                color: Colors.grey.shade400,
                                size: 16,
                              ),
                              BrandText.getCardTextFooter(' Share'),
                            ],
                          ),
                        )
                      ],
                    ),
                  )

                  //
                ],
              ),
            ),
          ),
          //--*************** END CARD ***********************
        ),
      );
    },
  ).toList();
//-----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.getColor(BrandColors.DarkBlue),
      // appBar: AppBar(
      //   title: Text('Onboarding1'),
      // ),
      body: Container(
        //padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .10),
        padding: EdgeInsets.only(top: 48),
        child: Column(
          children: <Widget>[
            //--- Title
            BrandText.getText(BrandTexts.OnBoarding_1_Title, 'New Feeds'),
            //---Content
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
              child: Text(
                BrandText.getLorem(),
                style: TextStyle(
                  color: Colors.white.withOpacity(.75),
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            //******************++++ PAGE VIEW Builder ++++******************* */
            //---Carousel sider withe indicators
            Column(children: [
              CarouselSlider(
                viewportFraction: 0.7,
                items: child,
                autoPlay: true,
                height: 280,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: mapList<Widget>(
                  imgList,
                  (index, url) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Color.fromRGBO(255, 255, 255, 0.9)
                              : Color.fromRGBO(255, 255, 255, 0.4)),
                    );
                  },
                ),
              ),

              //------- TITLE +  RS----------

              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    child: BrandText.getOnboarding_1('REDY TO GET STARTED?'),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                       elevation: 5.0,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.blue.shade900,
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.facebookF,
                                color: Colors.white,
                                //size: 16,
                              ),
                              BrandText.getButtonRsTitle(
                                  ' Login With Facebook'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 8),
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      elevation: 5.0,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.blue.shade400,
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                              //size: 16,
                            ),
                            BrandText.getButtonRsTitle(' Login With Twitter'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
              //--------------
            ]),

            //******************++++ PAGE VIEW Builder ++++******************* */
          ],
        ),
      ),
    );
  }
}
