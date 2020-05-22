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
          ],
        ),
      ),
    );
  }
}
