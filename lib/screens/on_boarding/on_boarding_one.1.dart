import 'package:flutter/material.dart';

import '../../util/brand_colors..dart';
import '../../util/brand_text.dart';

class OnBoardingOne extends StatefulWidget {
  @override
  _OnBoardingOneState createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  //--

  //**  ############ INIT VARS #####################
  final List<String> onBoardImages = [
    'assets/images/woman-lying-in-a-grass-Stock-Photo.jpg',
    'assets/images/girl-lying-on-grass.jpg',
    'assets/images/woman-lying-in-a-grass-Stock-Photo.jpg',
  ];

  ValueNotifier _currentPageNotifier = ValueNotifier(int);

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentPageNotifier.value = 1;
    _pageController = PageController(
        initialPage: _currentPageNotifier.value,
        keepPage: false,
        viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  //**  #################################

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.getColor(BrandColors.DarkBlue),
      // appBar: AppBar(
      //   title: Text('Onboarding1'),
      // ),
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .10),
        child: Column(
          children: <Widget>[
            //---
            BrandText.getText(BrandTexts.OnBoarding_1_Title, 'New Feed'),
            //---
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
            //---
            Container(
              //******************++++ PAGE VIEW Builder ++++******************* */
              height: 290,
              child: PageView.builder(
                onPageChanged: (value) {
                  /* //----------------------
                  print("*********");
                  print(
                      'current Page ::: $value |  _currentPageNotifier ::: ${_currentPageNotifier.value}');

                  print("*********");
                  setState(() {
                    _currentPageNotifier.value = value;
                  });
                  //----------------------
                */
                },
                physics: BouncingScrollPhysics(),
                pageSnapping:
                    true, // allows us to keep the page at intermediate values
                itemCount: onBoardImages.length,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      //color: index % 2 == 0 ? Colors.blue : Colors.pink,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        elevation: 3.0,
                        //--*************** START CARD ***********************
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 0),
                          child: Column(
                            children: <Widget>[
                              //--Header
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Mouallem Mohamed'),
                                        Text(
                                          '15 min',
                                          style: TextStyle(
                                              color: Colors.grey.shade400),
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
                                  onBoardImages[index],
                                  fit: BoxFit.cover,
                                  //height: 150,
                                  width: double.infinity,
                                ),
                              ),

                              //--Footer
                              ButtonTheme.bar(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          BrandText.getCardTextFooter(
                                              ' Comment')
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

                                // make buttons use the appropriate styles for cards
                                // child: ButtonBar(
                                //   children: <Widget>[
                                //     FlatButton(
                                //       child: Text('BUY TICKETS'),
                                //       onPressed: () {/* ... */},
                                //     ),
                                //   ],
                                // ),
                              ),

                              //
                            ],
                          ),
                        ),
                        //--*************** END CARD ***********************
                      ),
                    ),
                  );
                },
              ),
            )
            //   child: PageView(
            //       controller: _pageController,
            //       scrollDirection: Axis.horizontal,
            //       children: onBoardImages.map((e) {
            //         print(e);
            //         return Container(
            //           color: Colors.indigo,
            //           width: 200,
            //           height: 100,
            //           child: Center(child: Text(e)),
            //         );
            //       }).toList()),
            // ),
          ],
        ),
      ),
    );
  }
}
