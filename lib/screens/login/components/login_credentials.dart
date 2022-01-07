import 'package:flutter/material.dart';
import 'package:UnivTodo/constants/constants.dart';
import 'package:UnivTodo/screens/home/home_screen.dart';



class LoginCredentials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' Login Page',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: size.height * 0.045,
          ),
          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                    vertical: appPadding * 0.75,
                    horizontal: appPadding),
                fillColor: white,
                hintText: 'Email',
                suffixIcon: Icon(
                  Icons.email_outlined,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                    vertical: appPadding * 0.75,
                    horizontal: appPadding),
                fillColor: Colors.white,
                hintText: 'Password',
                suffixIcon: Icon(
                  Icons.lock_outline,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.05,
          ),

          Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  ),
                  child: Material(
                      elevation: 10.0,
                      shadowColor: blueGrey.withOpacity(0.65),
                      color: blueGrey.withOpacity(0.65),
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        width: size.width*0.42,
                        height: size.width * 0.13,
                        child: Center(
                          child: Text(
                            '카카오톡 로그인',
                            style: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ),

                SizedBox(
                  width: size.width * 0.025,
                ),

                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  ),
                  child: Material(
                      elevation: 10.0,
                      shadowColor: blueGrey.withOpacity(0.65),
                      color: blueGrey.withOpacity(0.65),
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        width: size.width*0.42,
                        height: size.width * 0.13,
                        child: Center(
                          child: Text(
                            '접속하기',
                            style: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),

          )

        ],
      ),
    );
  }
}