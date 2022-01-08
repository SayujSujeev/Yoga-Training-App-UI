import 'package:flutter/material.dart';
import 'package:UnivTodo/constants/constants.dart';
import 'package:UnivTodo/data/data.dart';
import 'package:UnivTodo/models/style.dart';


class Todo extends StatelessWidget {
  _buildStyles(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Style style = styles[index];

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
          child: Container(
            margin:
            EdgeInsets.only(top: appPadding * 3, bottom: appPadding * 2),
            width: size.width * 0.4,
            height: size.height * 0.2,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topRight: Radius.circular(100.0)),
                boxShadow: [
                  BoxShadow(
                      color: black.withOpacity(0.3),
                      blurRadius: 20.0,
                      offset: Offset(5, 15))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding / 2,
                      right: appPadding * 3,
                      top: appPadding),
                  child: Text(
                    style.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding / 2,
                      right: appPadding / 2,
                      bottom: appPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            color: black.withOpacity(0.3),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            style.time.toString() + ' Likes',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: black.withOpacity(0.3)),
                            maxLines: 2,
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: blueGrey,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Icon(
                          Icons.add,
                          color: white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top:10,
          child: Container(
            child: Image(
              width: size.width * 0.2,
              height: size.height * 0.2,
              image: AssetImage(style.imageUrl),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding, vertical: appPadding/1.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'KAIST Users',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w800, color: primary),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding / 2),
          child: Container(
            height: size.height * 0.33,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: styles.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildStyles(context, index);
                }),
          ),
        )
      ],
    );
  }
}
