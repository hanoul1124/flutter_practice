import 'package:flutter/material.dart';

import 'constants.dart';

class IconCard extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;

  IconCard({Key key, this.cardIcon, this.cardText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          cardText,
          style: labelTextStyle,
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({Key key, @required this.colour, this.cardChild, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
