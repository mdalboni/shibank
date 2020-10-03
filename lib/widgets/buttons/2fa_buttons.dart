import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

class AuthButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UnicornDialer(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
        parentButtonBackground: Colors.deepPurple,
        orientation: UnicornOrientation.HORIZONTAL,
        parentButton: Icon(Icons.security),
        parentHeroTag: 'btnFather',
        childButtons: [
          UnicornButton(
            currentButton: FloatingActionButton(
              heroTag: 'btn1',
              backgroundColor: Colors.deepPurple,
              mini: true,
              child: Icon(Icons.face),
              onPressed: () {},
            ),
          ),
          UnicornButton(
            currentButton: FloatingActionButton(
              heroTag: 'btn2',
              backgroundColor: Colors.deepPurple,
              mini: true,
              child: Icon(Icons.select_all),
              onPressed: () {},
            ),
          ),
          UnicornButton(
            currentButton: FloatingActionButton(
              heroTag: 'btn3',
              backgroundColor: Colors.deepPurple,
              mini: true,
              child: Icon(Icons.keyboard_voice),
              onPressed: () {},
            ),
          ),
          UnicornButton(
            currentButton: FloatingActionButton(
              heroTag: 'btn4',
              backgroundColor: Colors.deepPurple,
              mini: true,
              child: Icon(Icons.fiber_pin),
              onPressed: () {},
            ),
          )
        ]);
  }
}
