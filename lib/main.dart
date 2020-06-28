import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _ctrlUsername, _ctrlPassword;
  bool _showPassword = false, _rememberMe = true;

  @override
  void initState() {
    super.initState();
    _ctrlUsername = TextEditingController();
    _ctrlPassword = TextEditingController();
  }

  @override
  void dispose() {
    _ctrlUsername.dispose();
    _ctrlPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _renderLogo(),
                _renderTextField(),
                _renderPassword(),
                _renderRememberMe(),
                _renderLoginButton(),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey[900], fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(text: "Don't have a account? "),
                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pressRememberMe(val) {
    setState(() {
      this._rememberMe = val;
    });
  }

  Widget _renderLogo() {
    return Container(
      alignment: Alignment.center,
      // height: lebar,
      child: Text(
        "LOGO",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
      ),
    );
  }

  Widget _renderTextField() {
    return TextFormField(
      controller: _ctrlUsername,
      decoration: InputDecoration(
        labelText: "Username",
      ),
    );
  }

  Widget _renderPassword() {
    return TextFormField(
      controller: _ctrlPassword,
      obscureText: !_showPassword,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: GestureDetector(
          child: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
      ),
    );
  }

  Widget _renderRememberMe() {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () => _pressRememberMe(!_rememberMe),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _rememberMe,
                    onChanged: _pressRememberMe,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Remember Me"),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Text(
              "Forgot Password",
              textAlign: TextAlign.right,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderLoginButton() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 30),
      child: RaisedButton(
        child: Text(
          "LOGIN",
          style: TextStyle(color: Colors.white),
        ),
        color: Theme.of(context).accentColor,
        onPressed: () {},
      ),
    );
  }
}
