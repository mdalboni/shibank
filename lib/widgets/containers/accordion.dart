import 'package:flutter/material.dart';
import 'package:shibank/theme.dart';

class ChargesAccordion extends StatefulWidget {
  final tagName;
  final color;
  final percentage;
  final animation;

  const ChargesAccordion({
    Key key,
    this.tagName,
    this.color,
    this.percentage,
    this.animation,
  }) : super(key: key);

  @override
  _ChargesAccordionState createState() => _ChargesAccordionState();
}

class _ChargesAccordionState extends State<ChargesAccordion> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.tagName,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: -0.2,
                  color: ColorConstants.darkText,
                ),
              ),
              GestureDetector(
                child: _isActive
                    ? Icon(Icons.keyboard_arrow_down)
                    : Icon(Icons.navigate_next_outlined),
                onTap: () {
                  setState(() {
                    _isActive = !_isActive;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        '${widget.percentage} %',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: ColorConstants.grey.withOpacity(1.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: ((widget.percentage / 1.2) * widget.animation.value),
                    height: 20,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        widget.color,
                        widget.color.withOpacity(0.5),
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  )
                ],
              ),
            ),
          ),
          _isActive
              ? Container(
                  width: MediaQuery.of(context).size.width - 30,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: ColorConstants.grey.withOpacity(0.35),
                          blurRadius: 8.0,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Column(
                    children: [
                      Text('aaaaa'),
                      Text('aaaaa'),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
