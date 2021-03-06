import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shibank/models/user.dart';
import 'package:shibank/routes.dart';
import 'package:shibank/services/validators/text_validator.dart';
import 'package:shibank/services/validators/validator_manager.dart';

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
  final FocusNode field1Focus = FocusNode();
  final FocusNode field2Focus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

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
      focusNode: field1Focus,
      onFieldSubmitted: (value) => field2Focus.requestFocus(),
      textInputAction: TextInputAction.go,
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
      focusNode: field2Focus,
      onFieldSubmitted: (value) => passwordFocus.requestFocus(),
      textInputAction: TextInputAction.go,
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
      focusNode: passwordFocus,
      onFieldSubmitted: (value) => login(),
      textInputAction: TextInputAction.send,
    );

    Widget buttonContent = Text(
      'Acessar',
      style: Theme.of(context).textTheme.button,
    );

    Widget loadingContent = Container(
        width: 25,
        height: 25,
        child: SpinKitDoubleBounce(
          color: Colors.white,
        )
      // CircularProgressIndicator(
      //     backgroundColor: Colors.white,
      //     valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepPurple),
      //     strokeWidth: 5,
      //   )
    );

    Widget submitButton = AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: _inProgress ? 50 : MediaQuery.of(context).size.width,
      height: 50,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        child: !_inProgress ? buttonContent : loadingContent,
        color: Colors.deepPurple,
        disabledColor: Colors.deepPurple[400],
        shape: !_inProgress
            ? null
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
        onPressed: _inProgress ? null : login,
      ),
    );

    Widget createAccButton = OutlineButton(
      borderSide: BorderSide(
        color: Colors.deepPurple,
        width: 2,
        style: BorderStyle.solid,
      ),
      padding: EdgeInsets.only(left: 25, right: 25),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      onPressed: _inProgress ? null : () {},
      child: Text(
        "Criar Conta",
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
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
              widget.field2 != null ? field2 : Container(height: 0),
              widget.field2 != null
                  ? Padding(padding: EdgeInsets.all(5))
                  : Container(height: 0),
              password,
              Padding(padding: EdgeInsets.all(5)),
              submitButton,
              Padding(
                padding: EdgeInsets.all(5),
              ),
              createAccButton,
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    bool isValid = _formKey.currentState.validate();
    if (!isValid) return;
    setState(() {
      _inProgress = !_inProgress;
    });
    await Future.delayed(Duration(seconds: 2));
    if (ctrl.field1.text == '123') {
      Get.toNamed(Routes.logged, arguments: User.generateUser('123'));
    }
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
