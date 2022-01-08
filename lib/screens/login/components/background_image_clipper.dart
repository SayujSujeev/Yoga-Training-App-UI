import 'package:flutter/material.dart';
import 'package:UnivTodo/constants/constants.dart';
import 'package:UnivTodo/screens/login/components/curve_clipper.dart';



class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        height: size.height * 0.55,
        color: blueGrey.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding / 2,
              vertical: appPadding * 3),
          child: Center(
            child: Image(
              image: AssetImage('assets/images/todoillustration2.png'),
              height: 340,
              width: 330,
              fit: BoxFit.cover,

            ),
          ),
        ),
      ),
    );
  }
}
