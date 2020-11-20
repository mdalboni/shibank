import 'package:flutter/material.dart';

class DragFatherWidget extends StatefulWidget {
  @override
  _DragFatherWidgetState createState() => _DragFatherWidgetState();
}

class _DragFatherWidgetState extends State<DragFatherWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.deepPurple,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Draggable(
                  childWhenDragging: Container(
                    child: Column(
                      children: [Text('----')],
                    ),
                  ),
                  feedback: Container(
                    height: 50,
                    width: 50,
                    child: Column(
                      children: [
                        Text(
                          'Item 1',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          'blau',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  data: {'name': 'Item 1', 'tag': 'blau'},
                  child: Container(
                    child: Column(
                      children: [Text('Item 1'), Text('blau')],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(),
          ),
        ],
      ),
    );
  }
}
