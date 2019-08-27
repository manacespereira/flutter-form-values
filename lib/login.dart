import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = "";
  String _password = "";
  final _formKey = GlobalKey<FormState>();

  buildDecoration({Icon icon, String hintText}) {
    return InputDecoration(
      icon: icon,
      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  login() {
    final form = _formKey.currentState;
    form.save();

    if (!form.validate()) return;

    if (_username != "manaces" || _password != "123123") {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Incorrect username or password")));
      return;
    }

    showDialog(
      builder: (BuildContext context) => AlertDialog(
        content: Text("Username $_username logged successfully"),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  onSaved: (val) => setState(() => _username = val),
                  validator: (val) {
                    if (val.isEmpty) return "Required field";
                    return null;
                  },
                  decoration: buildDecoration(
                      hintText: "Username", icon: Icon(Icons.account_circle)),
                ),
                SizedBox(height: 30),
                TextFormField(
                  onSaved: (val) => setState(() => _password = val),
                  validator: (val) {
                    if (val.isEmpty) return "Required field";
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: buildDecoration(
                      hintText: "Password", icon: Icon(Icons.lock)),
                ),
                SizedBox(height: 30),
                RaisedButton(
                  onPressed: login,
                  child: Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
