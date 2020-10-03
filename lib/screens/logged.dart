import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shibank/models/user.dart';
import 'package:shibank/widgets/containers/hero_container.dart';

class LoggedPage extends StatefulWidget {
  @override
  _LoggedPageState createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> {
  User user;

  @override
  void initState() {
    super.initState();
    user = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.white,
              ),
            ),
            Positioned.fill(
              top: 0,
              child: Container(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        HeroContainer(
                          tag: 'balance',
                          body: Text('Show'),
                        ),
                        HeroContainer(
                          tag: 'statements',
                        ),
                        HeroContainer(
                          tag: 'credit',
                        ),
                        HeroContainer(
                          tag: '2fa',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                width: frameWidth(context),
                height: 65,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text('Olá,'),
                          Text(user.name),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 2,
                      child: Container(),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: (frameWidth(context) - 80) / 2,
              child: Hero(
                tag: 'logo',
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black12,
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'images/logo.png',
                    height: 80,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double frameWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
