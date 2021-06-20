import 'package:flutter/material.dart';

class ReusableCards extends StatelessWidget {

  ReusableCards({@required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15.0),
//color: Colors.blueAccent, if you use boxdecoration we use colr inside that boxDecoration, otherwise it results in error
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          )
      ),
    );
  }
}
