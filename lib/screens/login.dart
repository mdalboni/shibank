import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shibank/widgets/buttons/2fa_buttons.dart';
import 'package:shibank/widgets/custom_painter.dart';
import 'package:shibank/widgets/forms/login_form.dart';
import 'package:shibank/widgets/logo.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _enabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: CurvePainter(),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _enabled = !_enabled;
                      });
                    },
                    child: ShakeAnimatedWidget(
                      enabled: _enabled,
                      duration: Duration(seconds: 2),
                      shakeAngle: Rotation.deg(y: 40, z: 0),
                      curve: Curves.linear,
                      child: Hero(
                        child: Logo(),
                        tag: 'logo',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.40,
                left: MediaQuery.of(context).size.height * 0.10,
                right: MediaQuery.of(context).size.height * 0.10,
                child: SingleChildScrollView(
                  child: LoginForm(
                    field1: 'Agencia',
                    field2: 'Conta',
                    password: 'Senha',
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: AuthButtons());
  }
}
