import 'package:flutter/material.dart';

import '../widgets/form_header.dart';
import '../widgets/navigation_action.dart';
import './register_screen.dart';
import './password_forget_screen.dart';
import './home_screen.dart';

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
          NavigateAction(
            'Forgot Password',
            () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PasswordForgetScreen(),
                ),
              );
            },
          ),
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
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                HomeScreen.routeName,
              );
            },
          ),
        ),
        SizedBox(height: 10),
        NavigateAction(
          'SIGN UP',
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterScreen(),
              ),
            );
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
