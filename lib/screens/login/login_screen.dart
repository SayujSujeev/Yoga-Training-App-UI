import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:UnivTodo/screens/login/components/background_image_clipper.dart';
import 'package:UnivTodo/screens/login/components/circle_button.dart';
import 'package:UnivTodo/screens/login/components/login_credentials.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackgroundImage(),
                LoginCredentials(),

                SizedBox(
                  height: size.height * 0.035,
                ),

                Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 50.0,
                        width: 300.0,
                        child: TextButton.icon(

                            icon: Icon(Icons.favorite, size: 14),
                            label: Text("Univ TODO")
                        )
                    )
                )
              ],
            )
            //CircleButton()
          ],
        ),
      ),
    );
  }
}