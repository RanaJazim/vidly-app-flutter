import 'package:flutter/material.dart';

import '../widgets/form_header.dart';
import '../widgets/navigation_action.dart';
import './login_screen.dart';

class PasswordForgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            FormHeader('Forget Password'),
            // SizedBox(height: 60),
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
                labelText: "Email",
                hintText: "example@example.com",
                border: const OutlineInputBorder()),
          ),
          SizedBox(height: 50),
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
              'SUBMIT',
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
          'BACK',
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
