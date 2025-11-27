import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/navigation/menu/DrawerMenu.dart';
import 'package:colegio_americano/src/ui/view_model/LoginScreenViewModel.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with RootScreenMixin {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String _userName;
  late String _password;
  bool isVisible = false;

  LoginScreenViewModel _viewModel = LoginScreenViewModel();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    BackButtonInterceptor.remove(onBackPressed);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context).translate('menu_title_login')),
      ),
      drawer: DrawerMenu(),
      key: scaffoldKey,
      body: SafeArea(
        child: new SingleChildScrollView(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _formSection()
            ],
          ),
        ),
      ),
    );
  }

  _sectionButtons() {
    return Container(
      height: 50.0,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 7.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text(
              AppLocalizations.of(context).translate('menu_title_login'),
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  _formSection() {
    return SafeArea(
      top: false,
      bottom: false,
      child: Card(
        elevation: 5.0,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          // autovalidate: _autoValidate,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 24.0),
                _userNameField(),
                SizedBox(height: 24.0),
                _passwordField(),
                SizedBox(height: 35.0),
                _buttonsAndLinks(),
              ],
            ),
          ),
        ), //login,
      ),
    );
  }

  _userNameField() => TextFormField(
        decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black87, style: BorderStyle.solid),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black87, style: BorderStyle.solid),
            ),
            icon: Icon(
              Icons.account_box,
              color: Colors.black38,
            ),
            hintText: AppLocalizations.of(context).translate('username_label'),
            labelText: AppLocalizations.of(context).translate('username_label'),
            labelStyle: TextStyle(color: Colors.black54)),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != null && value.isEmpty)
            return AppLocalizations.of(context).translate('empty_validation');
          return null;
        },
        onSaved: (value) => _userName = value ?? "",
      );

  _passwordField() {
    return StreamBuilder(
      stream: _viewModel.passwordStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        bool visible = false;
        if (snapshot.hasData) {
          visible = snapshot.data!;
        }
        return TextFormField(
          obscureText: !visible,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                isVisible = !isVisible;
                _viewModel.passwordStreamSink(isVisible);
              },
              child: Icon(
                visible ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black87, style: BorderStyle.solid),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black87, style: BorderStyle.solid),
            ),
            icon: Icon(
              Icons.lock,
              color: Colors.black38,
            ),
            hintText: AppLocalizations.of(context).translate('password_label'),
            labelText: AppLocalizations.of(context).translate('password_label'),
            labelStyle: TextStyle(color: Colors.black54),
          ),
          validator: (value) {
            if (value != null && value.isEmpty)
              return AppLocalizations.of(context).translate('empty_validation');
            return null;
          },
          onSaved: (val) => _password = val ?? "",
        );
      },
    );
  }

  _buttonsAndLinks() => new Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              alignment: Alignment.bottomRight,
            ),
            new Container(
              alignment: Alignment.bottomRight,
              child: new GestureDetector(
                onTap: () => _submit(context),
                child: Text(
                  AppLocalizations.of(context).translate('login_button_label'),
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );

  _submit(BuildContext context) {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      _viewModel.doLogin(context, _userName, _password);
    }
  }
}
