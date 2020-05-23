import 'package:flutter/material.dart';

import '../widgets/form_header.dart';
import '../widgets/navigation_action.dart';
import './login_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            FormHeader('Register'),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: _LoginForm(),
              ),
            ),
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
                labelText: "Username",
                hintText: "Jazim Abbas",
                border: const OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: "email",
              hintText: "example@example.com",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password Confirmation",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
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
              'SIGN UP',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(height: 10),
        NavigateAction(
          'SIGN IN',
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
