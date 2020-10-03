import 'package:flutter/material.dart';

class PrimaryLoadingButton extends StatefulWidget {
  final String text;
  final onClick;

  PrimaryLoadingButton({this.text, this.onClick});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryLoadingButton> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    Text text = Text(
      widget.text,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );

    Widget progress = Container(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2.5,
      ),
      width: 30,
      height: 30,
    );
    return GestureDetector(
      onTap: !isActive ? onClick : () {},
      child: Container(
        child: Center(child: !isActive ? text : progress),
        decoration: BoxDecoration(
          color: Colors.deepPurple[!isActive ? 800 : 100],
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        height: 40,
      ),
    );
  }

  void onClick() async {
    setState(() {
      isActive = true;
    });
    await widget.onClick();
    setState(() {
      isActive = false;
    });
  }
}
