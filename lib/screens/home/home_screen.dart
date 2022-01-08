import 'package:UnivTodo/screens/home/components/calendar.dart';
import 'package:UnivTodo/screens/home/components/todo.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:UnivTodo/constants/constants.dart';
import 'package:UnivTodo/screens/home/components/courses.dart';
import 'package:UnivTodo/screens/home/components/custom_app_bar.dart';
import 'package:UnivTodo/screens/home/components/search_bar.dart';
import 'package:UnivTodo/screens/home/components/diff_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selsctedIconIndex = 2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top:appPadding * 2),

        child: Column(
          children: [
            CustomAppBar(),
            Todo(),
            Courses(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: selsctedIconIndex,
        buttonBackgroundColor: Colors.blueGrey,
        height: 60.0,
        color: white,
        onTap: (index) {
          setState(() {
            selsctedIconIndex = index;
          });
        },
        animationDuration: Duration(
          milliseconds: 200,
        ),
        items: <Widget>[
          Icon(Icons.play_arrow_outlined, size: 30,color: selsctedIconIndex == 0 ? white : black,),
          InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              ),
              child: Icon(
                Icons.search, size: 30,color: selsctedIconIndex == 1 ? white : black,
              )
          ),
          Icon(Icons.home_outlined, size: 30,color: selsctedIconIndex == 2 ? white : black,),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DynamicEvent(),
              ),
            ),
            child: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: selsctedIconIndex == 3 ? white : black
            ),
          ),
          Icon(Icons.person_outline, size: 30,color: selsctedIconIndex == 4 ? white : black,),
        ],
      ),
    );
  }
}

