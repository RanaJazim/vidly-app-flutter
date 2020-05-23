import 'package:flutter/material.dart';

import '../clippers/form_clipper.dart';

final img =
    "https://images.unsplash.com/photo-1501854140801-50d01698950b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60";

class FormHeader extends StatelessWidget {
  final String title;

  FormHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: FormClipper(),
          child: Image.network(
            img,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipOval(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Color(0xffee5164),
                ),
                child: Text(
                  '$title',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
