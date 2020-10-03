import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shibank/routes.dart';
import 'package:shibank/widgets/logo.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String step = 'Inicializando o app';

  Future<void> startApp() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      step = 'Aguardando permissões';
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      step = 'Verificando conexão';
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      step = 'Inicializando modulo de proteção';
    });
    Get.toNamed(Routes.login);
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => startApp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Hero(
                  child: Logo(),
                  tag: 'logo',
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SpinKitDualRing(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(
                    step,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
