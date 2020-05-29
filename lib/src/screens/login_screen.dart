import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/form_header.dart';
import '../widgets/navigation_action.dart';
import './register_screen.dart';
import './password_forget_screen.dart';
import '../providers/auth.dart';

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

class _LoginForm extends StatefulWidget {
  @override
  __LoginFormState createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  var isLoad = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _loginUser() async {
    setState(() {
      isLoad = true;
    });

    final auth = Provider.of<Auth>(context, listen: false);

    try {
      await auth.login(
        _emailController.text,
        _passwordController.text,
      );

      // Navigator.pushReplacementNamed(
      //   context,
      //   HomeScreen.routeName,
      // );
    } catch (ex) {
      if (this.mounted) {
        setState(() {
          isLoad = false;
        });
      }

      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Something Wrong'),
            content: Text(
              '${ex.toString()}',
              style: TextStyle(fontSize: 12),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.pop(ctx);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "example@example.com",
                border: const OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
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
          _actionButtons(context),
        ],
      ),
    );
  }

  Widget _actionButtons(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        isLoad
            ? Center(child: CircularProgressIndicator())
            : SizedBox(
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
                    _loginUser();
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
