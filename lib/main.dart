import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './customers_page.dart';
import './home_page.dart';
import './school_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(
      title: "Home page",
    ),
    CustomersPage(
      title: "Business page",
    ),
    SchoolPage(
      title: "School page",
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: GoogleFonts.openSans(
                fontSize: 95, fontWeight: FontWeight.w300, letterSpacing: -1.5),
            headline2: GoogleFonts.openSans(
                fontSize: 59, fontWeight: FontWeight.w300, letterSpacing: -0.5),
            headline3:
                GoogleFonts.openSans(fontSize: 48, fontWeight: FontWeight.w400),
            headline4: GoogleFonts.openSans(
                fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            headline5:
                GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w400),
            headline6: GoogleFonts.openSans(
                fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            subtitle1: GoogleFonts.openSans(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
            subtitle2: GoogleFonts.openSans(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
            bodyText1: GoogleFonts.openSans(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
            bodyText2: GoogleFonts.openSans(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            button: GoogleFonts.openSans(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            caption: GoogleFonts.openSans(
                fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
            overline: GoogleFonts.openSans(
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
          )),
      home: Scaffold(
//        appBar: AppBar(
//          title: Text(
//            "App Header",
//            //widget.title,
//            style: TextStyle(
//                fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
//                fontSize: Theme.of(context).textTheme.headline6.fontSize,
//                fontWeight: Theme.of(context).textTheme.headline6.fontWeight,
//                letterSpacing:
//                    Theme.of(context).textTheme.headline6.letterSpacing,
//                color: Colors.white),
//          ),
//        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
          currentIndex: _selectedPage,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
      //initialRoute: '/',
//      routes: {
//        '/': (context) => HomePage(
//              title: "Home page",
//            ),
//        '/business': (context) => BusinessPage(
//              title: "Business page",
//            ),
//      },
    );
  }
}
