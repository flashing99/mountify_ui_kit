import 'package:flutter/material.dart';
import './util/brand_colors..dart';

//----------SCREENS ------------
import './screens/on_boarding/on_boarding_one.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BrandColor color = BrandColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: BrandColor.getColor(BrandColors.DarkBlue),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Onboarding type 1'),
            contentPadding: EdgeInsets.all(8),
            leading: Icon(Icons.mobile_screen_share),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                //--------- On Boarding type 1 -------
                return OnBoardingOne();
              }));
            },
          )
        ],
      ),
    );
  }
}
