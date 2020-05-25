import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/form_header.dart';
import '../widgets/navigation_action.dart';
import './login_screen.dart';
import '../providers/auth.dart';

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

class _LoginForm extends StatefulWidget {
  @override
  __LoginFormState createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  var isLoad = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _registerUser() async {
    setState(() {
      isLoad = true;
    });

    final auth = Provider.of<Auth>(context, listen: false);

    try {
      await auth.register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );

      // all done should be navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      );
    } catch (ex) {
      setState(
        () {
          isLoad = false;
        },
      );

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
            controller: _nameController,
            decoration: InputDecoration(
                labelText: "Username",
                hintText: "Jazim Abbas",
                border: const OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "example@example.com",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 35),
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
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    _registerUser();
                  },
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
