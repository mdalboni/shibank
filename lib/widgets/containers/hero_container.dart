import 'package:flutter/material.dart';

class HeroContainer extends StatefulWidget {
  final String tag;
  final Widget body;

  const HeroContainer({Key key, this.tag, this.body}) : super(key: key);

  @override
  _HeroContainerState createState() => _HeroContainerState();
}

class _HeroContainerState extends State<HeroContainer> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.deepPurple[500],
        ),
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 15
        ),
        padding: EdgeInsets.all(15),
        child: widget.body,
      ),
      tag: widget.tag,
    );
  }
}
