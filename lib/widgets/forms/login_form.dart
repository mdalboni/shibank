import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shibank/models/user.dart';
import 'package:shibank/routes.dart';
import 'package:shibank/services/validators/text_validator.dart';
import 'package:shibank/services/validators/validator_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginForm extends StatefulWidget {
  final String field1;
  final String field2;
  final String password;

  LoginForm({this.field1, this.field2, this.password});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  _FormController ctrl;
  final _formKey = GlobalKey<FormState>();
  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    ctrl = _FormController(
      field1: TextEditingController(),
      field2: TextEditingController(),
      password: TextEditingController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final field1 = TextFormField(
      enabled: !_inProgress,
      validator: (value) {
        return validateAll(
          [() => emptyText(value), () => minLengthText(value, size: 1)],
        );
      },
      controller: ctrl.field1,
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.field1,
      ),
    );

    final field2 = TextFormField(
      enabled: !_inProgress,
      validator: (value) {
        return validateAll(
          [() => emptyText(value), () => minLengthText(value, size: 3)],
        );
      },
      controller: ctrl.field2,
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.field2,
      ),
    );

    final password = TextFormField(
      enabled: !_inProgress,
      validator: (value) {
        return validateAll(
          [() => emptyText(value), () => minLengthText(value, size: 3)],
        );
      },
      controller: ctrl.password,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.password,
      ),
    );

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              field1,
              Padding(
                padding: EdgeInsets.all(5),
              ),
              widget.field2 != null
                  ? field2
                  : Container(
                      height: 0,
                    ),
              widget.field2 != null
                  ? Padding(
                      padding: EdgeInsets.all(5),
                    )
                  : Container(
                      height: 0,
                    ),
              password,
              Padding(
                padding: EdgeInsets.all(5),
              ),
              ArgonButton(
                height: 50,
                width: 500,
                borderRadius: 5.0,
                color: Colors.deepPurple,
                animationDuration: Duration(milliseconds: 500),
                child: Text(
                  "Entrar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                loader: Container(
                  padding: EdgeInsets.all(10),
                  child: SpinKitHourGlass(
                    color: Colors.white,
                  ),
                ),
                onTap: login,
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                  style: BorderStyle.solid,
                ),
                padding: EdgeInsets.only(left: 25, right: 25),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {},
                child: Text(
                  "Criar Conta",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  login(startLoading, stopLoading, btnState) async {
    bool isValid = _formKey.currentState.validate();
    bool isIdle = btnState == ButtonState.Idle;
    if (!isValid || !isIdle) return;
    setState(() {
      _inProgress = !_inProgress;
    });
    startLoading();
    await Future.delayed(Duration(seconds: 2));
    if (ctrl.field1.text == '123') {
      Get.toNamed(Routes.logged, arguments: User.generateUser('123'));
      return;
    }
    stopLoading();
    setState(() {
      _inProgress = !_inProgress;
    });
  }
}

class _FormController {
  final TextEditingController field1;
  final TextEditingController field2;
  final TextEditingController password;

  get field1Text => field1.text;

  get field2Text => field2.text;

  get passwordText => password.text;

  get formValues => {
        'field1': field1.text,
        'field2': field2.text,
        'password': password.text,
      };

  _FormController({this.field1, this.field2, this.password});
}
