import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final height;

  const Logo({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height + 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fill,
            height: height - 25,
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Text(
            'v 0.0.0',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
