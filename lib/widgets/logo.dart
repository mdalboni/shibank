import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/logo.png',
            height: MediaQuery.of(context).size.height * 0.20,
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
