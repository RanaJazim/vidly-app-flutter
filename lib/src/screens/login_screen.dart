import 'package:flutter/material.dart';

import '../widgets/form_header.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            FormHeader('Login'),
            // SizedBox(height: 60),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: _LoginForm(),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(left: 20, right: 20),
            //   child: _ActionButtons(),
            // ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "example@example.com",
                border: const OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          _NavigateAction('Forgot Password'),
          SizedBox(height: 120),
          _ActionButtons(),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: FlatButton(
            color: const Color(0xffee5164),
            child: const Text(
              'SIGN IN',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(height: 10),
        _NavigateAction('SIGN UP'),
        SizedBox(height: 10),
      ],
    );
  }
}

class _NavigateAction extends StatelessWidget {
  final String title;

  _NavigateAction(this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(right: 20),
        child: Text(
          '$title',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
