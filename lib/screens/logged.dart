import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shibank/models/user.dart';
import 'package:shibank/theme.dart';
import 'package:shibank/utils/shibank_icons_icons.dart';
import 'package:shibank/widgets/containers/credit_stats_container.dart';
import 'package:shibank/widgets/containers/hero_container.dart';

class LoggedPage extends StatefulWidget {
  @override
  _LoggedPageState createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> with TickerProviderStateMixin {
  User user;
  int selected = 0;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    user = Get.arguments;
    animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
      body: SizedBox.expand(child: pageRedirect(context)),
    );
  }

  Widget pageRedirect(context) {
    switch (selected) {
      case 0:
        return homePage();
      case 3:
        return Container(
          color: Colors.deepPurple,
          height: MediaQuery.of(context).size.height,
        );
      case 2:
        return Container(
          color: Colors.grey,
          height: MediaQuery.of(context).size.height,
        );
      case 1:
        animationController.reset();
        animationController.forward();
        return Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          child: CreditStatsContainer(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: animationController,
                    curve: Interval((1 / 9) * 1, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: animationController,
            creditCard: user.creditCard,
          ),
        );
      default:
        return Container();
    }
  }

  Container homePage() {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeroContainer(
                tag: 'balance',
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
    );
  }

  AppBar createAppBar(BuildContext context) {
    Widget firstColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Olá,',
          style: TextStyle(fontSize: 10),
        ),
        AutoSizeText(
          user.name,
          maxLines: 1,
          minFontSize: 13,
          overflow: TextOverflow.fade,
        ),
      ],
    );

    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        padding: EdgeInsets.only(top: 15),
        width: frameWidth(context),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: firstColumn,
            ),
            middleLogo(),
            Expanded(
              flex: 2,
              child: buttonsRow(),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector middleLogo() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = 0;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected(0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.only(top: 0, left: 15, right: 15),
        height: 40,
        width: 40,
        child: Hero(
          child: Image.asset(
            'assets/images/logo.png',
          ),
          tag: 'logo',
        ),
      ),
    );
  }

  Row buttonsRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appBarButtons(Icons.bar_chart, 1),
        appBarButtons(ShibankIcons.exchange, 2),
        appBarButtons(ShibankIcons.fingerprint, 3),
      ],
    );
  }

  Container appBarButtons(IconData icon, int index) {
    return Container(
      width: 40,
      height: 40,
      child: RaisedButton(
        child: Center(
          child: Icon(
            icon,
            color: isSelectedIcon(index),
          ),
        ),
        padding: EdgeInsets.all(0),
        focusElevation: 0,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: isSelected(index),
        onPressed: () {
          setState(() {
            selected = index;
          });
        },
      ),
    );
  }

  Color isSelected(int index) {
    return index == selected ? ColorConstants.nearlyWhite : Colors.deepPurple;
  }

  Color isSelectedIcon(int index) {
    return index != selected ? ColorConstants.nearlyWhite : Colors.deepPurple;
  }

  double frameWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
